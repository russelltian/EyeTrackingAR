using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class profile_setup : MonoBehaviour
{

    public const string profile_url = "http://google.com/cardboard/cfg?p=CgdzZXJ2aWNlEgdzZXJ2aWNlHY_CdT0lpptEPSoQAAAgQgAAIEIAACBCAAAgQlgBNSlcDz06CI_Cdb0K16O8UAFgAA";
    // Start is called before the first frame update
    void Awake()
    {
        GvrCardboardHelpers.SetViewerProfile(profile_url);
        Debug.Log("Trying to change profile!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    // Update is called once per frame
    void Update()
    {
        // GvrCardboardHelpers.Recenter();
        // GvrCardboardHelpers.SetViewerProfile(profile_url);
    }

    
}
