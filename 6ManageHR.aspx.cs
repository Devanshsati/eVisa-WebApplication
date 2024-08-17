using System;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication06_eVisa
{
    public partial class _6ManageHR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter aa = new SqlDataAdapter("select * from hr", con);
                DataSet ds = new DataSet();
                aa.Fill(ds);
                gvHRData.DataSource = ds;
                gvHRData.DataBind();

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
                SqlCommand cmd = new SqlCommand("DELETE FROM hr WHERE HRID="+ int.Parse(txtHRID.Text), con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Deleted HRID: {int.Parse(txtHRID.Text)}');", true);
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
                SqlDataAdapter aa = new SqlDataAdapter("select * from hr", con);
                DataSet ds = new DataSet();
                aa.Fill(ds);
                gvHRData.DataSource = ds;
                gvHRData.DataBind();

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