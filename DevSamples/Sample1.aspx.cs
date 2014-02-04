using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class DevSamples_Sample1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadLineChart();
    }

    private void loadLineChart()
    {
        LineChart1.ChartTitle = "Number of Umaapaw na Flush sa Isang Taon";

        LineChartSeries sample = new LineChartSeries();

        decimal[] set1 = {
                             new decimal(5),
                             new decimal(10),
                             new decimal(15),
                             new decimal(20),
                             new decimal(25),
                             new decimal(30),
                         };

        sample.Data = set1;
        sample.Name = "Amiel";
        sample.LineColor = "#000000";

        LineChart1.Series.Add(sample);

        LineChart1.DataBind();
    }

}