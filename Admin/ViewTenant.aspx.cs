using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using ImageProcessor;
using System.IO;
using CustomStrings;
using Auditor;

public partial class Admin_ViewTenant : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int TenantID;
    string photofile, username;
    protected void Page_Load(object sender, EventArgs e)
    {

        TenantID = int.Parse(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            loaddata(TenantID);
            ViewState.Add("photofile", photofile);
            ViewState.Add("username", username);

            if (int.Parse(Session["AccessLevel"].ToString()) != 1)
            {
                btnResetPassword.Enabled = false;
                btnUpdate.Enabled = false;
                lblAlert.Text = "Your access level doesn't permit you to edit tenants details!";
            }
        }
        else
        {
            photofile = ViewState["photofile"].ToString();
            username = ViewState["username"].ToString();

        try
        {
            TenantID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(TenantID);
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

            Response.Redirect("ManageTenants.aspx");
            Response.Write(ex.Message);

        }
        }
    }

    private void loaddata(int _TID)
    {
        SqlParameter[] TID = { new SqlParameter("@TID", _TID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Tenants WHERE TenantID=@TID", TID, connString);
        dr.Read();
        lblTenantID.Text = TenantID.ToString();
        lblUN.Text = dr["UN"].ToString();
        username = dr["UN"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();
        photofile = dr["PhotoFile"].ToString();
        if (photofile.Trim() == "" || photofile == null)
        {
            ImgPhoto.ImageUrl = "~/images/nophoto.jpg";
        }
        else
        {
            ImgPhoto.ImageUrl = "~/uploads/" + photofile;
        }
        txtFName.Text = dr["FName"].ToString();
        txtMName.Text = dr["MName"].ToString();
        txtLName.Text = dr["LName"].ToString();
        txtDOB.Text = dr["BDate"].ToString();
        txtContactNo.Text = dr["MobileNo"].ToString();
        txtEmailAdd.Text = dr["Email"].ToString();
        txtStreet.Text = dr["Street"].ToString();
        txtCity.Text = dr["City"].ToString();
        txtRegion.Text = dr["Region"].ToString();
        txtCountry.Text = dr["Country"].ToString();

        DataAccess.ForceConnectionToClose();
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
                string NewFileName = NewFileName = "Tenant_" + username + "_" + StringCustomizers.dateStampNoID + FileExtension;

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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strUpdate = "UPDATE Tenants SET AdminLevel=@adminlevel, Gender=@gender, Photofile=@photofile, ContactNo=@contactno, BDate=@bdate, Email=@email, FName=@fname, MName=@mname, LName=@lname, Street=@street, City=@city, Region=@region, Country=@country WHERE TenantID=@TID";

            photofile = UploadPhoto();

            SqlParameter[] UpdateParams = {
                                          new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                          new SqlParameter("@photofile", photofile),
                                          new SqlParameter("@contactno", AntiXSSMethods.CleanString(txtContactNo.Text)),
                                          new SqlParameter("@bdate", Convert.ToDateTime(txtDOB.Text)),
                                          new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmailAdd.Text)),
                                          new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                          new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                          new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                          new SqlParameter("@street", AntiXSSMethods.CleanString(txtStreet.Text)),
                                          new SqlParameter("@city", AntiXSSMethods.CleanString(txtCity.Text)),
                                          new SqlParameter("@region", AntiXSSMethods.CleanString(txtRegion.Text)),
                                          new SqlParameter("@country", AntiXSSMethods.CleanString(txtCountry.Text)),
                                          new SqlParameter("@TID", TenantID)
                                       };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, UpdateParams, connString);
            loaddata(TenantID);
            lblAlert.Text = "Tenant information saved.";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnResetPass2_Click(object sender, EventArgs e)
    {
        if (Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)) == Session["KEY"].ToString())
        {
            string strResetPass = "UPDATE Tenants SET PWD='" + Encryption.MD5("12345") + "' WHERE TenantID=@TID";
            SqlParameter[] EID = { new SqlParameter("@TID", TenantID) };
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

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {

    }

}