#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/imgcodecs.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/core/utility.hpp"
#include <opencv2/aruco.hpp>

#include <sys/types.h>
#include <sys/socket.h> 
#include <netinet/in.h> 
#include <arpa/inet.h>
#include <iostream>

#include <stdio.h>

#define RIGHT_CAM "http://192.100.1.2:5000/stream/video.mjpeg"
#define LEFT_CAM "http://192.100.2.2:5000/stream/video.mjpeg"
#define MSG_NOSIGNAL      0x2000  /* don't raise SIGPIPE */

using namespace cv;
using namespace std;


int main(int argc, char** argv)
{

    //setting up network
    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 

    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        perror("socket failed"); 
        exit(EXIT_FAILURE); 
    } 


    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = inet_addr("192.168.43.48"); //server ip INADDR_ANY 192.168.42.52
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



    VideoCapture left_cam(LEFT_CAM); 
    VideoCapture right_cam(RIGHT_CAM);
    if(!(left_cam.isOpened()&& right_cam.isOpened()))  // check if we succeeded
        return -1;

    namedWindow("left",1);
    namedWindow("right",1);

    
    // Ptr<StereoBM> bm = StereoBM::create(16,9);

    //Read intrinsice parameters
    string intrinsic_filepath = "intrinsics.yml";
    FileStorage fs(intrinsic_filepath, FileStorage::READ);
    if(!fs.isOpened())
    {
        printf("Failed to open intrinsics.yml");
        return -1;
    }
    Mat M1, D1, M2, D2;
    fs["M1"] >> M1;
    fs["D1"] >> D1;
    fs["M2"] >> M2;
    fs["D2"] >> D2;

    //Read Extrinsic Parameters
    string extrinsic_filepath = "extrinsics.yml";
    fs.open(extrinsic_filepath, FileStorage::READ);
    if(!fs.isOpened())
    {
        printf("Failed to open extrinsics");
        return -1;
    }

    Mat R, T, R1, P1, R2, P2;
    fs["R"] >> R;
    fs["T"] >> T;

    fs["R1"] >> R1;
    fs["R2"] >> R2;
    fs["P1"] >> P1;
    fs["P2"] >> P2;



    Mat frame1,frame2, gray1, gray2;
    int counter = 0;

    left_cam >> frame1;
    right_cam >> frame2;

    // Size img_size = frame1.size();
    // Rect roi1, roi2;
    // Mat Q;

    // stereoRectify( M1, D1, M2, D2, img_size, R, T, R1, R2, P1, P2, Q, CALIB_ZERO_DISPARITY, -1, img_size, &roi1, &roi2 );

    // Mat map11, map12, map21, map22;
    // initUndistortRectifyMap(M1, D1, R1, P1, img_size, CV_16SC2, map11, map12);
    // initUndistortRectifyMap(M2, D2, R2, P2, img_size, CV_16SC2, map21, map22);

    // int numberOfDisparities = 128;
    // int SADWindowSize = 9;

    // bm->setROI1(roi1);
    // bm->setROI2(roi2);
    // bm->setPreFilterCap(31);
    // bm->setBlockSize(SADWindowSize);
    // bm->setMinDisparity(0);
    // bm->setNumDisparities(numberOfDisparities);
    // bm->setTextureThreshold(10);
    // bm->setUniquenessRatio(15);
    // bm->setSpeckleWindowSize(0);
    // // bm->setSpeckleRange(32);
    // bm->setDisp12MaxDiff(1);

    Ptr<aruco::Dictionary> dictionary = aruco::getPredefinedDictionary(aruco::DICT_4X4_250);

    while(1){
        left_cam >> frame1;
        right_cam >> frame2;

        
        

        /************************* STEREO ***********************/

        cvtColor(frame1, gray1, COLOR_RGB2GRAY);
        cvtColor(frame2, gray2, COLOR_RGB2GRAY);

        //left
        std::vector<int> ids;
        std::vector<std::vector<Point2f> > left_corners;
        std::vector<std::vector<Point2f> > right_corners;
        aruco::detectMarkers(gray1, dictionary, left_corners, ids);
        // if at least one marker detected
        if (ids.size() > 0){
            aruco::drawDetectedMarkers(gray1, left_corners, ids);

            cout<<"found "<<left_corners.front().size()<<"left_corners"<<endl;

            cout<<"left: x: "<<left_corners[0][0].x<<"y: "<<left_corners[0][0].y<<endl;

        }
        //right
        aruco::detectMarkers(gray2, dictionary, right_corners, ids);
        // if at least one marker detected
        if (ids.size() > 0){
            aruco::drawDetectedMarkers(gray2, right_corners, ids);

            cout<<"found "<<right_corners.front().size()<<"right_corners"<<endl;

            cout<<"right: x: "<<right_corners[0][0].x<<"y: "<<right_corners[0][0].y<<endl;

        }
        if(!(left_corners.empty() || right_corners.empty())){
        

            vector<Point2f> undistCoords1;
            vector<Point2f> undistCoords2;


            undistortPoints(left_corners[0], undistCoords1, M1, D1, R1, P1);
            
            undistortPoints(right_corners[0], undistCoords2, M2, D2, R2, P2);

            Mat triangCoords4D;
            Mat projMat1 = P1;
            Mat projMat2 = P2;

            // cout<<"projMat1"<<endl<<projMat1<<endl;;

            triangulatePoints(projMat1, projMat2, undistCoords1, undistCoords2, triangCoords4D);

            Vec4f triangCoords1 = triangCoords4D.col(0);
            // Vec4f triangCoords2 = triangCoords4D.col(1);
            Vec3f Coords13D, Coords23D;
            for (unsigned int i = 0; i < 3; i++) { 
                    Coords13D[i] = triangCoords1[i] / triangCoords1[3];
                    
                // Coords23D[i] = triangCoords2[i] / triangCoords2[3];
            }
            // Mat pin(100,100, CV_8UC1, Scalar(0,0,0));
            // pin.at<int>(static_cast<int>(Coords13D[1])+50, static_cast<int>(Coords13D[0])+50) = static_cast<int>(Coords13D[2])+100;
            // imshow("pin",pin);
            cout<<"estimated: x: "<<Coords13D[0]<<" y: "<<Coords13D[1]<<" z: "<<Coords13D[2]<<endl;
            string back_msg = to_string(Coords13D[0]) + ","+ to_string(Coords13D[1]) + ","+to_string(Coords13D[2]) + "\n";
            cout<<back_msg;
            send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), MSG_NOSIGNAL);
        }else{
            string back_msg = "none\n";
            cout<<back_msg;
            send(new_socket, back_msg.c_str(), strlen(back_msg.c_str()), MSG_NOSIGNAL);
        }

        // Mat img1r, img2r;
        // remap(gray1, img1r, map11, map12, INTER_LINEAR);
        // remap(gray2, img2r, map21, map22, INTER_LINEAR);

        //find the aruco coordinate in grayscale images

        // Mat disp, disp8;
        // bm->compute(img1r, img2r, disp);
        // t = getTickCount() - t;
        // printf("Time elapsed: %fms\n", t*1000/getTickFrequency());

        // disp.convertTo(disp8, CV_8U, 255/(numberOfDisparities*16.));
        // imshow("disparity", disp8);


        imshow("left", gray1);
        imshow("right", gray2);

        char key = waitKey(30);
        if(key == 'q'){
            break;
        }
    }
    return 0;
}