#include <iostream>
#include <string.h>
#include <opencv2/opencv.hpp>
#include "config.h"

#include <sys/socket.h> 
#include <netinet/in.h> 
#include <arpa/inet.h>

// for convenience

#define VIDEO_SRC "http://192.100.1.2:5000/stream/video.mjpeg"

using namespace cv;
using namespace std;

void calibration(){
    VideoCapture cap(VIDEO_SRC); // open the streaming camera "http://192.168.9.4:5000/stream/video.mjpeg"
    if(!cap.isOpened()){  // check if we succeeded
        cout<<"cannot open camera"<<endl;
        return -1;
    }

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
    conf.save("example.txt");

    //network
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        perror("socket failed"); 
        exit(EXIT_FAILURE); 
    } 


    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = inet_addr("192.168.43.48"); //server ip INADDR_ANY
    address.sin_port = htons( 5000 ); 

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

    string back_msg = to_string(counter) + "\n";

    send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), 0);
    cout<<"sent "<<back_msg<<endl;


    for(;;)
    {
        Mat frame;
        cap >> frame; // get a new frame from camera


        flip(frame,frame,1);
        cv::rotate(frame, frame, cv::ROTATE_90_COUNTERCLOCKWISE);

        Mat gray;

        cvtColor(frame, gray, COLOR_BGR2GRAY);

        vector<Vec3f> circles;

        HoughCircles(gray, circles, HOUGH_GRADIENT, 1, gray.rows/2, 100, 20, 0, 0 );

        // valread = read(new_socket, buffer, 1024);
        valread = recv(new_socket, buffer, 1024,0);
        cout<<"received "<<buffer<<endl;
        
        if(buffer[0]=='f') break;

        istringstream ss( buffer );

        string val_1, val_2;

        getline( ss, val_1, ' ' );
        getline( ss, val_2, ' ' );

        cout<<"dbg"<<endl<<val_1<<endl<<val_2<<endl;

        for( size_t i = 0; i < circles.size(); i++ )
        {
            Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
            int radius = cvRound(circles[i][2]);
            // draw the circle center
            circle( frame, center, 3, Scalar(0,255,0), -1, 8, 0 );
            // draw the circle outline
            circle( frame, center, radius, Scalar(0,0,255), 3, 8, 0 );

            conf.insert(int_pair(cvRound(circles[i][0]), cvRound(circles[i][1])), int_pair(stoi(val_1), stoi(val_2))) ;

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

    conf.save("example.txt");
}

void run(){
    VideoCapture cap(VIDEO_SRC); // open the streaming camera "http://192.168.9.4:5000/stream/video.mjpeg"
    if(!cap.isOpened()){  // check if we succeeded
        cout<<"cannot open camera"<<endl;
        return -1;
    }

    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 
}

int main(int argc, char *argv[])
{


    if(argc > 1) calibration();
    else run();
    

}