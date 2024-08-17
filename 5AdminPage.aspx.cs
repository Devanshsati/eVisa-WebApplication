using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication06_eVisa
{
    public partial class _3AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter aa = new SqlDataAdapter("select * from VisaStatus", con);
                DataSet ds1 = new DataSet();
                aa.Fill(ds1);
                VisaGridView.DataSource = ds1;
                VisaGridView.DataBind();

                SqlDataAdapter bb = new SqlDataAdapter("select * from ApplicantReport", con);
                DataSet ds2 = new DataSet();
                bb.Fill(ds2);
                ApplicantGridView.DataSource = ds2;
                ApplicantGridView.DataBind();

                SqlDataAdapter cc = new SqlDataAdapter("select * from InterviewReport", con);
                DataSet ds3 = new DataSet();
                cc.Fill(ds3);
                InterviewGridView.DataSource = ds3;
                InterviewGridView.DataBind();

                SqlDataAdapter dd = new SqlDataAdapter("select * from ResultReport", con);
                DataSet ds4 = new DataSet();
                dd.Fill(ds4);
                ResultGridView.DataSource = ds4;
                ResultGridView.DataBind();

                SqlDataAdapter ee = new SqlDataAdapter("select * from OnsiteReport", con);
                DataSet ds5 = new DataSet();
                ee.Fill(ds5);
                OnsiteGridView.DataSource = ds5;
                OnsiteGridView.DataBind();

                SqlDataAdapter ff = new SqlDataAdapter("select * from feedback", con);
                DataSet ds6 = new DataSet();
                ff.Fill(ds6);
                FeedbackGridView.DataSource = ds6;
                FeedbackGridView.DataBind();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void BtnAddHR_Click(object sender, EventArgs e)
        {       
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO hr VALUES('" + hrName.Text + "','" + hrUsername.Text + "','" + hrEmail.Text + "','" + hrPassword.Text + "','" + hrLocation.Text + "')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Added {hrName.Text} to HR database');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
            finally
            {
                con.Close();
                hrName.Text = string.Empty;
                hrEmail.Text = string.Empty;
                hrPassword.Text = string.Empty;
                hrLocation.Text = string.Empty;
                hrPassword.Text = string.Empty;
                hrUsername.Text = string.Empty;
            }
        }

        protected void BtnAddEmployee_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO employees VALUES('" + employeeName.Text + "','" + employeeUsername.Text + "','" + employeeEmail.Text + "','" + employeePassword.Text + "','" + employeeLocation.Text + "')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Added {employeeName.Text} to EMPLOYEE database');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
            finally
            {
                con.Close();
                employeeName.Text = string.Empty;
                employeeEmail.Text = string.Empty;
                employeePassword.Text = string.Empty;
                employeeLocation.Text = string.Empty;
                employeeUsername.Text = string.Empty;
            }
        }
    }
}