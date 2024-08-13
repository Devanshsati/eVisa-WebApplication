<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="1PortalPage.aspx.cs" Inherits="WebApplication06_eVisa.PortalPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Visa Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #a3c2c2 0%, #d5e1e1 100%);
            user-select: none; 
        }
        .portal-container {
            flex: 1;
            width: 100%;
            max-width: 1200px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .header {
            background-color: #004c99;
            color: white;
            padding: 15px;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .card {
            transition: transform 0.2s;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            background-color: #ffffff;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .card-text {
            color: #555;
        }
        .employee-card {
            background-color: rgba(255, 223, 186, 0.9);
        }
        .admin-card {
            background-color: rgba(186, 226, 255, 0.9);
        }
        .hr-card {
            background-color: rgba(186, 255, 216, 0.9);
        }
        .footer {
            background-color: #004c99;
            color: white;
            padding: 10px;
            text-align: center;
            margin-top: auto;
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="header">
        <h1 class="mb-0">E-Visa Portal</h1>
    </div>
    <div class="container portal-container">
        <div class="row justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="card text-center employee-card">
                    <div class="card-body">
                        <h5 class="card-title">Employee</h5>
                        <p class="card-text">Manage your visa applications and track your status.</p>
                        <a href="4EmployeeLogin.aspx" class="btn btn-success">Go to Employee Portal</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-center admin-card">
                    <div class="card-body">
                        <h5 class="card-title">Admin</h5>
                        <p class="card-text">Access administrative features and manage user accounts.</p>
                        <a href="2AdminLogin.aspx" class="btn btn-info">Go to Admin Portal</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-center hr-card">
                    <div class="card-body">
                        <h5 class="card-title">HR</h5>
                        <p class="card-text">Review applications and manage employee records.</p>
                        <a href="3HRLogin.aspx" class="btn btn-danger">Go to HR Portal</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Devansh. All Rights Reserved</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
