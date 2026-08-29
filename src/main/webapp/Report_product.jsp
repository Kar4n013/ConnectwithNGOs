<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, model.Report_pojo"%>
<!DOCTYPE html>
<html>
<head>
<title>Reported Products</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root {
    --sidebar-bg: #2c2c2c;
    --sidebar-link: #e6c06c;
    --sidebar-hover-bg: #e6c06c;
    --sidebar-hover-text: #000;
    --border-color: #555;
}

body {
    background:  linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));;
    font-family: 'Poppins', sans-serif;
    color: #fff;
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    height: 100vh;
    width: 240px;
    position: fixed;
    top: 0;
    left: 0;
    background-color: var(--sidebar-bg);
    padding-top: 70px;
    box-shadow: 3px 0 10px rgba(0, 0, 0, 0.3);
}

.sidebar a {
    color: var(--sidebar-link);
    font-weight: 500;
    transition: all 0.3s ease-in-out;
    padding: 8px 14px;
    border-radius: 8px;
    display: block;
}

.sidebar a.active, .sidebar a:hover {
    background-color: var(--sidebar-hover-bg);
    color: var(--sidebar-hover-text);
}

/* Logout */
.sidebar a.logout {
    color: rgb(0, 0, 0);
    background: rgb(255, 215, 128);
    font-weight: 700;
}

.sidebar a.logout:hover {
    background: rgb(255, 255, 255) !important;
    color: rgb(220, 0, 0) !important;
    transform: scale(1.05);
    box-shadow: 0 0 12px rgba(0, 0, 0, 0.3);
}

.sidebar th {
    color: rgb(255, 215, 128);
    text-align: center;
    font-size: 1.2rem;
    padding-bottom: 10px;
}

.sidebar td {
    padding: 5px 0;
    border-bottom: 1px solid var(--border-color);
}

/* Main content */
.main-content {
    margin-left: 240px;
    padding: 30px;
    width: calc(100% - 240px);
}

/* Table container */
.table-container {
    background: #ffffff;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.2);
    color: #000;
}

.table thead th {
    background-color: #004085 !important;
    color: white;
    text-align: center;
}

.table tbody td {
    vertical-align: middle;
    text-align: center;
}

/* Buttons */
.custom-btn {
    background-color: white;
    color: #004085;
    font-weight: bold;
    transition: 0.3s ease;
    border-radius: 8px;
}
.custom-btn:hover {
    background-color: #218838;
    color: white;
}

/* Footer */
footer {
    background: rgba(0,0,0,0.3);
}
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar d-flex flex-column p-4">
    <ul class="nav nav-pills flex-column">
        <div class="table-responsive-sm">
            <table class="fs-5">
                <thead>
                    <tr>
                        <th scope="col">Seller Dashboard</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><li class="nav-item"><a href="Register_product.jsp" class="nav-link">Products</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="OrderServlet" class="nav-link">Orders</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="ReportServlet" class="nav-link active">Reports</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="ProfileServlet" class="nav-link">Profile</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="DashboardServlet" class="nav-link">Back to Dashboard</a></li></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
<header class="py-3 text-center">
    <h1 class="text-white">Product Management System</h1>
</header>

<div class="container py-5">
    <h2 class="mb-4 text-center text-white" style="font-size: 42px;">Reported Products</h2>

    <% String message = (String) request.getAttribute("message");
       if (message != null) { %>
       <div class="alert alert-success text-center mb-3 shadow"><%=message%></div>
    <% } %>

    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Reported ID</th>
                    <th>Product ID</th>
                    <th>Reporter ID</th>
                    <th>Reason</th>
                    <th>Reported At</th>
                    <th>Status</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Report_pojo> reports = (List<Report_pojo>) request.getAttribute("reports");
                if (reports != null && !reports.isEmpty()) {
                    for (Report_pojo r : reports) {
                %>
                <tr>
                    <td><%=r.getReportedId()%></td>
                    <td><%=r.getProductId()%></td>
                    <td><%=r.getReporterId()%></td>
                    <td class="text-start"><%=r.getReason()%></td>
                    <td><%=r.getReportedAt()%></td>
                    <td>
                        <span class="badge <%= "RESOLVED".equals(r.getStatus()) ? "bg-success" : "bg-warning text-dark" %>">
                            <%=r.getStatus()%>
                        </span>
                    </td>
                    <td>
                        <form method="post" action="ReportServlet" class="d-flex flex-column gap-2">
                            <input type="hidden" name="reported_id" value="<%=r.getReportedId()%>">
                            <select name="status" class="form-select form-select-sm">
                                <option value="OPEN" <%= "OPEN".equals(r.getStatus()) ? "selected" : "" %>>OPEN</option>
                                <option value="RESOLVED" <%= "RESOLVED".equals(r.getStatus()) ? "selected" : "" %>>RESOLVED</option>
                            </select>
                            <button type="submit" class="btn btn-sm btn-primary shadow">Update</button>
                        </form>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="7" class="text-center text-muted">No reports found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<footer class="text-white py-3 text-center">
    <div class="container">
        
        <strong>&copy; All Rights Reserved</strong>
    </div>
</footer>

</div>
</body>
</html>
