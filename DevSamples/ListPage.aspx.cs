using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DevSamples_ListPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //eto yung ipapasa sa kabilang page
        string Sample_String_Na_Ipapasa1 = "Sharlene";
        string Sample_String_Na_Ipapasa2 = "Guelas";

        Response.Redirect("ViewPage.aspx?FName=" + Server.UrlEncode(Sample_String_Na_Ipapasa1) + "&LName=" + Server.UrlEncode(Sample_String_Na_Ipapasa2));

    }
}