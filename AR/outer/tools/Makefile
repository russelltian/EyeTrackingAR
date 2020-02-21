
all: 
	g++ $(shell pkg-config --cflags --libs opencv4) \
	 -I/usr/local/Cellar/nlohmann-json/3.7.3/include/nlohmann\
	 -I/usr/local/Cellar/boost/1.71.0/include\
	 -std=c++17\
	 -o calib stereo_calib.cpp

	g++ $(shell pkg-config --cflags --libs opencv4) \
	 -I/usr/local/Cellar/nlohmann-json/3.7.3/include/nlohmann\
	 -I/usr/local/Cellar/boost/1.71.0/include\
	 -std=c++17\
	 -o generate_calib_data generate_calib_data.cpp 

	g++ $(shell pkg-config --cflags --libs opencv4) \
	 -I/usr/local/Cellar/nlohmann-json/3.7.3/include/nlohmann\
	 -I/usr/local/Cellar/boost/1.71.0/include\
	 -std=c++17\
	 -o match stereo_match_real_time.cpp 