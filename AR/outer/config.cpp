#include "config.h"

config::config(){
    
}

config::config(const string && file_name){
    
}



unordered_map<int_pair, int_pair, boost::hash<int_pair>> config::load(const string file_name){
    ifstream i_stream(file_name);
    

    if(!i_stream.is_open()){
        cout<<"source config file read error"<<endl;
        return map;
    }

    while (i_stream)
    {
    string s;
    if (!getline( i_stream, s )) break;

    istringstream ss( s );

    string key_1, key_2, val_1, val_2;

    getline( ss, key_1, ' ' );
    getline( ss, key_2, ' ' );
    getline( ss, val_1, ' ' );
    getline( ss, val_2, ' ' );

    map[int_pair(stoi(key_1), stoi(key_2))] = int_pair(stoi(val_1), stoi(val_2));

    }
    if (!i_stream.eof())
    {
    cerr << "Fooey!\n";
    }

    // for(auto it: map){
    //     cout<<it.first.first<<" "<<it.first.second<<" "<<it.second.first<<" "<<it.second.second<<" "<<endl;
    // }


    return map;
}

bool config::insert(int_pair first, int_pair second){

    if(map.find(first)!= map.end()) cout<<"overwriting"<<endl;

    map[first] = second;

    return true;
}

bool config::save(const string file_name){
    std::ofstream o_stream(file_name);

    for(auto it: map){
        cout<<it.first.first<<" "<<it.first.second<<" "<<it.second.first<<" "<<it.second.second<<" "<<endl;
        o_stream<<it.first.first<<" "<<it.first.second<<" "<<it.second.first<<" "<<it.second.second<<" "<<endl;
    }

    return true;
}


config::~config()
{
}
