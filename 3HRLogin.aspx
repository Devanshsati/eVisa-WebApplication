<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="3HRLogin.aspx.cs" Inherits="WebApplication06_eVisa._3HRLogin" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #D8BFD8 0%, #9370DB 100%);
            user-select: none;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
            color: #fff;
        }
        .login-container {
            width: 350px; 
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        }
        .login-header {
            text-align: center;
            margin-bottom: 20px;
            color: #666; 
        }
        .login-header h2 {
            font-size: 26px;
            margin-bottom: 10px;
            color: #007bff;
        }
        .form-label {
            font-weight: 600;
            color: #333; 
        }
        .btn-login {
            width: 100%; 
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666; 
        }
        .footer-text p {
            margin: 0; 
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h2>HR Login</h2>
            <p>Please enter your credentials</p>
        </div>
        <form id="form1" runat="server">
            <div class="mb-3">
                <label for="txtUsername" class="form-label">Username or Email</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="true" />
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required="true" />
            </div>
            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-login" Text="Login"/>
        </form>
        <div class="footer-text">
            <p>&copy; 2024 Devansh. All Rights Reserved</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>