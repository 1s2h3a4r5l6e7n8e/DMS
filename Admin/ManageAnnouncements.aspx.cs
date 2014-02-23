using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserManagement;
using Auditor;

public partial class Admin_ManageAnnouncements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetUsername(int _EID)
    {
        return Employees.ReturnUserName(_EID);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewAnnouncement.aspx?ID=" + GrdAnnouncements.SelectedDataKey["AnnouncementID"].ToString());
    }
}