#include <iostream>
#include <opencv2/opencv.hpp>
#include "pupil_detector.h"

#include <sys/socket.h> 
#include <netinet/in.h> 


using namespace cv;
using namespace std;

//globals
int low_threshold = 20;
int high_threshold = 60;
int canny_threshold = 0;
int min_area = 300;//300;
int max_area = 3000;//500;

int ref_min_threshold;
int ref_max_threshold;

static void on_low_thresh_trackbar(int, void *)
{
    setTrackbarPos("Low threshold", "threshold", low_threshold);
}

static void on_high_thresh_trackbar(int, void *)
{
    setTrackbarPos("High threshold", "threshold", high_threshold);
}

static void on_min_area_thresh_trackbar(int, void *)
{
    setTrackbarPos("Min Area", "threshold", min_area);
}

static void on_max_area_thresh_trackbar(int, void *)
{
    setTrackbarPos("Max Area", "threshold", max_area);
}


void error(const char *msg)
{
    perror(msg);
    exit(0);
}

void send_point( int new_socket, int x, int y ) {
  int n;

  char buffer[32];
  sprintf( buffer, "%d %d\n", x, y);
  cout<<"sending point "<<x<<" "<<y<<endl;
  send(new_socket , buffer , strlen(buffer) , 0 ); 
  
}

Point_<int> findNearestPoint(Point_<float>center,Point_<float>input){

    Point_<int> ret;

    Point_<float> diff = input - center;
    double dist_to_point = cv::norm(diff);
    if(diff.x > 6){
        ret.x = 0;
    }else if (diff.x < -6){
        ret.x = 2;
    }else {
        ret.x = 1;
    }

    if(diff.y > 6){
        ret.y = 0;
    }else if (diff.y < -6){
        ret.y = 2;
    }else {
        ret.y = 1;
    }
    return ret;
}

int main(int argc, char *argv[])
{
    //variables for network
    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int opt = 1; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 

    bool calibration_phase = true;
    vector<vector<Point_<int>>> cali_map(3,vector<Point_<int>>());
    Point_<float> center;

    bool online = argc > 1;
    if(online){
            if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
        { 
            perror("socket failed"); 
            exit(EXIT_FAILURE); 
        } 

        // Forcefully attaching socket to the port 8080 
        // if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, 
        //                                             &opt, sizeof(opt))) 
        // { 
        //     perror("setsockopt"); 
        //     exit(EXIT_FAILURE); 
        // } 
        address.sin_family = AF_INET; 
        address.sin_addr.s_addr = INADDR_ANY; 
        address.sin_port = htons( 5000 ); 
        
        cout<<"here here"<<endl;
        // Forcefully attaching socket to the port 8080 
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
        // valread = read( new_socket , buffer, 1024); 
        // printf("%s\n",buffer ); 
        // send(new_socket , hello , strlen(hello) , 0 ); 
        // printf("Hello message sent\n"); 
        cout<<"exiting"<<endl;
    }
    

	

    //CV part

    VideoCapture cap("http://pi.local:5000/stream/video.mjpeg"); // open the default camera
    if(!cap.isOpened())  // check if we succeeded
        return -1;

    namedWindow("threshold",1);
    namedWindow("keypoints", 1);
    
    createTrackbar("Low threshold", "threshold", &low_threshold, 255, on_low_thresh_trackbar);
    createTrackbar("High threshold", "threshold", &high_threshold, 255, on_high_thresh_trackbar);
    createTrackbar("Min Area", "threshold", &min_area, 1000, on_min_area_thresh_trackbar);
    createTrackbar("Max Area", "threshold", &max_area, 10000, on_max_area_thresh_trackbar);
    
    pupil_detector left_pupil;
    
    // Filter by Area.
    left_pupil.filterByArea = true;
    
    // Filter by Circularity
    left_pupil.filterByCircularity = true;
    left_pupil.minCircularity = 0.6;
     
    // Filter by Convexity
    left_pupil.filterByConvexity = false;
    left_pupil.minConvexity = 0.87;
     
    // Filter by Inertia
    left_pupil.filterByInertia = false;
    left_pupil.minInertiaRatio = 0.01;
    
    //reflection detector
    pupil_detector reflection;
    // Filter by Area.
    reflection.filterByArea = true;
    
     
    // Filter by Circularity
    reflection.filterByCircularity = true;
    reflection.minCircularity = 0.6;
     
    // Filter by Convexity
    reflection.filterByConvexity = false;
    reflection.minConvexity = 0.87;
     
    // Filter by Inertia
    reflection.filterByInertia = false;
    reflection.minInertiaRatio = 0.01;
    
    reflection.filterByColor = true;
    reflection.blobColor = 1;
   
    for(;;)
    {

        Mat frame;
        cap >> frame; // get a new frame from camera
	
	//Rect myROI(125, 50, 200, 350);
	//Mat croppedImage = frame(myROI);
	Mat& croppedImage = frame;
	
	const int scale = 2;
	Mat small_frame( cvRound(croppedImage.rows/scale), cvRound(croppedImage.cols/scale), CV_8UC1);
	resize(croppedImage, small_frame, small_frame.size());
	
	
	
        cvtColor(small_frame, small_frame, COLOR_BGR2GRAY);
	
	GaussianBlur(small_frame, small_frame, Size(5,5), 1.5, 1.5);
	
	left_pupil.minThreshold = low_threshold;
	left_pupil.maxThreshold = high_threshold;
	left_pupil.minArea = min_area;
	left_pupil.maxArea = max_area;
	
	std::vector<KeyPoint> pupil_keypoints;
	std::vector<KeyPoint> ref_keypoints;
	left_pupil.detect( small_frame, pupil_keypoints);
	
	//detect reflection
	Mat binarizedImage;
	threshold(small_frame, binarizedImage, canny_threshold, 255, THRESH_BINARY);
	imshow("reflection", binarizedImage);
	
	// Draw detected blobs as red circles.
	// DrawMatchesFlags::DRAW_RICH_KEYPOINTS flag ensures the size of the circle corresponds to the size of blob
	Mat im_with_keypoints;
	drawKeypoints( small_frame, pupil_keypoints, im_with_keypoints, Scalar(0,255,0), DrawMatchesFlags::DRAW_RICH_KEYPOINTS );
	//drawKeypoints( im_with_keypoints, ref_keypoints, im_with_keypoints, Scalar(0,255,0), DrawMatchesFlags::DRAW_RICH_KEYPOINTS );
	
	
	/*
	for(KeyPoint kpt: pupil_keypoints){
	    Point2f pt = kpt.pt;
	    stringstream temp;
	    temp << "(" << pt.x << "," << pt.y << ")";
	    const char* str = temp.str().c_str();
	    cout << "Inside pupil for loop";
	    write(newsockfd,str, 30);
	    break;
	}
    */
	// Show blobs
	imshow("keypoints", im_with_keypoints );
	
	if(!pupil_keypoints.empty() ){
	    KeyPoint & kpt = pupil_keypoints.front();

        if(calibration_phase){
            send_point(new_socket,300, 500);
        }
        else if(online){

            Point_<int> target = findNearestPoint(center,kpt.pt);

            send_point(new_socket, cali_map[target.x][target.y].x,cali_map[target.x][target.y].y );        
            // send_point(new_socket,kpt.pt.x, kpt.pt.y);
        } 
	    
	    cout<<"x:"<<kpt.pt.x<<"y:"<<kpt.pt.y<<"num"<<pupil_keypoints.size()<<endl;
        
        char key = waitKey(30);
        if( key == 'q') break;
        else if(key == 'c'){
            calibration_phase = !calibration_phase;
            center = kpt.pt;
            for(int i = 0; i<=2;i++){
                // cali_map.push_back(vector<Point_<int>>());
                for(int j = 0; j<=2;j++){
                    cali_map[i].push_back(Point_<int>(300,500) + Point_<int>((i-1)*200,(j-1)*200));
                }
            }

        } 


        
	}
        
    }
    // the camera will be deinitialized automatically in VideoCapture destructor
    
    return 0;
}


// cv::VideoCapture cap("http://pi.local:5000/stream/video.mjpeg"); 
// sudo service uv4l_raspicam restart
// /etc/uv4l/uv4l-raspicam