using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using CustomStrings;
using ImageProcessor;
using System.IO;
using BCryptEncryption;
using Globals;
using Auditor;

public partial class Admin_ViewEmployee : System.Web.UI.Page
{

    string connString = StaticVariables.ConnectionString;

    int EmployeeID;

    string photofile, username;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(EmployeeID);
                ViewState.Add("photofile", photofile);
                ViewState.Add("username", username);

                if (int.Parse(Session["AccessLevel"].ToString()) != 1)
                {
                    btnResetPassword.Enabled = false;
                    btnUpdate.Enabled = false;
                    lblAlert.Text = "Your access level doesn't permit you to edit employee details";
                }

            }
            else
            {
                photofile = ViewState["photofile"].ToString();
                username = ViewState["username"].ToString();
            }
        }
        catch (Exception ex)
        {

            Response.Redirect("ManageEmployees.aspx");
            Response.Write(ex.Message);
        }
    }

    public string UploadPhoto()
    {
        string result;
        try
        {
            if (FupPhoto.HasFile)
            {

                ImageProcess img = new ImageProcess();
                Stream imgStream = FupPhoto.FileContent;

                //validates if file is a valid JPG/PNG image
                bool isValidType = img.ValidateImageFileType(imgStream);
                //validates if file meets valid size;
                bool isValidSize = img.ValidateImageFileSize(imgStream, 1048576);


                if (isValidType == false)
                {
                    return "invalid";
                }
                if (isValidSize == false)
                {
                    return "large";
                }

                string FileExtension = Path.GetExtension(FupPhoto.FileName).ToLower();
                string NewFileName = NewFileName = "Employee_" + username + "_" + StringCustomizers.dateStampNoID + FileExtension;

                FupPhoto.SaveAs(Server.MapPath(@"~/uploads/" + NewFileName));
                result = NewFileName;
            }
            else
            {
                result = photofile;
            }
        }
        catch (Exception ex)
        {
            result = "error: " + ex.Message;
        }
        finally
        {
            FupPhoto.Dispose();
        }
        return result;
    }

    private void loaddata(int _EID)
    {
        SqlParameter [] EID = { new SqlParameter("@EID", _EID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Employees WHERE EmployeeID=@EID", EID, connString);
        dr.Read();
        lblEmpID.Text = EmployeeID.ToString();
        lblUN.Text = dr["UN"].ToString();
        username = dr["UN"].ToString();
        ddlAdminAccess.SelectedValue = dr["AdminLevel"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();
        //for photo, if no photo then default nopic from FRIENDSTER will appear. haha.
        photofile = dr["PhotoFile"].ToString();
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
        txtMName.Text = dr["MName"].ToString();
        txtLName.Text = dr["LName"].ToString();

        DataAccess.ForceConnectionToClose();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {

            string strUpdate = "UPDATE Employees SET AdminLevel=@adminlevel, Gender=@gender, Photofile=@photofile, ContactNo=@contactno, BDate=@bdate, DateOfEmployment=@doe, Email=@email, FName=@fname, MName=@mname, LName=@lname WHERE EmployeeID=@EID";

            photofile = UploadPhoto();

            SqlParameter[] UpdateParams = {
                                          new SqlParameter("@adminlevel", AntiXSSMethods.CleanString(ddlAdminAccess.SelectedValue)),
                                          new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                          new SqlParameter("@photofile", photofile),
                                          new SqlParameter("@contactno", AntiXSSMethods.CleanString(txtContactNo.Text)),
                                          new SqlParameter("@bdate", Convert.ToDateTime(txtDOB.Text)),
                                          new SqlParameter("@doe", Convert.ToDateTime(txtDOE.Text)),
                                          new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmailAdd.Text)),
                                          new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                          new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                          new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                          new SqlParameter("@EID", EmployeeID)
                                       };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, UpdateParams, connString);
            loaddata(EmployeeID);
            lblAlert.Text = "Employee information saved.";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }


    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnResetPass2_Click(object sender, EventArgs e)
    {
        try
        {
            string key = Session["KEY"].ToString();
            //if (Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)) == Session["KEY"].ToString())
            if (BCrypt.CheckPassword(AntiXSSMethods.CleanString(txtPassword.Text), key))
            {
                //string strResetPass = "UPDATE Employees SET PWD='" + Encryption.MD5("12345") + "' WHERE EmployeeID=@EID";
                string strResetPass = "UPDATE Employees SET PWD='" + Encryption.GenerateBCryptHash("12345") + "' WHERE EmployeeID=@EID";
                SqlParameter[] EID = { new SqlParameter("@EID", EmployeeID) };
                DataAccess.DataProcessExecuteNonQuery(strResetPass, EID, connString);
                MPEResetPass.Hide();
                lblAlert.Text = "Password reset successful!";
            }
            else
            {
                lblAlert.Text = "Password reset not successful! You have entered your password incorrectly.";
                MPEResetPass.Hide();
            }
        }
        catch
        {

        }
    }
}