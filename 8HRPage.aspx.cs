using System;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication06_eVisa
{
    public partial class _8HRPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter adapder = new SqlDataAdapter("select * from employees", con);
                DataSet ds = new DataSet();
                adapder.Fill(ds);
                gvEmployees.DataSource = ds;
                gvEmployees.DataBind();

                SqlDataAdapter a = new SqlDataAdapter("select * from resultreport", con);
                DataSet d = new DataSet();
                a.Fill(d);
                gvVisaReporting.DataSource = d;
                gvVisaReporting.DataBind();
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

        protected void BtnSubmitVisaRequest_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                con.Open();
                string query = "INSERT INTO VISASTATUS (EmployeeId, VisaType, VisaExpiry, RenewalRequested) VALUES (@EmployeeId, @VisaType, @VisaExpiry, @RenewalRequested)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", txtEmployeeId.Text);
                    cmd.Parameters.AddWithValue("@VisaType", txtVisaType.Text);
                    cmd.Parameters.AddWithValue("@VisaExpiry", txtExpiry.Text);
                    cmd.Parameters.AddWithValue("@RenewalRequested", txtRenewalRequest.Text);

                    cmd.ExecuteNonQuery();
                }
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Visa Status is added for {txtEmployeeId.Text}');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
            finally
            {
                con.Open();
            }
        }

        protected void BtnUpdateVisaRequest_Click(object sender, EventArgs e)
        {
            string connectionString = "uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "UPDATE VISASTATUS SET RENEWALREQUESTED = @RenewalRequested WHERE VISAID = @VisaId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@RenewalRequested", txtFinalResult.Text);
                        cmd.Parameters.AddWithValue("@VisaId", int.Parse(txtVisaId.Text));
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Visa Status is updated for {txtVisaId.Text}');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('No record found for Visa ID {txtVisaId.Text}.');", true);
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

        protected void BtnChangePassword_Click(object sender, EventArgs e)
        {
            string connectionString = "uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string fetchPasswordQuery = "SELECT PASSWORD FROM HR WHERE HRID = @HrID";
                    string currentPasswordFromDb = null;

                    using (SqlCommand fetchPasswordCmd = new SqlCommand(fetchPasswordQuery, con))
                    {
                        fetchPasswordCmd.Parameters.AddWithValue("@HrID", Request.QueryString["uid"]);

                        object result = fetchPasswordCmd.ExecuteScalar();
                        if (result != null)
                        {
                            currentPasswordFromDb = result.ToString();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('No record found for Visa ID {txtVisaId.Text}.');", true);
                            return;
                        }
                    }

                    // Verify if the current password entered by the user matches the password in the database
                    if (txtCurrentPassword.Text == currentPasswordFromDb)
                    {
                        // Update the password
                        string updatePasswordQuery = "UPDATE HR SET PASSWORD = @NewPassword WHERE HRID = @HrID";
                        using (SqlCommand updatePasswordCmd = new SqlCommand(updatePasswordQuery, con))
                        {
                            updatePasswordCmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                            updatePasswordCmd.Parameters.AddWithValue("@HrID", Request.QueryString["uid"]);
                            int rowsAffected = updatePasswordCmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('HR Password is updated successfully.');", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Failed to update the password.');", true);
                            }
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Current password is incorrect.');", true);
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


        protected void BtnSendFeedback_Click(object sender, EventArgs e)
        {
            string connectionString = "uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO FEEDBACK (EmployeeId, HrID, FeedbackDate, FeedbackText) VALUES (NULL, @HrID, CONVERT(DATE, GETDATE()), @FeedbackText)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@HrID", Request.QueryString["uid"]);
                        cmd.Parameters.AddWithValue("@FeedbackText", txtFeedback.Text);
                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Feedback is added successfully.');", true);
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

        protected void BtnEmpRefresh_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter adapder = new SqlDataAdapter("select * from employees", con);
                DataSet ds = new DataSet();
                adapder.Fill(ds);
                gvEmployees.DataSource = ds;
                gvEmployees.DataBind();

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

        protected void BtnReportRefresh_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter adapder = new SqlDataAdapter("select * from resultreport", con);
                DataSet ds = new DataSet();
                adapder.Fill(ds);
                gvVisaReporting.DataSource = ds;
                gvVisaReporting.DataBind();

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