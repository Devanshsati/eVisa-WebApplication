using System;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication06_eVisa
{
    public partial class _9EmpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter a = new SqlDataAdapter("select * from OnsiteReport", con);
                DataSet d = new DataSet();
                a.Fill(d);
                gvOnsite.DataSource = d;
                gvOnsite.DataBind();
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


        protected void BtnSubmitOnsiteRequest_Click(object sender, EventArgs e)
        {
            string connectionString = "uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO onsitereport (EmployeeId, reportdate, details) VALUES (@EmployeeId, CONVERT(DATE, GETDATE()), @details)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeId", Request.QueryString["uid"]);
                        cmd.Parameters.AddWithValue("@details", txtDetails.Text);
                        cmd.ExecuteNonQuery();
                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Onsite Report is added for {Request.QueryString["uid"]}');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
                finally
                {
                    con.Close();
                    txtDetails.Text = string.Empty;
                    txtDate.Text = string.Empty;
                }
            }
        }


        protected void BtnUpdateOnsiteRequest_Click(object sender, EventArgs e)
        {
            string connectionString = "uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "UPDATE ONSITEREPORT SET REPORTDATE = @ReportDate, DETAILS = @details WHERE onsiteid = @onsiteid";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ReportDate", txtUpdatedate.Text);
                        cmd.Parameters.AddWithValue("@details", txtUpdateDetails.Text);
                        cmd.Parameters.AddWithValue("@onsiteid", txtOnsiteId.Text);
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Visa Status is updated for {txtOnsiteId.Text}');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('No record found for Visa ID {txtOnsiteId.Text}.');", true);
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
                    txtOnsiteId.Text = string.Empty;
                    txtUpdatedate.Text = string.Empty;
                    txtUpdateDetails.Text = string.Empty;
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
                    string fetchPasswordQuery = "SELECT PASSWORD FROM Employees WHERE employeeid = @employeeid";
                    string currentPasswordFromDb = null;

                    using (SqlCommand fetchPasswordCmd = new SqlCommand(fetchPasswordQuery, con))
                    {
                        fetchPasswordCmd.Parameters.AddWithValue("@employeeid", Request.QueryString["uid"]);

                        object result = fetchPasswordCmd.ExecuteScalar();
                        if (result != null)
                        {
                            currentPasswordFromDb = result.ToString();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('No record found for Employee ID {Request.QueryString["uid"]}.');", true);
                            return;
                        }
                    }

                    // Verify if the current password entered by the user matches the password in the database
                    if (txtCurrentPassword.Text == currentPasswordFromDb)
                    {
                        // Update the password
                        string updatePasswordQuery = "UPDATE EMPLOYEES SET PASSWORD = @NewPassword WHERE employeeID = @employeeid";
                        using (SqlCommand updatePasswordCmd = new SqlCommand(updatePasswordQuery, con))
                        {
                            updatePasswordCmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                            updatePasswordCmd.Parameters.AddWithValue("@employeeid", Request.QueryString["uid"]);
                            int rowsAffected = updatePasswordCmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Employee Password is updated successfully.');", true);
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
                    string query = "INSERT INTO FEEDBACK (EmployeeId, HrID, FeedbackDate, FeedbackText) VALUES (@EMPID, NULL, CONVERT(DATE, GETDATE()), @FeedbackText)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EMPID", Request.QueryString["uid"]);
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
                    txtFeedback.Text = string.Empty;
                }
            }
        }

        protected void BtnOnRefresh_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter a = new SqlDataAdapter("select * from OnsiteReport", con);
                DataSet d = new DataSet();
                a.Fill(d);
                gvOnsite.DataSource = d;
                gvOnsite.DataBind();
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