#include <iostream>
#include <string.h>
#include <opencv2/opencv.hpp>
#include <opencv2/objdetect.hpp>
#include <chrono>
#include <thread>
#include "config.h"

#include <sys/socket.h> 
#include <netinet/in.h> 
#include <arpa/inet.h>
// to store queries results
#include <vector>
#include <boost/foreach.hpp>

#include <boost/geometry.hpp>
#include <boost/geometry/geometries/point.hpp>
#include <boost/geometry/geometries/box.hpp>

#include <boost/geometry/index/rtree.hpp>

#include <opencv2/aruco.hpp>

// for convenience

#define VIDEO_SRC "http://192.100.1.2:5000/stream/video.mjpeg"

using namespace cv;
using namespace std;
namespace bg = boost::geometry;
namespace bgi = boost::geometry::index;

typedef bg::model::point<int, 2, bg::cs::cartesian> point;
typedef bg::model::box<point> box;
typedef std::pair<box, unsigned> value;
typedef Point_<int> Point2i;

void calibration(){
    

    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 
    int counter = 1000;

    const char* done = "done\n";

    config conf;
    // auto p0 = make_pair<int, int>(0,1);
    // auto p1 = make_pair<int, int>(2,3);

    // conf.insert(p0,p1);

    // conf.load("example.txt");
    // conf.save("example.txt");

    //network
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        perror("socket failed"); 
        exit(EXIT_FAILURE); 
    } 


    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = inet_addr("192.168.42.52"); //server ip INADDR_ANY 192.168.43.48
    address.sin_port = htons( 50000 ); 

    cout<<"waiting for connection"<<endl;

    if (::bind(server_fd, (struct sockaddr *)&address,sizeof(address))<0) 
    { 
        perror("bind failed"); 
        exit(EXIT_FAILURE); 
    } 
    if (listen(server_fd, 3) < 0) 
    { 
        perror("listen"); 
        exit(EXIT_FAILURE); 
    } 
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
                    (socklen_t*)&addrlen))<0) 
    { 
        perror("accept"); 
        exit(EXIT_FAILURE); 
    } 
    cout<<"continuing"<<endl;

    //mode = 1
    string back_msg = to_string(1) + "\n";

    send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
    cout<<"sent "<<back_msg<<endl;

    back_msg = to_string(counter) + "\n";

    send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
    cout<<"sent "<<back_msg<<endl;


    VideoCapture cap(VIDEO_SRC); // open the streaming camera "http://192.168.9.4:5000/stream/video.mjpeg"
    if(!cap.isOpened()){  // check if we succeeded
        cout<<"cannot open camera"<<endl;
        // return -1;
    }

    for(;;)
    {
        // valread = read(new_socket, buffer, 1024);
        valread = recv(new_socket, buffer, 1024,0);
        cout<<"received "<<buffer<<endl;
        
        if(buffer[0]=='f') break;

        istringstream ss( buffer );

        string val_1, val_2;

        getline( ss, val_1, ' ' );
        getline( ss, val_2, ' ' );

        // cout<<"dbg"<<endl<<val_1<<endl<<val_2<<endl;


        Mat frame;
        vector<Vec3f> circles;

        // this_thread::sleep_for(chrono::milliseconds(1000));



        auto start = chrono::high_resolution_clock().now();
        //empty the buffer
        while(1){
            cap >> frame;
            // flip(frame,frame,1);
            // cv::rotate(frame, frame, cv::ROTATE_90_COUNTERCLOCKWISE);

            // imshow("outer world", frame );

            auto finish = chrono::high_resolution_clock().now();
            chrono::duration<double> elapsed = finish - start;

            if(elapsed.count() > 0.5){
                break;
            }

            char key = waitKey(10);
            if(key == 'q') break;
        }

        start = chrono::high_resolution_clock().now();

        while(circles.size()!=1){
            cap >> frame; // get a new frame from camera
            flip(frame,frame,1);
            cv::rotate(frame, frame, cv::ROTATE_90_COUNTERCLOCKWISE);
            Mat gray;
            cvtColor(frame, gray, COLOR_BGR2GRAY);
            threshold(gray,gray,100,255,3);
            HoughCircles(gray, circles, HOUGH_GRADIENT, 1, gray.rows/2, 100, 20, 0, 0 );
            auto finish = chrono::high_resolution_clock().now();
            chrono::duration<double> elapsed = finish - start;


            if(elapsed.count() > 1.0){
                cout<<"cannot find target for "<<elapsed.count()<<"secs"<<endl;
                break;
            }
        }

        if(circles.size()==1){
            Point center(cvRound(circles[0][0]), cvRound(circles[0][1]));
            int radius = cvRound(circles[0][2]);
            // draw the circle center
            circle( frame, center, 3, Scalar(0,255,0), -1, 8, 0 );
            // draw the circle outline
            circle( frame, center, radius, Scalar(0,0,255), 3, 8, 0 );

            conf.insert(int_pair(cvRound(circles[0][0]), cvRound(circles[0][1])), int_pair(stoi(val_1), stoi(val_2))) ;
        }
        

        

        // send(new_socket, done, strlen(done), 0);
        counter = stoi(val_2);
        string back_msg = to_string(counter) + "\n";
        send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
        cout<<"sent "<<back_msg<<endl;
        

        imshow("outer world", frame );

        char key = waitKey(30);
        if(key == 'q') break;
    }

    conf.save("calibration.txt");
}

Point2i get_display_coord( bgi::rtree< value, bgi::quadratic<16> > & rtree,config& conf, int_pair pixel_coord){
    

    // find values intersecting some area defined by a box
    // box query_box(point(654-10, 354-10), point(654+10, 354+10));
    // std::vector<value> result_s;
    // rtree.query(bgi::intersects(query_box), std::back_inserter(result_s));

    // note: in Boost.Geometry WKT representation of a box is polygon

    // display results
    // std::cout << "spatial query box:" << std::endl;
    // std::cout << bg::wkt<box>(query_box) << std::endl;
    // std::cout << "spatial query result:" << std::endl;
    // BOOST_FOREACH(value const& v, result_s){
    //     std::cout << bg::wkt<box>(v.first) << " - " << v.second << std::endl;
    // }

    // find ? nearest values to a point



    std::vector<value> result_n;

    cout<<"reflection"<<pixel_coord.first<<" "<< pixel_coord.second<<endl;
    rtree.query(bgi::nearest(point(pixel_coord.first, pixel_coord.second), 1), std::back_inserter(result_n));

    // std::cout << "knn query point:" << std::endl;
    // std::cout << bg::wkt<point>(point(654, 354)) << std::endl;
    // std::cout << "knn query result:" << std::endl;


    //need better implmentation here
    //now it only finds the closed point

    // BOOST_FOREACH(value const& v, result_n){
        // std::cout << bg::wkt<box>(v.first) << " - " << v.second << std::endl;
    int_pair key(bg::get<bg::min_corner, 0>(result_n[0].first) +1, bg::get<bg::min_corner, 1>(result_n[0].first) +1);
    // }
    int_pair val = conf.map[key];



    return Point2i(val.first, val.second);
}

void run(){

    cout<<"running normally"<<endl;
    VideoCapture cap(VIDEO_SRC); // open the streaming camera "http://192.168.9.4:5000/stream/video.mjpeg"
    if(!cap.isOpened()){  // check if we succeeded
        cout<<"cannot open camera"<<endl;
        // return -1;
    }

    Mat frame;
    vector<Vec3f> circles;

    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 

    //network
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        perror("socket failed"); 
        exit(EXIT_FAILURE); 
    } 


    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = inet_addr("192.168.42.52"); //server ip INADDR_ANY
    address.sin_port = htons( 50000 ); 

    cout<<"waiting for connection"<<endl;

    if (::bind(server_fd, (struct sockaddr *)&address,sizeof(address))<0) 
    { 
        perror("bind failed"); 
        exit(EXIT_FAILURE); 
    } 
    if (listen(server_fd, 3) < 0) 
    { 
        perror("listen"); 
        exit(EXIT_FAILURE); 
    } 
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
                    (socklen_t*)&addrlen))<0) 
    { 
        perror("accept"); 
        exit(EXIT_FAILURE); 
    } 
    cout<<"continuing"<<endl;



    // load calibrartion
    config conf;
    conf.load("calibration.txt");

     // create the rtree using default constructor
    bgi::rtree< value, bgi::quadratic<16> > rtree;
    int i = 0;
    for(auto it: conf.map){
        box b(point(it.first.first-1, it.first.second-1), point(it.first.first+1, it.first.second+1));

        // point p(it.first.first,it.first.second)

        rtree.insert(std::make_pair(b, i));
        i++;
    }

    string back_msg = to_string(0) + "\n";

    send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
    cout<<"sent "<<back_msg<<endl;


    cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_4X4_250);

    CascadeClassifier cascade;
    cascade.load( "haarcascade_frontalface_default.xml" );

    for(;;){
            cap >> frame; // get a new frame from camera
            flip(frame,frame,1);
            cv::rotate(frame, frame, cv::ROTATE_90_COUNTERCLOCKWISE);
            Mat gray;
            cvtColor(frame, gray, COLOR_BGR2GRAY);

/*          
            threshold(gray,gray,200,255,3);
            Canny(gray,gray,100,20,3);
            HoughCircles(gray, circles, HOUGH_GRADIENT, 1, gray.rows/2, 100, 20, 0, 200 );
            

            if(circles.size()>0){
                Point center(cvRound(circles[0][0]), cvRound(circles[0][1]));
                int radius = cvRound(circles[0][2]);
                // draw the circle center
                circle( frame, center, 3, Scalar(0,255,0), -1, 8, 0 );
                // draw the circle outline
                circle( frame, center, radius, Scalar(0,0,255), 3, 8, 0 );
                Point2i bottom_left = get_display_coord(rtree,conf, {center.x-radius,center.y-radius});
                Point2i top_right = get_display_coord(rtree,conf, {center.x+radius,center.y+radius});

                string back_msg = to_string(bottom_left.y) + " " +
                    to_string(bottom_left.x) + " " +
                    to_string(top_right.y) + " " +
                    to_string(top_right.x) + " \n";

                send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
                cout<<"sent "<<back_msg<<endl;
            }
            */

// /*qr code
            std::vector<int> ids;
            std::vector<std::vector<cv::Point2f> > corners;
            cv::aruco::detectMarkers(frame, dictionary, corners, ids);
            // if at least one marker detected
            if (ids.size() > 0){
                cv::aruco::drawDetectedMarkers(frame, corners, ids);

                cout<<"found "<<corners.front().size()<<"corners"<<endl;

                Point2i bottom_left = get_display_coord(rtree,conf, {(int)corners[0][0].x, (int)corners[0][0].y});
                Point2i top_right = get_display_coord(rtree,conf, {(int)corners[0][2].x, (int)corners[0][2].y});

                string back_msg = to_string(bottom_left.y) + " " +
                    to_string(bottom_left.x) + " " +
                    to_string(top_right.y) + " " +
                    to_string(top_right.x) + " \n";

                send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
                cout<<"sent "<<back_msg<<endl;

            }

// */
        // equalizeHist( gray, gray ); 
        // vector<Rect> faces;
        // cascade.detectMultiScale( gray, faces, 1.5, 2, 0|CASCADE_SCALE_IMAGE, Size(30, 30) ); 

        // string back_msg;
        // for ( size_t i = 0; i < faces.size(); i++ ){ 
        //     Rect r = faces[i]; 

        //     rectangle(frame,r,Scalar(255,255,255));

        //     Point2i bottom_left = get_display_coord(rtree,conf, {r.x, r.y+r.height});
        //     Point2i top_right = get_display_coord(rtree,conf, {r.x+r.width, r.y});

        //     back_msg += to_string(bottom_left.y) + " " +
        //             to_string(bottom_left.x) + " " +
        //             to_string(top_right.y) + " " +
        //             to_string(top_right.x) + " ";
        // }
        // back_msg+="\n";
        // send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
        // cout<<"sent "<<back_msg;

        imshow("outer world", frame );

        char key = waitKey(30);
        if(key == 'q') break;
            
    }

    

    



}

int main(int argc, char *argv[])
{

    cout<<"starting"<<endl;
    if(argc > 1) calibration();
    else run();
    
    return 0;
}

//uv4l --driver raspicam --auto-video_nr --width 1280 --height 768 --encoding mjpeg --server-option '--port=5000' --server-option '--bind-host-address=192.100.1.2' –frame-buffers 0
//sudo route add -host 192.100.1.2 -iface en47
//DNS 192.168.2.1 || 207.164.235.129