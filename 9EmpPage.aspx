<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="9EmpPage.aspx.cs" Inherits="WebApplication06_eVisa._9EmpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        body {
            background: linear-gradient(135deg, #6ee7b7 0%, #3b82f6 100%);
        }
        .header {
            padding: 1%;
            text-align: center;
            font-size: 2em;
            color: #fff;
            background-color: #343a40;
            margin-bottom: 3%;
        }
        .card {
            width: 100%;
        }
        .btn-primary {
            width: 100%;
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
            Employee Dashboard
        </div>
        <div class="container">
            <!-- Row for the cards -->
            <div class="row g-4">
                <!-- New Onsite Request Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            New Onsite Request
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control mb-3" TextMode="Date" Placeholder="Onsite Date"></asp:TextBox>
                            <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="7" Placeholder="Add Details Schedule"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnSubmitOnsiteRequest" runat="server" Text="Submit Request" CssClass="btn btn-primary" OnClick="BtnSubmitOnsiteRequest_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Update Onsite Request Card -->
                <div class="col-md-3 d-flex">
                    <div class="card">
                        <div class="card-header">
                            Update Onsite Request
                        </div>
                        <div class="card-body d-flex flex-column">
                            <asp:TextBox ID="txtOnsiteId" runat="server" CssClass="form-control mb-3" Placeholder="Onsite ID" TextMode="Number"></asp:TextBox>
                            <asp:TextBox ID="txtUpdatedate" runat="server" CssClass="form-control mb-3" TextMode="Date" Placeholder="Onsite Date"></asp:TextBox>
                            <asp:TextBox ID="txtUpdateDetails" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="4" Placeholder="Add Details Schedule"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnUpdateOnsiteRequest" runat="server" Text="Update Request" CssClass="btn btn-primary" OnClick="BtnUpdateOnsiteRequest_Click" />
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
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-primary" OnClick="BtnChangePassword_Click" />
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
                            <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="8" Placeholder="Enter your feedback here"></asp:TextBox>
                            <div class="mt-auto">
                                <asp:Button ID="btnSendFeedback" runat="server" Text="Send Feedback" CssClass="btn btn-primary" OnClick="BtnSendFeedback_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Row for the GridView card -->
            <div class="row g-4 mt-4">
                <!-- View Onsite Report Card -->
                <div class="col-md-12 d-flex">
                    <div class="card w-100">
                        <div class="card-header">
                            View Onsite Report
                        </div>
                        <div class="card-body">
                            <asp:Button ID="btnOnRefresh" runat="server" Text="Refresh Onsite" CssClass="btn btn-primary mb-3 refresh" OnClick="BtnOnRefresh_Click" />
                            <asp:GridView ID="gvOnsite" runat="server" CssClass="table table-striped table-bordered grid-view"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
