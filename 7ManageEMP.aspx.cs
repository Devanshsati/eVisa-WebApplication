using System;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication06_eVisa
{
    public partial class _7ManageEMP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter aa = new SqlDataAdapter("select * from employees", con);
                DataSet ds = new DataSet();
                aa.Fill(ds);
                gvEMPData.DataSource = ds;
                gvEMPData.DataBind();
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

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM EMPLOYEES WHERE employeeid=" + int.Parse(txtEMPID.Text), con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Deleted EmployeeID: {int.Parse(txtEMPID.Text)}');", true);
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

        protected void BtnView_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter aa = new SqlDataAdapter("select * from employees", con);
                DataSet ds = new DataSet();
                aa.Fill(ds);
                gvEMPData.DataSource = ds;
                gvEMPData.DataBind();
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
    }
}