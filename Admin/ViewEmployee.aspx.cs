using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;

public partial class Admin_ViewEmployee : System.Web.UI.Page
{

    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    int EmployeeID;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Request.QueryString["ID"]);
            loaddata(EmployeeID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }


    private void loaddata(int _EID)
    {
        SqlParameter [] EID = { new SqlParameter("@EID", _EID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Employees WHERE EmployeeID=@EID", EID, connString);
        dr.Read();
        lblEmpID.Text = EmployeeID.ToString();
        lblUN.Text = dr["UN"].ToString();
        ddlAdminAccess.SelectedValue = dr["AdminLevel"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();

        //for photo, if no photo then default nopic from FRIENDSTER will appear. haha.
        string photofile = dr["PhotoFile"].ToString();
        if (photofile.Trim() == "" || photofile == null)
        {
            ImgPhoto.ImageUrl = "~/images/nophoto.jpg";
        }
        else
        {
            ImgPhoto.ImageUrl = "~/uploads/" + photofile;
        }

        txtContactNo.Text = dr["ContactNo"].ToString();
        txtDOB.Text = dr["BDate"].ToString();
        txtDOE.Text = dr["DateOfEmployment"].ToString();
        txtEmailAdd.Text = dr["Email"].ToString();
        txtFName.Text = dr["FName"].ToString();
        txtLName.Text = dr["LName"].ToString();
        txtMName.Text = dr["MName"].ToString();





        DataAccess.ForceConnectionToClose();

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {

    }
}