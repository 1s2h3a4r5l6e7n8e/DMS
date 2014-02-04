using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RoomMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getBedside(int _bedspaceID)
    {
        string bedspace = "";
        switch (_bedspaceID)
        {
            case 1:
                bedspace = "Left/Top";
                break;
            case 2:
                bedspace = "Right/Bottom";
                break;
        }
        return bedspace;
    }
    protected void btnAddRoom_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddRoom.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddBedspace.aspx");
    }
}