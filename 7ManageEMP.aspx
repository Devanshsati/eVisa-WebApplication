<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="7ManageEMP.aspx.cs" Inherits="WebApplication06_eVisa._7ManageEMP" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        body {
            background: linear-gradient(to right, violet, blue);
            color: white;
            font-family: Arial, sans-serif;
            flex: 1;
        }
        .container {
            flex: 1;
            margin-top: 4%;
            margin-bottom: 2%;
        }
        .form-row {
            display: flex;
            align-items: flex-end;
            justify-content: center;
            margin: 3% auto;
        }
        .form-row .form-group {
            margin-right: 10px;
        }
        .btn {
            margin-right: 10px;
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
        .header, .footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 1%;
        }
        .footer {
            margin-top: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <h1>Admin Employee View</h1>
        </header>
        <div class="container">
            <div class="form-row">
                <div class="form-group">
                    <asp:Label ID="lblEMPID" runat="server" Text="EMP ID:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEMPID" runat="server" CssClass="form-control" TextMode="Number" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="BtnDelete_Click" />
                    <%--<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-warning" Text="Edit" OnClick="BtnEdit_Click" />--%>
                    <asp:Button ID="btnView" runat="server" CssClass="btn btn-warning" Text="View" OnClick="BtnView_Click" />
                </div>
            </div>
            <div class="grid-container">
                <div class="grid-scroll">
                    <asp:GridView ID="gvEMPData" runat="server" AutoGenerateColumns="true" CssClass="table table-striped table-bordered grid-view"></asp:GridView>
                </div>
            </div>
        </div>
        <footer class="footer">
            <p>&copy; 2024 Devansh EMP Management System. All rights reserved.</p>
        </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
