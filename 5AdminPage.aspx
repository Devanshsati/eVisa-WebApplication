<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5AdminPage.aspx.cs" Inherits="WebApplication06_eVisa._3AdminPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Management Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 20px;
            user-select: none;
            color: #333;
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
        .popup {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            z-index: 10;
        }
        .popup-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            text-align: left;
        }
        .close {
            cursor: pointer;
            float: right;
            font-size: 20px;
            color: #999;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
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
        .grid-view th, .grid-view td {
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
            padding: 15px;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .footer {
            background-color: #004c99;
            color: white;
            padding: 10px;
            text-align: center;
            margin-top: auto;
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
        }
        .grid-scroll {
            max-height: 300px; /* Set desired height */
            overflow-y: auto;  /* Enable vertical scroll */
            display: block;     /* Make GridView behave like a block element */
        }
        .grid-scroll table {
            width: 100%;        /* Ensure the table width is 100% */
        }
    </style>
</head>
<body>
    <header class="header">
        <h1 class="mb-0">HR Management Dashboard</h1>
    </header>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <h3>Add HR</h3>
                <p>Add basic details and generate login credentials for HR.</p>
                <a href="#" onclick="openPopup('addHR')">Add HR</a>
            </div>

            <div class="card">
                <h3>Manage HR</h3>
                <p>View, edit, or delete added HR details.</p>
                <a href="#" onclick="openPopup('manageHR')">Manage HR</a>
            </div>

            <div class="card">
                <h3>Add Employee</h3>
                <p>Add basic details and generate login credentials for employees.</p>
                <a href="#" onclick="openPopup('addEmployee') BtnVisa_Click">Add Employee</a>
            </div>

            <div class="card">
                <h3>Manage Employee</h3>
                <p>View, edit, or delete added employee details.</p>
                <a href="#" onclick="openPopup('manageEmployee')">Manage Employee</a>
            </div>

            <div class="card">
                <h3>Visa Status</h3>
                <p>View current visa status, expiry information, and request for renewal.</p>
                <a href="#" onclick="openPopup('manageVisa')">View Visa Status</a>                
            </div>

            <div class="card">
                <h3>Applicant Report</h3>
                <p>Search employees and refine results by location or name.</p>
                <a href="#" onclick="openPopup('manageApplicant')">View Applicant Report</a>
            </div>

            <div class="card">
                <h3>Interview Report</h3>
                <p>View reports of employee interviews and their statuses.</p>
                <a href="#" onclick="openPopup('manageInterview')">View Interview Report</a>
            </div>

            <div class="card">
                <h3>Result Report</h3>
                <p>View final results and details of candidates.</p>
                <a href="#" onclick="openPopup('manageResult')">View Result Report</a>
            </div>

            <div class="card">
                <h3>Onsite Report</h3>
                <p>View onsite details entered by employees.</p>
                <a href="#" onclick="openPopup('manageOnsite')">View Onsite Report</a>
            </div>

            <div class="card">
                <h3>Feedback</h3>
                <p>View and manage feedback sent by employees and HR.</p>
                <div class="form-group">
                    <textarea placeholder="Enter your feedback here..." rows="2"></textarea>
                    <button type="button">Submit Feedback</button>
                </div>
            </div>
        </div>

        <!-- Popup for Adding HR -->
        <div class="popup" id="addHR">
            <div class="popup-content">
                <span class="close" onclick="closePopup('addHR')">&times;</span>
                <h3>Add HR</h3>
                <div class="form-group">
                    <label for="hrId">HR ID:</label>
                    <asp:TextBox ID="hrId" runat="server" placeholder="Enter HR ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrId" runat="server" ControlToValidate="hrId"
                        ErrorMessage="HR ID is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="hrName">HR Name:</label>
                    <asp:TextBox ID="hrName" runat="server" placeholder="Enter HR name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrName" runat="server" ControlToValidate="hrName"
                        ErrorMessage="HR Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="hrEmail">Email:</label>
                    <asp:TextBox ID="hrEmail" runat="server" placeholder="Enter HR email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrEmail" runat="server" ControlToValidate="hrEmail"
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revHrEmail" runat="server" ControlToValidate="hrEmail"
                        ErrorMessage="Invalid email format." ForeColor="Red" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="hrPhone">Phone:</label>
                    <asp:TextBox ID="hrPhone" runat="server" placeholder="Enter HR phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrPhone" runat="server" ControlToValidate="hrPhone"
                        ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revHrPhone" runat="server" ControlToValidate="hrPhone"
                        ErrorMessage="Invalid phone format." ForeColor="Red"
                        ValidationExpression="^\d{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="hrDesignation">Designation:</label>
                    <asp:TextBox ID="hrDesignation" runat="server" placeholder="Enter HR designation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHrDesignation" runat="server" ControlToValidate="hrDesignation"
                        ErrorMessage="Designation is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <button type="button" onclick="addHR()">Add HR</button>
                </div>
            </div>
        </div>

        <!-- Popup for Adding Employee -->
        <div class="popup" id="addEmployee">
            <div class="popup-content">
                <span class="close" onclick="closePopup('addEmployee')">&times;</span>
                <h3>Add Employee</h3>
                <div class="form-group">
                    <label for="employeeId">Employee ID:</label>
                    <asp:TextBox ID="employeeId" runat="server" placeholder="Enter employee ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeId" runat="server" ControlToValidate="employeeId"
                        ErrorMessage="Employee ID is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="employeeName">Employee Name:</label>
                    <asp:TextBox ID="employeeName" runat="server" placeholder="Enter employee name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ControlToValidate="employeeName"
                        ErrorMessage="Employee Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="employeeEmail">Email:</label>
                    <asp:TextBox ID="employeeEmail" runat="server" placeholder="Enter employee email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeEmail" runat="server" ControlToValidate="employeeEmail"
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmployeeEmail" runat="server" ControlToValidate="employeeEmail"
                        ErrorMessage="Invalid email format." ForeColor="Red" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="employeePhone">Phone:</label>
                    <asp:TextBox ID="employeePhone" runat="server" placeholder="Enter employee phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeePhone" runat="server" ControlToValidate="employeePhone"
                        ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmployeePhone" runat="server" ControlToValidate="employeePhone"
                        ErrorMessage="Invalid phone format." ForeColor="Red"
                        ValidationExpression="^\d{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="employeeDesignation">Designation:</label>
                    <asp:TextBox ID="employeeDesignation" runat="server" placeholder="Enter employee designation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmployeeDesignation" runat="server" ControlToValidate="employeeDesignation"
                        ErrorMessage="Designation is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <button type="button" onclick="addEmployee()">Add Employee</button>
                </div>
            </div>
        </div>

        <!-- Popup for Managing HR -->
        <div class="popup" id="manageHR">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageHR')">&times;</span>
                <h3>Manage HR</h3>
                <div class="form-group">
                    <label for="manageHrName">HR Name:</label>
                    <input type="text" id="manageHrName" placeholder="Enter HR name to search" class="form-control">
                </div>
                <div class="action-buttons">
                    <button type="button" class="btn btn-primary" onclick="viewHR()">View</button>
                    <button type="button" class="btn btn-warning" onclick="editHR()">Edit</button>
                    <button type="button" class="btn btn-danger" onclick="deleteHR()">Delete</button>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Employee -->
        <div class="popup" id="manageEmployee">
            <div class="popup-content">
                <span class="close" onclick="closePopup('manageEmployee')">&times;</span>
                <h3>Manage Employee</h3>
                <div class="form-group">
                    <label for="manageEmployeeName">Employee Name:</label>
                    <input type="text" id="manageEmployeeName" placeholder="Enter employee name to search" class="form-control">
                </div>
                <div class="action-buttons">
                    <button type="button" class="btn btn-primary" onclick="viewEmployee()">View</button>
                    <button type="button" class="btn btn-warning" onclick="editEmployee()">Edit</button>
                    <button type="button" class="btn btn-danger" onclick="deleteEmployee()">Delete</button>
                </div>
            </div>
        </div>

        <!-- Popup for Managing Visa -->
         <div class="popup" id="manageVisa">
            <div class="popup-content w-75">
                <span class="close" onclick="closePopup('manageVisa')">&times;</span>
                <h3>View Visa Status</h3>
                <asp:GridView ID="VisaGridView" runat="server" CssClass="table table-striped table-bordered grid-scroll" AutoGenerateColumns="True"></asp:GridView>
            </div>
        </div>

        <!-- Popup for Managing Applicant -->
        <div class="popup" id="manageApplicant">
            <div class="popup-content w-75">
                <span class="close" onclick="closePopup('manageApplicant')">&times;</span>
                <h3>View Applicant Report</h3>
                <asp:GridView ID="ApplicantGridView" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="True" AllowPaging="True" PageSize="5" OnPageIndexChanging="ApplicantGridView_PageIndexChanging"></asp:GridView>
            </div>
        </div>

        <!-- Popup for Managing Interview -->
        <div class="popup" id="manageInterview">
            <div class="popup-content w-75">
                <span class="close" onclick="closePopup('manageInterview')">&times;</span>
                <h3>View Interview Report</h3>
                <asp:GridView ID="InterviewGridView" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="True" AllowPaging="True" PageSize="5" OnPageIndexChanging="InterviewGridView_PageIndexChanging"></asp:GridView>
            </div>
        </div>

        <!-- Popup for Managing Result -->
        <div class="popup" id="manageResult">
            <div class="popup-content w-75">
                <span class="close" onclick="closePopup('manageResult')">&times;</span>
                <h3>View Result Report</h3>
                <asp:GridView ID="ResultGridView" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="True" AllowPaging="True" PageSize="5" OnPageIndexChanging="ResultGridView_PageIndexChanging"></asp:GridView>
            </div>
        </div>

        <!-- Popup for Managing Onsite -->
        <div class="popup" id="manageOnsite">
            <div class="popup-content w-75">
                <span class="close" onclick="closePopup('manageOnsite')">&times;</span>
                <h3>View Onsite Report</h3>
                <asp:GridView ID="OnsiteGridView" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="True" AllowPaging="True" PageSize="5" OnPageIndexChanging="OnsiteGridView_PageIndexChanging"></asp:GridView>
            </div>
        </div>
    </form>
     <div class="footer-text">
         <p>&copy; 2024 Devansh. All Rights Reserved</p>
     </div>

    <script>
        function openPopup(popupId) { document.getElementById(popupId).style.display = 'flex';}
        function closePopup(popupId) {document.getElementById(popupId).style.display = 'none';}
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
