using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
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

    public string getAdminAccess(int _AccessLevel)
    {
        string AccessLevel = "";
        switch (_AccessLevel)
        {
            case 1:
                AccessLevel = "<font color='green'>Full</font>";
                break;
            case 2:
                AccessLevel = "<font color='red'>Limited</font>";
                break;
        }
        return AccessLevel;
    }



    protected void GrdEmployees_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewEmployee.aspx?ID=" + GrdEmployees.SelectedDataKey["EmployeeID"].ToString());
    }
}