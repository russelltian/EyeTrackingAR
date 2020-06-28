using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class profile_setup : MonoBehaviour
{

    public const string profile_url = "http://google.com/cardboard/cfg?p=CgR0ZXN0EgV2aXdlch2PwnU9Jc3MzD0qEAAAcEIAAHBCAABwQgAAcEJYATUpXA89OghvEoM6bxKDOlABYAA";
    // Start is called before the first frame update
    void Awake()
    {
        GvrCardboardHelpers.SetViewerProfile(profile_url);
    }

    // Update is called once per frame
    void Update()
    {
        // GvrCardboardHelpers.Recenter();
        // GvrCardboardHelpers.SetViewerProfile(profile_url);
    }

    
}
