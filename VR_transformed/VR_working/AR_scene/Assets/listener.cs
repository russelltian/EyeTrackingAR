using UnityEngine;
using System.Collections;
using System;
using System.Net;
using System.IO;
using System.Net.Sockets;
//using Newtonsoft.Json;
using System.Threading;




public class listener : MonoBehaviour
{
    public GameObject target;
    private float r_x;
    private float r_y;
    private float r_z;

    internal Boolean socket_ready = false;
    internal String input_buffer = "";
    TcpClient tcp_socket;
    NetworkStream net_stream;
    Thread receiver;

    StreamWriter socket_writer;
    StreamReader socket_reader;

    private void Awake()
    {
        // r_x = 0.0F;
        // r_y = 0F;
        // r_z = 1.5F;
        // Vector3 local = new Vector3(r_x, r_y, r_z);
        // Vector3 world = transform.TransformPoint(local);
        // target.transform.position = world;
        receiver = new Thread(new ThreadStart(setupSocket));
    }


    void Update()
    {
        string received_data = readSocket();
        bool found = received_data != "" && received_data != "none";
        if (found)
        {
            Debug.Log(" received:" + received_data);
            float[] floatData = Array.ConvertAll(received_data.Split(','), float.Parse);
    
            r_x = floatData[0];
            r_y = floatData[1];
            r_z = floatData[2];

            Vector3 local = new Vector3(r_x, r_y, r_z);
            Vector3 world = transform.TransformPoint(local);
            target.transform.position = world;
            
        }
        
    }

    void OnApplicationQuit()
    {
        closeSocket();
    }

    // Helper methods for:
    //...setting up the communication
    public void setupSocket()
    {
        
        try
        {
            tcp_socket = new TcpClient();
            
            IPAddress ipAddress = IPAddress.Parse("192.168.43.48");
            IPEndPoint ipEndPoint = new IPEndPoint(ipAddress, 50000);
            tcp_socket.Connect(ipEndPoint);
            
            net_stream = tcp_socket.GetStream();
            socket_writer = new StreamWriter(net_stream);
            socket_reader = new StreamReader(net_stream);
            socket_ready = true;
        }
        catch (Exception e)
        {
            // Something went wrong
            Debug.Log("Socket error: " + e);
        }
    }

    //... writing to a socket...
    public void writeSocket(string line)
    {
        if (!socket_ready)
            return;

        line = line + "\r\n";
        socket_writer.Write(line);
        socket_writer.Flush();
    }

    //... reading from a socket...
    public String readSocket()
    {
        if (!socket_ready)
            return "";

        if (net_stream.DataAvailable)
            return socket_reader.ReadLine();

        return "";
    }

    //... closing a socket...
    public void closeSocket()
    {
        if (!socket_ready)
            return;

        socket_writer.Close();
        socket_reader.Close();
        tcp_socket.Close();
        socket_ready = false;
    }
}