using System;
using System.Data.SqlClient;

namespace WebApplication06_eVisa
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=DOTNet; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE USERNAME='"+txtUsername.Text+"' AND PASSWORD='"+txtPassword.Text+"'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string script = $"alert('Login Successful: {txtUsername.Text}');" + "window.location.href='5AdminPage.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Invalid Username and Password');", true);
                }
                
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