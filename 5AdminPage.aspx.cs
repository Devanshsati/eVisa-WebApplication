using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Cache;

namespace WebApplication06_eVisa
{
    public partial class _3AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("uid=sa; password=manager@123; database=EVisa; server=7Y27QV3\\SQLEXPRESS");
            try
            {
                SqlDataAdapter a = new SqlDataAdapter("select * from VisaStatus", con);
                DataSet ds1 = new DataSet();
                a.Fill(ds1);
                VisaGridView.DataSource = ds1;
                VisaGridView.DataBind();

                SqlDataAdapter b = new SqlDataAdapter("select * from ApplicantReport", con);
                DataSet ds2 = new DataSet();
                b.Fill(ds2);
                ApplicantGridView.DataSource = ds2;
                ApplicantGridView.DataBind();

                SqlDataAdapter c = new SqlDataAdapter("select * from InterviewReport", con);
                DataSet ds3 = new DataSet();
                c.Fill(ds3);
                InterviewGridView.DataSource = ds3;
                InterviewGridView.DataBind();

                SqlDataAdapter d = new SqlDataAdapter("select * from ResultReport", con);
                DataSet ds4 = new DataSet();
                d.Fill(ds4);
                ResultGridView.DataSource = ds4;
                ResultGridView.DataBind();

                SqlDataAdapter ee = new SqlDataAdapter("select * from OnsiteReport", con);
                DataSet ds5 = new DataSet();
                ee.Fill(ds5);
                OnsiteGridView.DataSource = ds5;
                OnsiteGridView.DataBind();
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

        protected void VisaGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            VisaGridView.PageIndex = e.NewPageIndex;
        }
        protected void ApplicantGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ApplicantGridView.PageIndex = e.NewPageIndex;
        }
        protected void InterviewGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            InterviewGridView.PageIndex = e.NewPageIndex;
        }
        protected void ResultGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ResultGridView.PageIndex = e.NewPageIndex;
        }
        protected void OnsiteGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            OnsiteGridView.PageIndex = e.NewPageIndex;
        }

        protected void BtnFeedback_Click(object sender, EventArgs e)
        {
            //Request.QueryString["uid"];
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"Working", true);
        }

    }
}