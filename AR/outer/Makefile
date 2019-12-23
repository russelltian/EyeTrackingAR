
all: 
	g++ $(shell pkg-config --cflags --libs opencv4) \
	 -I/usr/local/Cellar/nlohmann-json/3.7.3/include/nlohmann\
	 -I/usr/local/Cellar/boost/1.71.0/include\
	 -std=c++17\
	 exterior.cpp config.cpp -o exterior
	# ./AR