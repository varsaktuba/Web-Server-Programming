using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace Homework2
{
    public partial class CourseInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedItem.Text.Equals("Select Student"))
            {
                SqlConnection conn = new SqlConnection
                    (@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Ceng.mdf;Integrated Security=True");

                int courseId = int.Parse(Request.QueryString["id"]);
                string studentName = DropDownList1.SelectedItem.Text;
                SqlCommand cmd = new SqlCommand
                    ("Select * from Enrolment as e, Students as s where e.StudentID = s.StudentID and " +
                                  "CourseID = " + courseId + " and StudentName = '" + studentName + "'", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Label1.Visible = true;
                    Label1.Text = "The selected student is already registered to the course!";
                    Label1.ForeColor = Color.Red;
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Registered!";
                    Label1.ForeColor = Color.Blue;
                    SqlDataSource4.Insert();
                    GridView1.DataBind();
                }
                reader.Close();
                conn.Close();
            }
        }
    }
}