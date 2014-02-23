using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Auditor;

public partial class Admin_ManageTenants : System.Web.UI.Page
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
    protected void GrdTenants_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewTenants.aspx?ID=" + GrdTenants.SelectedDataKey["TenantID"].ToString());
    }
}