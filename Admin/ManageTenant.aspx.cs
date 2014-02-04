using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageTenant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getGender(int _genderID)
    {
        string gender = "";
        switch (_genderID)
        {
            case 1:
                gender = "Male";
                break;
            case 2:
                gender = "Female";
                break;
        }
        return gender;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/TenantReg.aspx");
    }
}