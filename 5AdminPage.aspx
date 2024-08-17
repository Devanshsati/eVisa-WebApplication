<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5AdminPage.aspx.cs" Inherits="WebApplication06_eVisa._3AdminPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Management Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, violet, blue);
            user-select: none;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            position: relative;
        }
        .card h3 {
            margin-bottom: 15px;
        }
        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .card a:hover {
            background: #0056b3;
        }
        .close {
            cursor: pointer;
            float: right;
            font-size: 25px;
            color: #ff0000;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            margin-right: 10px;
        }
        .form-group input, 
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-group button {
            margin-top: 10px;
            padding: 10px 15px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background: #0056b3;
        }
        .grid-view {
            margin-top: 20px;
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
        .action-buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .header {
            background-color: #004c99;
            color: white;
            padding: 1%;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
        }
        .grid-scroll {
            max-height: 80%;
            overflow-y: auto;
            display: block;
        }
        .grid-scroll table {
            width: 100%;   
        }
        .popup {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .popup-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 15px;
        }
        .fit{
            max-width: fit-content;
        }
    </style>
</head>
<body>
    <header class="header mb-4">
        <h1 class="mb-0">ADMIN Management Dashboard</h1>
    </header>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <h3>Add HR</h3>
                <p>Add basic details and generate login credentials for HR.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('addHR')">Add HR</button>
            </div>

            <div class="card">
                <h3>Manage HR</h3>
                <p>View, edit, or delete added HR details.</p>
                <button type="button" class="btn btn-primary" onclick="location.href='6ManageHR.aspx'">Manage HR</button>
            </div>

            <div class="card">
                <h3>Add Employee</h3>
                <p>Add basic details and generate login credentials for employees.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('addEmployee')">Add Employee</button>
            </div>

            <div class="card">
                <h3>Manage Employee</h3>
                <p>View, edit, or delete added employee details.</p>
                <button type="button" class="btn btn-primary" onclick="location.href='7ManageEMP.aspx'">Manage Employee</button>
            </div>

            <div class="card">
                <h3>Visa Status</h3>
                <p>View current visa status, expiry information, and request for renewal.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageVisa')">View Visa Status</button>
            </div>

            <div class="card">
                <h3>Applicant Report</h3>
                <p>Search employees and refine results by location or name.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageApplicant')">View Applicant Report</button>
            </div>

            <div class="card">
                <h3>Interview Report</h3>
                <p>View reports of employee interviews and their statuses.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageInterview')">View Interview Report</button>
            </div>

            <div class="card">
                <h3>Result Report</h3>
                <p>View final results and details of candidates.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageResult')">View Result Report</button>
            </div>

            <div class="card">
                <h3>Onsite Report</h3>
                <p>View onsite details entered by employees.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageOnsite')">View Onsite Report</button>
            </div>

            <div class="card">
                <h3>Feedback</h3>
                <p>View and manage feedback sent by employees and HR.</p>
                <button type="button" class="btn btn-primary" onclick="openPopup('manageFeedback')">View Feedback</button>
            </div>
        </div>


        <!-- Popup for Adding HR -->
        <div class="popup" id="addHR">
            <div class="popup-content fit">
                <span class="close" onclick="closePopup('addHR')">&times;</span>
                <h3>Add HR</h3>
                <div class="form-group">
                    <label for="hrName">HR Name:</label>
                    <asp:TextBox ID="hrName" runat="server" placeholder="Enter HR name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrName" runat="server" ControlToValidate="hrName"
                        ErrorMessage="HR Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="hrUsername">HR Username:</label>
                    <asp:TextBox ID="hrUsername" runat="server" placeholder="Enter HR username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrUsername" runat="server" ControlToValidate="hrUsername"
                        ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revHrUsername" runat="server" ControlToValidate="hrUsername"
                        ErrorMessage="Username must be alphanumeric and at least 3 characters long." 
                        ForeColor="Red" Display="Dynamic"
                        ValidationExpression="^(?=.{3,})([a-zA-Z0-9]+)$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="hrEmail">HR Email:</label>
                    <asp:TextBox ID="hrEmail" runat="server" placeholder="Enter HR email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrEmail" runat="server" ControlToValidate="hrEmail"
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revHrEmail" runat="server" ControlToValidate="hrEmail"
                        ErrorMessage="Invalid email format." 
                        ForeColor="Red" Display="Dynamic"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="hrPassword">HR Password:</label>
                    <asp:TextBox ID="hrPassword" runat="server" placeholder="Enter HR password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrPassword" runat="server" ControlToValidate="hrPassword"
                        ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revHrPassword" runat="server" ControlToValidate="hrPassword"
                        ErrorMessage="Password must be at least 6 characters long." 
                        ForeColor="Red" Display="Dynamic"
                        ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="hrLocation">HR Location:</label>
                    <asp:TextBox ID="hrLocation" runat="server" placeholder="Enter HR location"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrLocation" runat="server" ControlToValidate="hrLocation"
                        ErrorMessage="Location is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddHR" runat="server" CssClass="btn btn-outline-primary" Text="Add HR" OnClick="BtnAddHR_Click" />
                </div>
            </div>
        </div>



        <!-- Popup for Managing HR -->
        <div class="popup" id="manageHR">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageHR')">&times;</span>
                <h3>Manage HR</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="gvHR" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Adding Employee -->
        <div class="popup" id="addEmployee">
            <div class="popup-content fit">
                <span class="close" onclick="closePopup('addEmployee')">&times;</span>
                <h3>Add Employee</h3>
                <div class="form-group">
                    <label for="employeeName">Employee Name:</label>
                    <asp:TextBox ID="employeeName" runat="server" placeholder="Enter Employee Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ControlToValidate="employeeName"
                        ErrorMessage="Employee Name is required." ForeColor="Red" Display="Dynamic" ValidationGroup="AddEmployee"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="employeeUsername">Username:</label>
                    <asp:TextBox ID="employeeUsername" runat="server" placeholder="Enter Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeUsername" runat="server" ControlToValidate="employeeUsername"
                        ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic" ValidationGroup="AddEmployee"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmployeeUsername" runat="server" ControlToValidate="employeeUsername"
                        ErrorMessage="Username must be alphanumeric and at least 3 characters long." 
                        ForeColor="Red" Display="Dynamic" 
                        ValidationExpression="^(?=.{3,})([a-zA-Z0-9]+)$" ValidationGroup="AddEmployee"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="employeeEmail">Employee Email:</label>
                    <asp:TextBox ID="employeeEmail" runat="server" placeholder="Enter Employee Email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeEmail" runat="server" ControlToValidate="employeeEmail"
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" ValidationGroup="AddEmployee"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmployeeEmail" runat="server" ControlToValidate="employeeEmail"
                        ErrorMessage="Invalid email format." 
                        ForeColor="Red" Display="Dynamic" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="AddEmployee"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="employeePassword">Password:</label>
                    <asp:TextBox ID="employeePassword" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeePassword" runat="server" ControlToValidate="employeePassword"
                        ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" ValidationGroup="AddEmployee"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmployeePassword" runat="server" ControlToValidate="employeePassword"
                        ErrorMessage="Password must be at least 6 characters long." 
                        ForeColor="Red" Display="Dynamic" 
                        ValidationExpression="^.{6,}$" ValidationGroup="AddEmployee"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="employeeLocation">Location:</label>
                    <asp:TextBox ID="employeeLocation" runat="server" placeholder="Enter Location"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeLocation" runat="server" ControlToValidate="employeeLocation"
                        ErrorMessage="Location is required." ForeColor="Red" Display="Dynamic" ValidationGroup="AddEmployee"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddEmployee" runat="server" Text="Add Employee" CssClass="btn btn-outline-primary" OnClick="BtnAddEmployee_Click" ValidationGroup="AddEmployee" />
                </div>
            </div>
        </div>


        <!-- Popup for Managing Employee -->
        <div class="popup" id="manageEmployee">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageEmployee')">&times;</span>
                <h3>Manage Employee</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Visa -->
        <div class="popup" id="manageVisa">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageVisa')">&times;</span>
                <h3>Manage Visa</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="VisaGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Applicant -->
        <div class="popup" id="manageApplicant">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageApplicant')">&times;</span>
                <h3>Manage Applicants</h3>
                <div class="d-flex">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-25 me-4" Placeholder="Applicant Name/Location"/>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-warning" OnClick="BtnAddEmployee_Click" />
                </div>
                <div class="grid-scroll">
                    <asp:GridView ID="ApplicantGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Interview Report -->
        <div class="popup" id="manageInterview">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageInterview')">&times;</span>
                <h3>Manage Interview Report</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="InterviewGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Result Report -->
        <div class="popup" id="manageResult">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageResult')">&times;</span>
                <h3>Manage Result Report</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="ResultGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Onsite Report -->
        <div class="popup" id="manageOnsite">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageOnsite')">&times;</span>
                <h3>Manage Onsite Report</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="OnsiteGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Feedback Report -->
        <div class="popup" id="manageFeedback">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageFeedback')">×</span>
                <h3>View Feedback</h3>
                <div class="grid-scroll">
                    <asp:GridView ID="FeedbackGridView" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script>
        function openPopup(popupId) {
            document.getElementById(popupId).style.display = "block";
        }

        function closePopup(popupId) {
            document.getElementById(popupId).style.display = "none";
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
