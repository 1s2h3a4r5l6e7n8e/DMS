using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;

public partial class Admin_AddRoom : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Rooms (RoomNo, UnitTypeID) VALUES (@roomNo, @unitType)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@roomNo", txtRoomNo.Text),
                                         new SqlParameter("@unitType", ddlUnitType.SelectedValue)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Redirect("~/Admin/RoomMgt.aspx");
    }
}