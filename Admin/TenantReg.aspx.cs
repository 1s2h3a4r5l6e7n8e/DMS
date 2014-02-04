using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using ImageProcessor;
using System.IO;

public partial class Admin_TenantReg : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

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
                string NewFileName = "Employee_" + StringCustomizers.dateStampNoID + FileExtension;

                FupPhoto.SaveAs(Server.MapPath(@"~/uploads/" + NewFileName));
                result = NewFileName;
            }
            else
            {
                result = "nofile";
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

    private bool checkInputs()
    {
        //to check each for blank entries
        if (txtFName.Text.Trim() == "")
        {
            return false;
        }
        if (txtMName.Text.Trim() == "")
        {
            return false;
        }
        if (txtLName.Text.Trim() == "")
        {
            return false;
        }
        if (ddlGender.SelectedValue.Trim() == "")
        {
            return false;
        }
        if (txtBDay.Text.Trim() == "")
        {
            return false;
        }
        if (txtContact.Text.Trim() == "")
        {
            return false;
        }
        if (txtEmail.Text.Trim() == "")
        {
            return false;
        }
        if (txtStreet.Text.Trim() == "")
        {
            return false;
        }
        if (txtCity.Text.Trim() == "")
        {
            return false;
        }
        if (txtRegion.Text.Trim() == "")
        {
            return false;
        }
        if (txtCountry.Text.Trim() == "")
        {
            return false;
        }
        if (txtUN.Text.Trim() == "")
        {
            return false;
        }
        if (txtPwd1.Text.Trim() == "")
        {
            return false;
        }
        if (txtPwd2.Text.Trim() == "")
        {
            return false;
        }

        //checks if password 1 and 2 are similar
        if (txtPwd1.Text.Trim() != txtPwd2.Text.Trim())
        {
            return false;
        }

        //checks if int and datetime objects are valid

        try
        {
            DateTime.Parse(txtBDay.Text.Trim());
        }
        catch
        {
            return false;
        }

        return true;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strImageFile = UploadPhoto();

        if ((strImageFile == "nofile") || (strImageFile != "large" && strImageFile != "invalid"))
        {

            if (strImageFile == "nofile")
            {
                strImageFile = "";
            }

            if (checkInputs())
            {
                bool UsernameExists = UserManagement.General.CheckIfExisting(txtUN.Text);
                if (UsernameExists != true)
                {
                    string strInsert = "INSERT INTO Tenants WHERE (FName, MName, LName, Gender, Email, BDate, Street, City, Region, Country, MobileNo, UN, Pwd) VALUES (@fname, @mname, @lname, @gender, @email, @bdate, @street, @city, @region, @country, @mobileNo, @un, @pwd)";
                    SqlParameter[] insertParam = {
                                                         new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                                         new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                                         new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                                         new SqlParameter("@gender", ddlGender.SelectedValue),
                                                         new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmail.Text)),
                                                         new SqlParameter("@bdate", AntiXSSMethods.CleanString(txtBDay.Text)),
                                                         new SqlParameter("@street", AntiXSSMethods.CleanString(txtStreet.Text)),
                                                         new SqlParameter("@city", AntiXSSMethods.CleanString(txtCity.Text)),
                                                         new SqlParameter("@region", AntiXSSMethods.CleanString(txtRegion.Text)),
                                                         new SqlParameter("@country", AntiXSSMethods.CleanString(txtCountry.Text)),
                                                         new SqlParameter("@mobileNo", AntiXSSMethods.CleanString(txtContact.Text)),
                                                         new SqlParameter("@un", AntiXSSMethods.CleanString(txtUN.Text)),
                                                         new SqlParameter("@pwd", Encryption.MD5(AntiXSSMethods.CleanString(txtPwd2.Text)))
                                                     };
                    DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
                    Response.Write("<script>alert('Success!');</script>");
                }
                else
                {
                    lblAlert.Text = "Username already taken!";
                }
            }
            else
            {
                lblAlert.Text = "Invalid or Blank Inputs!";
            }
        }
        else if (strImageFile == "large")
        {
            lblAlert.Text = "Photo File exceeds 1MB!";
        }
        else if (strImageFile == "invalid")
        {
            lblAlert.Text = "Photo File is not valid!";
        }        
    }
}