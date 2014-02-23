using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using UserManagement;
using CustomStrings;
using Auditor;

public partial class Admin_ViewServiceRequest : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int ServiceRequestID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ServiceRequestID = int.Parse(Request.QueryString["ID"]);
        loaddata(ServiceRequestID);
    }

    private void loaddata(int _SRID)
    {
        SqlParameter[] SRID = { new SqlParameter("@srid", _SRID) };
        SqlDataReader dr = DataAccess.ReturnReader("Select * FROM ServiceRequest WHERE ServiceRequestID=@srid", SRID, connString);
        dr.Read();
        lblTenant.Text = dr["TenantID"].ToString();
        lblTitle.Text = dr["Title"].ToString();
        lblDetails.Text = dr["Details"].ToString();
        lblDateRequested.Text = dr["DateRequested"].ToString();
        //ddlEmp.SelectedValue = dr["EmployeeID"].ToString();
        ddlRemarks.SelectedValue = dr["Remarks"].ToString();
        ddlPriority.SelectedValue = dr["Priority"].ToString();
        txtDateCompleted.Text = dr["DateCompleted"].ToString();
        DataAccess.ForceConnectionToClose();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strUpdate = "UPDATE ServiceRequest SET EmployeeID=@eid, Remarks=@remarks, Priority=@priority, DateCompleted=@completed";
            SqlParameter[] updateParam = {
                                             new SqlParameter("@eid", AntiXSSMethods.CleanString(ddlEmp.SelectedValue)),
                                             new SqlParameter("@remarks", AntiXSSMethods.CleanString(ddlRemarks.SelectedValue)),
                                             new SqlParameter("@priority", AntiXSSMethods.CleanString(ddlPriority.SelectedValue)),
                                             new SqlParameter("@completed", AntiXSSMethods.CleanString(txtDateCompleted.Text))
                                         };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, connString);
            loaddata(ServiceRequestID);
            lblAlert.Text = "Update saved!";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}