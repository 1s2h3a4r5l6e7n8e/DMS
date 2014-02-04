using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using UserManagement;
using CustomStrings;

public partial class _Default : System.Web.UI.Page
{

    string ConnString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        
        // Checks if the credentials fit each table... there can only be one.
        int EmployeeID = Employees.CheckUser(txtUsername.Text, txtPassword.Text);
        int GuardianID = 0;
        int TenantID = 0;


        if (EmployeeID + GuardianID + TenantID == 0)
        {
            lblAlert.Text = "Check your credentials!";
        }

        if (EmployeeID != 0) 
        {
            Session.Add("EmployeeID", EmployeeID);
            Session.Add("AccessLevel", Employees.GetAccessLevel(EmployeeID));
            Session.Add("KEY", Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)));
            Response.Redirect("~/Admin/Default.aspx");
        }


    }
   

}