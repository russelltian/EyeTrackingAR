using UnityEngine;
using System.Collections;
using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Text;

 
public class socket_receiver : MonoBehaviour {
 
    private TcpClient socketConnection; 	
	private Thread clientReceiveThread; 	
    private float r_x;
    private float r_y;
    private float r_z;
 
    private void ConnectToTcpServer () { 		
		try {  			
			clientReceiveThread = new Thread (new ThreadStart(ListenForData)); 			
			clientReceiveThread.IsBackground = true; 			
			clientReceiveThread.Start();  		
		} 		
		catch (Exception e) { 			
			Debug.Log("On client connect exception " + e); 		
		} 	
	}  

    private void ListenForData() { 		
		try { 			
			socketConnection = new TcpClient("192.168.43.48", 50000);  			
			Byte[] bytes = new Byte[1024];             
			while (true) { 				
				// Get a stream object for reading 				
				using (NetworkStream stream = socketConnection.GetStream()) { 					
					int length; 					
					// Read incomming stream into byte arrary. 					
					while (true) { 	
                        length = stream.Read(bytes, 0, bytes.Length);
                        if(length>0){
                            var incommingData = new byte[length]; 						
                            Array.Copy(bytes, 0, incommingData, 0, length); 						
                            // Convert byte array to string message. 						
                            string serverMessage = Encoding.ASCII.GetString(incommingData); 						
                            // Debug.Log("server message received as: " + serverMessage); 	
                            float[] floatData = Array.ConvertAll(serverMessage.Split(','), float.Parse);
    
                            r_x = floatData[0];
                            r_y = 0-floatData[1];
                            r_z = floatData[2];
                        }
						

					} 				
				} 			
			}         
		}         
		catch (SocketException socketException) {             
			Debug.Log("Socket exception: " + socketException);         
		}     
	}  
 
    // private void ReceiveCallback(IAsyncResult AR)
    // {
    //     //Check how much bytes are recieved and call EndRecieve to finalize handshake
    //     int recieved = _clientSocket.EndReceive(AR);

    //     Debug.Log("received a message");
 
    //     if(recieved <= 0)
    //         return;
 
    //     //Copy the recieved data into new buffer , to avoid null bytes
    //     byte[] recData = new byte[recieved];
    //     Buffer.BlockCopy(_recieveBuffer,0,recData,0,recieved);

    //     string bitString = BitConverter.ToString(recData); 

    //     float[] floatData = Array.ConvertAll(bitString.Split(','), float.Parse);
 
    //     //Process data here the way you want , all your bytes will be stored in recData
    //     r_x = floatData[0];
    //     r_y = floatData[1];
    //     r_z = floatData[2];
    //     //Start receiving again
    //     _clientSocket.BeginReceive(_recieveBuffer,0,_recieveBuffer.Length,SocketFlags.None,new AsyncCallback(ReceiveCallback),null);
    // }

    void Awake()
    {
        r_z = 5.5F;
        ConnectToTcpServer(); 
    }

    void Update()
    {
        //update the position
        transform.position =  new Vector3(r_x, r_y, r_z);

        //output to log the position change
        // Debug.Log(transform.position);
    }
}