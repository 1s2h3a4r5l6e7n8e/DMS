using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using Globals;
using System.Data.SqlClient;
using CustomStrings;
using Auditor;

public partial class Admin_ViewAnnouncements : System.Web.UI.Page
{

    int AnnouncementID;

    string conString = StaticVariables.ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            AnnouncementID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(AnnouncementID);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }


    private void loaddata(int _AID)
    {
        string strSelect = "SELECT * FROM Announcement WHERE AnnouncementID=@AID";
        SqlParameter[] ID = { new SqlParameter("@AID", _AID) };
        SqlDataReader dr = DataAccess.ReturnReader(strSelect, ID, conString);
        dr.Read();

        txtSubject.Text = dr["Subject"].ToString();
        txtMsg.Text = Server.HtmlDecode(dr["Message"].ToString());
        lblDatePosted.Text = dr["DateCreated"].ToString();

        dr.Close();

        DataAccess.ForceConnectionToClose();
    }

    private bool CheckInputs()
    {
        if (txtMsg.Text.Trim() != "" && txtSubject.Text.Trim() != "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (CheckInputs())
        {
            string strUpdate = "UPDATE Announcement SET Message=@message, Subject=@subject WHERE AnnouncementID=@AID";
            SqlParameter[] UpdateParams = {
                                          new SqlParameter("@subject", AntiXSSMethods.CleanString(txtSubject.Text)),
                                          new SqlParameter("@message", Server.HtmlEncode(AntiXSSMethods.CleanString(txtMsg.Text))),
                                          new SqlParameter("@AID", AnnouncementID)
                                       };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, UpdateParams, conString);
            lblAlert.Text = "Announcement updated!";
        }
        else
        {
            lblAlert.Text = "Update failed. Some fields are blank.";
        }
    }
}