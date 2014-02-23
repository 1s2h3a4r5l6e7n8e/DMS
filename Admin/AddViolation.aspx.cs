using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;
using Auditor;

public partial class Admin_AddViolation : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Violations (TenantID, EmployeeID, Title, Description, Fine) VALUES (@tid, @eid, @title, @desc, @fine)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@tid", AntiXSSMethods.CleanString(ddlTenant.SelectedValue)),
                                         new SqlParameter("@eid", EmployeeID),
                                         new SqlParameter("@title", AntiXSSMethods.CleanString(txtTitle.Text)),
                                         new SqlParameter("@desc", AntiXSSMethods.CleanString(txtDesc.Text)),
                                         new SqlParameter("@fine", AntiXSSMethods.CleanString(txtFine.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Redirect("~/Admin/ViolationMgt.aspx");
    }
}