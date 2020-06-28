#include <iostream>
#include <string.h>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

#define LEFT_CAM "http://192.100.1.2:5000/stream/video.mjpeg"
#define RIGHT_CAM "http://192.100.2.2:5000/stream/video.mjpeg"

using namespace cv;
using namespace std;

int main(int, char**)
{
    VideoCapture left_cam(LEFT_CAM); 
    VideoCapture right_cam(RIGHT_CAM);
    if(!(left_cam.isOpened()&& right_cam.isOpened()))  // check if we succeeded
        return -1;

    namedWindow("left",1);
    namedWindow("right",1);

    int count = 0;
    for(;;)
    {
        Mat left_img,right_img;
        left_cam >> left_img; 
        right_cam >> right_img;


        imshow("left", left_img);
        imshow("right", right_img);

        char key = waitKey(30);
        if(key == 'n'){
            string left_filename = "left"+to_string(count)+".jpg";
            string right_filename = "right"+to_string(count)+".jpg";
            imwrite(left_filename,left_img);
            imwrite(right_filename,right_img);
            count++;
        }else if(key == 'q'){
            break;
        }
    }
    // the camera will be deinitialized automatically in VideoCapture destructor
    return 0;
}