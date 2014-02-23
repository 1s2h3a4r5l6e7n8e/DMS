using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using System.Data;
using Globals;
using Auditor;

public partial class Admin_Default2 : System.Web.UI.Page
{

    string connString = StaticVariables.ConnectionString;
    int CurrentUserID;


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CurrentUserID = int.Parse(Session["EmployeeID"].ToString());

            if (int.Parse(Session["AccessLevel"].ToString()) != 1)
            {
                btnAddEmployee.Enabled = false;
                btnAddEmployee.Text = "Add Employee (Disabled due limited account.)";
            }

            if (!IsPostBack)
            {
                SqlDS_Employees.SelectCommand = "SELECT * FROM [Employees] WHERE EmployeeID !='" + CurrentUserID.ToString() + "'  ORDER BY EmployeeID DESC";
            }

        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }

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
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        if (ddlSearch.SelectedValue != "")
        {
            string strSelect = "SELECT * FROM Employees WHERE " + ddlSearch.SelectedValue + " LIKE @entry AND EmployeeID !='" + CurrentUserID.ToString() + "'  ORDER BY EmployeeID DESC";
            SqlParameter[] SearchVal = { new SqlParameter("@entry", "%" + AntiXSSMethods.CleanString(txtSearch.Text) + "%") };
            DataSet ds = DataAccess.DataProcessReturnData(strSelect, SearchVal, connString);

            GrdEmployees.DataSourceID = string.Empty;
            GrdEmployees.DataSource = ds;
            GrdEmployees.DataBind();
        }
        else
        {
 
        }


    }
}