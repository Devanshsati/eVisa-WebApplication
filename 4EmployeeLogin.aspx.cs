using System;
using System.Data.SqlClient;
using System.Web;

namespace WebApplication06_eVisa
{
    public partial class _4EmployeeLogin : System.Web.UI.Page
    {
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string uid;
            using (SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=eVISA; server=7Y27QV3\\SQLEXPRESS"))
            {
                try
                {
                    con.Open();
                    string query = "SELECT employeeid FROM employees WHERE (EMAIL=@Email OR USERNAME=@Username) AND PASSWORD=@Password";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            uid = reader["employeeid"].ToString();
                            Response.Redirect("9EmpPage.aspx?uid=" + HttpUtility.UrlEncode(uid));
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username or Password');", true);
                        }
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
}