using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LSCorp
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch the counts from the SqlDataSource
                var tasks = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
                int completedCount = Convert.ToInt32(tasks.Table.Rows[0]["Completed"]);
                int pendingCount = Convert.ToInt32(tasks.Table.Rows[0]["Pending"]);

                // Create a DataTable for the chart data
                DataTable chartData1 = new DataTable();
                chartData1.Columns.Add("Category");  // Column for the chart labels (X axis)
                chartData1.Columns.Add("Count");     // Column for the count values (Y axis)

                // Add data for Completed and Pending counts
                chartData1.Rows.Add("Completed", completedCount);
                chartData1.Rows.Add("Pending", pendingCount);

                // Set the data source for the chart and bind the data
                Chart1.DataSource = chartData1;
                Chart1.DataBind(); // Important to actually bind the data



                // Fetch the counts from the SqlDataSource
                var counts = SqlDataSource3.Select(DataSourceSelectArguments.Empty) as DataView;
                if (counts != null && counts.Table.Rows.Count > 0)
                {
                    // Extract the counts for users, projects, and tasks
                    int userCount = Convert.ToInt32(counts.Table.Rows[0]["Users"]);
                    int projectCount = Convert.ToInt32(counts.Table.Rows[0]["Projects"]);
                    int taskCount = Convert.ToInt32(counts.Table.Rows[0]["Tasks"]);

                    // Create a DataTable for the chart data
                    DataTable chartData2 = new DataTable();
                    chartData2.Columns.Add("Category");  // Column for the chart labels (X axis)
                    chartData2.Columns.Add("Count");     // Column for the count values (Y axis)

                    // Add data for Users, Projects, and Tasks counts
                    chartData2.Rows.Add("Users", userCount);
                    chartData2.Rows.Add("Projects", projectCount);
                    chartData2.Rows.Add("Tasks", taskCount);

                    // Set the data source for the bar chart and bind the data
                    Chart3.DataSource = chartData2;
                    Chart3.DataBind(); // Important to bind the data to the chart
                }
            }
        }
    }
}