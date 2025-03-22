using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace LSCorp
{
    public partial class top_performer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            if (string.IsNullOrEmpty(DropDownList1.SelectedValue))
                return;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                conn.Open();
                string query = @"select * from (select project_name, user_full_name, tasks_completed, rank() over (partition by project_name order by tasks_completed desc) user_rank from (select p.name project_name, u.first_name || ' ' || u.last_name user_full_name, count(t.id) tasks_completed from user_project_task upt join projects p on p.id = upt.projects_id join users u on u.id = upt.users_id join tasks t on t.id = upt.tasks_id where p.id = :project and t.status = 'Cleared' group by p.name, u.first_name || ' ' || u.last_name) ranked_users) where user_rank <= 3";

                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("project", DropDownList1.SelectedValue));

                    using (OracleDataAdapter da = new OracleDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData(); // Load data when a project is selected
        }

    }
}