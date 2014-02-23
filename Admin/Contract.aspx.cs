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

public partial class Admin_Contract : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID;
    int TenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
            TenantID = int.Parse(Request.QueryString["ID"]);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Contracts (TenantID, UnitTypeID, RoomID, BedSpaceID, Period, StartDate, EmployeeID, EndDate) VALUES (@tid, @utid, @rid, @bsid, @period, @startDate, @eid, @endDate)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@tid", TenantID),
                                         new SqlParameter("@utid", AntiXSSMethods.CleanString(ddlUnit.SelectedValue)),
                                         new SqlParameter("@rid", AntiXSSMethods.CleanString(ddlRoom.SelectedValue)),
                                         new SqlParameter("@bsid", AntiXSSMethods.CleanString(ddlBedside.SelectedValue)),
                                         new SqlParameter("@period", AntiXSSMethods.CleanString(ddlPeriod.SelectedValue)),
                                         new SqlParameter("@startDate", AntiXSSMethods.CleanString(txtDateStart.Text)),
                                         new SqlParameter("@eid", EmployeeID),
                                         new SqlParameter("@endDate", AntiXSSMethods.CleanString(txtEndDate.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Redirect("~/Admin/ManageTenant.aspx");
    }
}