# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build

# Include any dependencies generated for this target.
include benchmarks/CMakeFiles/benchmark_bundle.dir/depend.make

# Include the progress variables for this target.
include benchmarks/CMakeFiles/benchmark_bundle.dir/progress.make

# Include the compile flags for this target's objects.
include benchmarks/CMakeFiles/benchmark_bundle.dir/flags.make

benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o: benchmarks/CMakeFiles/benchmark_bundle.dir/flags.make
benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/benchmarks/benchmark_bundle.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o -c /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/benchmarks/benchmark_bundle.cpp

benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.i"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/benchmarks/benchmark_bundle.cpp > CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.i

benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.s"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/benchmarks/benchmark_bundle.cpp -o CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.s

# Object files for target benchmark_bundle
benchmark_bundle_OBJECTS = \
"CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o"

# External object files for target benchmark_bundle
benchmark_bundle_EXTERNAL_OBJECTS =

bin/benchmark_bundle: benchmarks/CMakeFiles/benchmark_bundle.dir/benchmark_bundle.cpp.o
bin/benchmark_bundle: benchmarks/CMakeFiles/benchmark_bundle.dir/build.make
bin/benchmark_bundle: lib/libspii.dylib
bin/benchmark_bundle: lib/libmeschach.a
bin/benchmark_bundle: benchmarks/CMakeFiles/benchmark_bundle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/benchmark_bundle"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark_bundle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmarks/CMakeFiles/benchmark_bundle.dir/build: bin/benchmark_bundle

.PHONY : benchmarks/CMakeFiles/benchmark_bundle.dir/build

benchmarks/CMakeFiles/benchmark_bundle.dir/clean:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks && $(CMAKE_COMMAND) -P CMakeFiles/benchmark_bundle.dir/cmake_clean.cmake
.PHONY : benchmarks/CMakeFiles/benchmark_bundle.dir/clean

benchmarks/CMakeFiles/benchmark_bundle.dir/depend:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/benchmarks /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks/CMakeFiles/benchmark_bundle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : benchmarks/CMakeFiles/benchmark_bundle.dir/depend

