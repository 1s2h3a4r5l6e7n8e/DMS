using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserManagement;
using Auditor;

public partial class Admin_ManageAssets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string ReturnFullName(int _TenantID)
    {
       return Tenants.ReturnFullName(_TenantID);
    }


    protected void Grd_Assets_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ManageAsset.aspx?ID=" + Grd_Assets.SelectedDataKey["AssetID"].ToString());
    }
}