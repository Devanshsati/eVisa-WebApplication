<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="8HRPage.aspx.cs" Inherits="WebApplication06_eVisa._8HRPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>HR Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        body {
            background: linear-gradient(135deg, #D8BFD8 0%, #9370DB 100%);
            padding-top: 70px;
        }
        .header {
            background-color: #4e73df;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .container {
            margin-top: 80px; 
        }
        .card-body {
            flex: 1;
        }
        .card {
            display: flex;
            flex-direction: column;
            width: 100%;
            text-align: center;
        }
        .card-footer {
            margin-top: auto;
        }
        .grid-container {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fff;
            color: #000;
            overflow: hidden;
        }
        .grid-scroll {
            max-height: 400px;
            overflow-y: auto;
        }
        .grid-view {
            border-collapse: collapse;
            width: 100%;
        }
        .grid-view th, 
        .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .grid-view th {
            background-color: #f2f2f2;
        }
        .refresh {
            width: 15%;
            margin-left: 5%;
            margin-top: 1%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            HR Dashboard
        </div>
        <div class="container">
            <div class="row g-4 d-flex">
                <!-- New Visa Request Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            New Visa Request
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control mb-3" Placeholder="Employee ID" TextMode="Number"></asp:TextBox>
                            <asp:TextBox ID="txtVisaType" runat="server" CssClass="form-control mb-3" Placeholder="Visa Type"></asp:TextBox>
                            <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control mb-3" TextMode="Date" Placeholder="Visa Expiry Date"></asp:TextBox>
                            <asp:TextBox ID="txtRenewalRequest" runat="server" CssClass="form-control mb-3" Placeholder="Renewal Request Details (YES/NO)"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnSubmitVisaRequest" runat="server" Text="Submit Request" CssClass="btn btn-primary w-100" OnClick="BtnSubmitVisaRequest_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Update Visa Request Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            Update Visa Request
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtVisaId" runat="server" CssClass="form-control mb-3" Placeholder="Visa ID" TextMode="Number"></asp:TextBox>
                            <asp:TextBox ID="txtFinalResult" runat="server" CssClass="form-control mb-3" Placeholder="Final Result"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnUpdateVisaRequest" runat="server" Text="Update Request" CssClass="btn btn-primary w-100" OnClick="BtnUpdateVisaRequest_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Change Password Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            Change Password
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="Current Password"></asp:TextBox>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="New Password"></asp:TextBox>
                            <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="Confirm New Password"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-primary w-100" OnClick="BtnChangePassword_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Feedback Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            Feedback
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="7" Placeholder="Enter your feedback here"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnSendFeedback" runat="server" Text="Send Feedback" CssClass="btn btn-primary w-100" OnClick="BtnSendFeedback_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mt-4">
                <!-- View Employees Card -->
                <div class="col-md-12 d-flex">
                    <div class="card w-100">
                        <div class="card-header">
                            View Employees
                        </div>
                        <asp:Button ID="btnEMPRefresh" runat="server" Text="Refresh Employees" CssClass="btn btn-primary refresh" OnClick="BtnEmpRefresh_Click" />
                        <div class="card-body">
                            <asp:GridView ID="gvEmployees" runat="server" CssClass="table table-striped table-bordered grid-view"> </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mt-4">
                <!-- Reporting Card -->
                <div class="col-md-12 d-flex">
                    <div class="card w-100">
                        <div class="card-header">
                            Reporting
                        </div>
                        <asp:Button ID="btnReportRefresh" runat="server" Text="Refresh Employees" CssClass="btn btn-primary refresh" OnClick="BtnReportRefresh_Click" />
                        <div class="card-body">
                            <asp:GridView ID="gvVisaReporting" runat="server" CssClass="table table-striped grid-view" AutoGenerateColumns="true"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
