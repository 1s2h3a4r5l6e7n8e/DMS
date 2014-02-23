using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using Auditor;

public partial class Admin_Announcement : System.Web.UI.Page
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
        string strInsert = "INSERT INTO Announcement (Subject, Message, EmployeeID) VALUES (@subject, @message, @eid)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@subject", AntiXSSMethods.CleanString(txtSubject.Text)),
                                         new SqlParameter("@message", Server.HtmlEncode(txtMsg.Text.Trim())),
                                         new SqlParameter("@eid", EmployeeID)
                                     };
        int newID = DataAccess.InsertAndGetIndex(strInsert, insertParam, conString);

        //DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        //Response.Write("<script>alert('Success!');</script>");
        Response.Redirect("ViewAnnouncement.aspx?ID=" + newID.ToString());
    }
}