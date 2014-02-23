using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Auditor;

public partial class Admin_ServiceRequestMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect("ViewTenant.aspx?ID=" + GridView1.SelectedDataKey["TenantID"].ToString());
        Response.Redirect("ViewServiceRequest.aspx?ID=" + GridView1.SelectedDataKey["ServiceRequestID"].ToString());
    }
}