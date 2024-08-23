# E-Visa Portal README , WebApplication06-eVisa

## E-Visa Portal Screenshots
| ![Screenshot 2024-08-23 153302](https://github.com/user-attachments/assets/39a5913f-c383-4eb5-9054-34598fb08975) | ![Screenshot 2024-08-23 153450](https://github.com/user-attachments/assets/435b1581-893c-4ea8-80e2-ca67f1c85f05) | ![Screenshot 2024-08-23 153431](https://github.com/user-attachments/assets/ece344ef-6910-4408-8ef1-a5de64691448) |
| --- | --- | --- |
| ![Screenshot 2024-08-23 153412](https://github.com/user-attachments/assets/0a39d789-2549-4a77-9dfc-f544778ea2a0) | ![Screenshot 2024-08-23 153351](https://github.com/user-attachments/assets/ae12a0db-86d6-43df-9d88-0892cac3ef9c) | ![Screenshot 2024-08-23 153319](https://github.com/user-attachments/assets/3c9d1ec9-7c8a-4f2d-9663-955656be1346) |
| ![Screenshot 2024-08-23 153507](https://github.com/user-attachments/assets/10c6c6c9-073d-4786-bfeb-444dcc1e5997) | ![Screenshot 2024-08-23 153827](https://github.com/user-attachments/assets/7fee36ea-4d3d-4685-97fc-6b0a02e34954) | ![Screenshot 2024-08-23 153752](https://github.com/user-attachments/assets/8f2306da-93a1-45f1-8ff3-32bca0c68867) |
| ![Screenshot 2024-08-23 153712](https://github.com/user-attachments/assets/1a01c9fb-7a90-4e86-8714-f3d663d6dd16) | ![Screenshot 2024-08-23 153650](https://github.com/user-attachments/assets/5c6204d8-1255-4551-be77-c690a7af5119) | ![Screenshot 2024-08-23 153635](https://github.com/user-attachments/assets/22ff0e0a-64f7-422c-8d64-446d1b61f8ff) |
| ![Screenshot 2024-08-23 162853](https://github.com/user-attachments/assets/d3f02d2c-bd98-4d68-b283-7dd4c7979f8c) | ![Screenshot 2024-08-23 153811](https://github.com/user-attachments/assets/043e3283-28bb-46e7-b148-f069394f5b00) |  |



## Overview

The **E-Visa Portal** is a web application designed to streamline visa management tasks. The portal provides different access levels for Employees, Admins, and HR personnel. This README covers the key aspects of the `1PortalPage.aspx` file, including its purpose, layout, and design.

### Admin Access    : ninascott	nina.scott@admin.com	AdminPassword1
### HR Access       : alicewilliams	alice.williams@hr.com	HRPassword1
### Employee Access : johndoe	john.doe@example.com	Password1

## File Structure

### ASPX Page

- **`1PortalPage.aspx`**: This is the main page of the E-Visa Portal, which serves as the entry point for users to access various sections of the portal based on their role. It is written in ASP.NET and uses C# for the code-behind logic.

### HTML Layout

The HTML structure defines the layout and styling of the portal page.

#### Head Section

- **Meta Tags**:
  - `charset="UTF-8"`: Sets character encoding to UTF-8.
  - `viewport`: Ensures the page is responsive on different devices.

- **Title**:
  - Sets the page title to "E-Visa Portal".

- **Bootstrap CSS**:
  - Includes Bootstrap 5.3.3 for styling.

- **Custom CSS**:
  - Defines styles for the overall layout, header, cards, and footer.

#### Body Section

- **Header**:
  - Contains the title of the portal in a styled header section.

- **Main Content**:
  - Uses a responsive container to hold cards for different user roles (Employee, Admin, HR).
  - Each card contains:
    - A title.
    - A description.
    - A button linking to the respective portal login page.

- **Footer**:
  - Displays a footer with copyright information.

#### JavaScript

- **Bootstrap Bundle**:
  - Includes the Bootstrap JavaScript bundle for interactive components.

## Styling

### Global Styles

- **Background**:
  - Linear gradient background for a soft, modern look.
  
- **Flex Layout**:
  - Uses Flexbox to center content and ensure responsiveness.

### Header

- **Background Color**: Dark blue (`#004c99`).
- **Text Color**: White.
- **Box Shadow**: Applied for a subtle elevation effect.

### Cards

- **General**:
  - Borderless with rounded corners and shadows for a modern card look.
  
- **Hover Effect**:
  - Cards slightly elevate on hover to enhance interactivity.

- **Role-Specific Backgrounds**:
  - Employee Card: Light orange background.
  - Admin Card: Light blue background.
  - HR Card: Light green background.

### Footer

- **Background Color**: Dark blue (`#004c99`).
- **Text Color**: White.
- **Box Shadow**: Applied to create a floating effect.

## Usage

1. **Accessing the Portal**:
   - Navigate to `1PortalPage.aspx` to view the portal landing page.
   
2. **Role-Based Navigation**:
   - Click on the respective buttons to access the login pages for Employees, Admins, or HR personnel.



Here's a comprehensive README for the `9EmpPage.aspx` file:

# Employee Dashboard README

## Overview

The **Employee Dashboard** is a part of the E-Visa Portal designed for employees to manage their onsite requests, update their requests, change their passwords, and provide feedback. This page leverages ASP.NET Web Forms to handle server-side operations and uses Bootstrap for styling and layout.

## File Structure

### ASPX Page

- **`9EmpPage.aspx`**: This page serves as the employee dashboard within the E-Visa Portal. It allows employees to perform various tasks through a set of interactive cards.

### HTML Layout

The HTML structure is defined to provide a responsive and user-friendly interface.

#### Head Section

- **Title**:
  - Sets the page title to "Employee Dashboard".

- **Bootstrap CSS**:
  - Includes Bootstrap 5.3.3 for consistent styling across devices.

- **Custom CSS**:
  - Defines the background, header, card styles, and button widths.

#### Body Section

- **Form**:
  - Encapsulates the page elements with `runat="server"` to support server-side controls.

- **Header**:
  - Displays the dashboard title with styling for a prominent appearance.

- **Main Content**:
  - Contains four primary sections for functionality:
    1. **New Onsite Request**:
       - Textboxes for date and details, and a submit button to create a new onsite request.
    2. **Update Onsite Request**:
       - Textboxes for onsite ID, date, and details, and an update button for modifying existing requests.
    3. **Change Password**:
       - Textboxes for current and new passwords with a change button to update the password.
    4. **Feedback**:
       - Textbox for entering feedback and a button to send the feedback.

- **GridView**:
  - Displays a grid view for onsite reports with a refresh button to update the report.

#### JavaScript

- **Bootstrap Bundle**:
  - Includes the Bootstrap JavaScript bundle for interactive components.

## Styling

### Global Styles

- **Background**:
  - Gradient background from green to blue.

### Header

- **Styling**:
  - Centered text with a dark background and white font for prominence.

### Cards

- **General**:
  - Cards are styled to be full-width with a consistent look and feel.
  
- **Card-Specific**:
  - Cards for different functionalities (Onsite Request, Update, Password, Feedback) are visually distinct with a focus on usability.

### Buttons

- **Primary Buttons**:
  - Full-width buttons for actions such as submitting requests, updating information, and sending feedback.

### GridView

- **Styling**:
  - Includes Bootstrap classes for a clean and responsive table layout.

## Usage

1. **New Onsite Request**:
   - Enter the onsite date and details, then click "Submit Request" to create a new request.

2. **Update Onsite Request**:
   - Provide the onsite ID, new date, and updated details, then click "Update Request" to modify an existing request.

3. **Change Password**:
   - Input the current password, new password, and confirm the new password, then click "Change Password" to update your credentials.

4. **Feedback**:
   - Enter feedback in the provided textbox and click "Send Feedback" to submit your comments.

5. **View Onsite Report**:
   - Click "Refresh Onsite" to update the GridView with the latest onsite report data.



Here's a detailed README for the `8HRPage.aspx` file, which describes the HR Dashboard functionality:

# HR Dashboard README

## Overview

The **HR Dashboard** page is a component of the E-Visa Portal designed for HR professionals to manage visa requests, update visa statuses, change passwords, and view employee and visa reports. This page uses ASP.NET Web Forms to handle server-side operations and incorporates Bootstrap for styling.

## File Structure

### ASPX Page

- **`8HRPage.aspx`**: This page provides the HR dashboard interface with multiple functionalities including managing visa requests, updating visa statuses, and viewing employee data.

### HTML Layout

The HTML structure includes Bootstrap for responsive design and custom CSS for additional styling.

#### Head Section

- **Meta Charset**:
  - Sets the character encoding to UTF-8 for proper text rendering.

- **Title**:
  - Sets the page title to "HR Dashboard".

- **Bootstrap CSS**:
  - Includes Bootstrap 5.3.3 for styling and responsive layout.

- **Custom CSS**:
  - Defines styles for the background, header, card layout, grid view, and buttons.

#### Body Section

- **Form**:
  - Contains the server-side controls with `runat="server"` to enable server-side processing.

- **Header**:
  - Fixed position header with a background color and centered text to ensure it's always visible.

- **Main Content**:
  - Contains various functional sections organized into cards:

    1. **New Visa Request**:
       - Form fields to enter employee ID, visa type, expiry date, and renewal request details.
       - Submit button to create a new visa request.

    2. **Update Visa Request**:
       - Form fields to enter visa ID and final result.
       - Update button to modify an existing visa request.

    3. **Change Password**:
       - Fields for current password, new password, and confirm new password.
       - Change password button.

    4. **Feedback**:
       - Textbox for entering feedback.
       - Send feedback button.

- **GridView Sections**:
  - **View Employees**:
    - A GridView to display employee data.
    - Refresh button to update the employee list.

  - **Reporting**:
    - A GridView to display visa reporting data with columns automatically generated.
    - Refresh button to update the reporting data.

#### JavaScript

- **Bootstrap Bundle**:
  - Includes Bootstrap JavaScript for interactive components and features.

## Styling

### Global Styles

- **Background**:
  - Gradient background from light purple to dark purple.

### Header

- **Styling**:
  - Fixed position at the top of the page with a contrasting color for visibility.

### Cards

- **General**:
  - Cards are styled to be full-width with a centered text layout and flexible content areas.

- **Card-Specific**:
  - Each card has a unique title and functionality with dedicated form fields and buttons.

### GridView

- **Styling**:
  - Borders and padding for table cells.
  - Header cells have a different background color for distinction.

### Buttons

- **Primary Buttons**:
  - Full-width buttons for actions such as submitting and updating requests, and sending feedback.

## Usage

1. **New Visa Request**:
   - Enter the required information (Employee ID, Visa Type, Expiry Date, Renewal Request).
   - Click "Submit Request" to create a new visa request.

2. **Update Visa Request**:
   - Provide the Visa ID and Final Result.
   - Click "Update Request" to update the visa status.

3. **Change Password**:
   - Input the current password, new password, and confirm the new password.
   - Click "Change Password" to update the password.

4. **Feedback**:
   - Enter feedback in the provided textbox.
   - Click "Send Feedback" to submit your comments.

5. **View Employees**:
   - Click "Refresh Employees" to update the GridView with the latest employee data.

6. **Reporting**:
   - Click "Refresh Employees" to update the GridView with the latest visa reporting data.



Certainly! A README file for your `Admin Management Dashboard` page will provide users with essential information about the page, its functionality, and how to use it. Here's a sample README:

---

# Admin Management Dashboard

## Overview

The Admin Management Dashboard is a web application interface designed for administrative management tasks. It provides functionalities to manage HR and employee records, view visa statuses, and handle various reports. This dashboard uses ASP.NET Web Forms and includes various pop-ups for different administrative tasks.

## Features

- **Add HR**: Enter basic details and generate login credentials for HR personnel.
- **Manage HR**: View, edit, or delete existing HR records.
- **Add Employee**: Enter basic details and generate login credentials for employees.
- **Manage Employee**: View, edit, or delete existing employee records.
- **Visa Status**: View and manage visa status, including expiry information and renewal requests.
- **Applicant Report**: Search and view reports of applicants, filtered by name or location.
- **Interview Report**: View reports of employee interviews and their statuses.
- **Result Report**: View final results and details of candidates.
- **Onsite Report**: View onsite details entered by employees.
- **Feedback**: View and manage feedback submitted by employees and HR.

## Setup & Installation

### Prerequisites

- **ASP.NET Web Forms**: Ensure you have a compatible environment to run ASP.NET Web Forms applications.
- **Bootstrap 5**: For styling and responsive design. (Loaded via CDN in the page.)

### Steps

1. **Clone the Repository**:
   ```sh
   git clone <repository-url>
   ```

2. **Open the Project**:
   - Open the project in Visual Studio or your preferred IDE that supports ASP.NET Web Forms.

3. **Run the Application**:
   - Build and run the project using the IDE or a command line tool.

4. **Access the Dashboard**:
   - Navigate to `5AdminPage.aspx` in your browser to access the admin dashboard.

## Usage

1. **Adding HR**:
   - Click the "Add HR" button to open the pop-up form where you can enter HR details.

2. **Managing HR**:
   - Click the "Manage HR" button to view and manage existing HR records.

3. **Adding Employee**:
   - Click the "Add Employee" button to open the form for adding new employee details.

4. **Managing Employee**:
   - Click the "Manage Employee" button to view and manage existing employee records.

5. **Viewing Visa Status**:
   - Click the "View Visa Status" button to see and manage visa details.

6. **Applicant Report**:
   - Click "View Applicant Report" to search and view applicant details.

7. **Interview Report**:
   - Click "View Interview Report" to see reports on interviews.

8. **Result Report**:
   - Click "View Result Report" to view final candidate results.

9. **Onsite Report**:
   - Click "View Onsite Report" to see onsite details.

10. **Feedback**:
    - Click "View Feedback" to manage and review feedback.

## Customization

- **Styling**: Modify `styles.css` and embedded styles to customize the appearance of the dashboard.
- **Functionality**: Update the code-behind files (`5AdminPage.aspx.cs`) to adjust the backend logic and data handling.

## Contributing

If you wish to contribute to this project, please fork the repository and submit a pull request with your changes. Ensure your contributions adhere to the existing code style and functionality.

## License

This project is licensed under the Apache License License. See the License file for details.

## Contact

For any questions or issues, please contact the project maintainer at https://github.com/Devanshsati.

