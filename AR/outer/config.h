#pragma once
#include <iostream>
#include <iomanip>
// #include <nlohmann/json.hpp>
#include <fstream>
#include <unordered_map>
#include <boost/functional/hash.hpp>

using namespace std;

typedef std::pair<int,int> int_pair;
typedef std::pair<int_pair,int_pair> pair_pair;

class config
{
private:
    
public:
    unordered_map<int_pair, int_pair, boost::hash<int_pair>> map;
    
    config(/* args */);
    config(const string && file_name);

    unordered_map<int_pair, int_pair, boost::hash<int_pair> > load(const string file_name);

    bool insert(int_pair first, int_pair second);

    bool save(const string file_name);

    ~config();
};

