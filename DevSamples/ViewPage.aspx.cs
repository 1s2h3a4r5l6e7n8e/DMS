﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DevSamples_ViewPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string FName = Server.UrlDecode(Request.QueryString["FName"]);
            string LName = Server.UrlDecode(Request.QueryString["LName"]);

            Response.Write(FName + " " + LName);
        }
        catch
        {
        }
    }
}