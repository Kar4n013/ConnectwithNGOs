<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, model.Order_pojo"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Orders List</title>
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

/* Body */
body {
    background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));
    font-family: 'Poppins', sans-serif;
    color: #fff;
    min-height: 100vh;
    display: flex;
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

/* Special Logout hover */
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
    background: #fff;
    border-radius: 16px;
    padding: 25px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
    color: #000;
}

.table {
    font-size: 1.05rem;
    border-radius: 10px;
    overflow: hidden;
}

.table thead th {
    background-color: #004085 !important;
    color: #fff;
    text-align: center;
}

.table tbody tr:hover {
    background: rgba(0, 64, 133, 0.07);
}

.table tbody td {
    vertical-align: middle;
    text-align: center;
}

/* Status colors */
.badge {
    font-size: 1rem;
    padding: 0.6em 1.2em;
    border-radius: 8px;
}
.status-pending { background-color: #fff3cd !important; }
.status-shipped { background-color: #cfe2ff !important; }
.status-delivered { background-color: #d1e7dd !important; }
.status-cancelled { background-color: #f8d7da !important; }

/* Buttons */
.custom-btn {
    background-color: #fff;
    color: #004085;
    font-weight: bold;
    border-radius: 8px;
    transition: 0.3s ease;
}
.custom-btn:hover {
    background-color: green;
    color: #fff;
    transform: scale(1.05);
}
.btn-primary {
    background-color: #004085;
    border: none;
}
.btn-primary:hover {
    background-color: #0062cc;
    transform: scale(1.05);
}

/* Footer */
footer {
    background: rgba(0, 0, 0, 0.3);
    margin-top: auto;
    font-size: 0.95rem;
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
                            <td><li class="nav-item"><a href="OrderServlet" class="nav-link active">Orders</a></li></td>
                        </tr>
                        <tr>
                            <td><li class="nav-item"><a href="ReportServlet" class="nav-link">Reports</a></li></td>
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
        <header class="py-4 text-center">
            <h1 class="text-white fw-bold">Product Management System</h1>
        </header>

        <div class="container-fluid py-4">
            <h2 class="mb-4 text-center text-white" style="font-size: 38px;">Orders List</h2>

            <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
            %>
            <div class="alert alert-success text-center mb-3 shadow"><%=message%></div>
            <%
            }
            %>

            <div class="table-container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Buyer ID</th>
                            <th>Seller Port ID</th>
                            <th>Order Date</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Delivery Address</th>
                            <th>Update Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        List<Order_pojo> orders = (List<Order_pojo>) request.getAttribute("orders");
                        if (orders != null && !orders.isEmpty()) {
                            for (Order_pojo o : orders) {
                                String statusClass = "";
                                String badgeClass = "";

                                if ("PENDING".equalsIgnoreCase(o.getStatus())) {
                                    statusClass = "status-pending";
                                    badgeClass = "bg-warning text-dark";
                                } else if ("SHIPPED".equalsIgnoreCase(o.getStatus())) {
                                    statusClass = "status-shipped";
                                    badgeClass = "bg-primary";
                                } else if ("DELIVERED".equalsIgnoreCase(o.getStatus())) {
                                    statusClass = "status-delivered";
                                    badgeClass = "bg-success";
                                } else if ("CANCELLED".equalsIgnoreCase(o.getStatus())) {
                                    statusClass = "status-cancelled";
                                    badgeClass = "bg-danger";
                                }
                        %>
                        <tr>
                            <td><%=o.getOrderId()%></td>
                            <td><%=o.getBuyerId()%></td>
                            <td><%=o.getSellerPortId()%></td>
                            <td><%=o.getOrderDate()%></td>
                            <td>₹<%=o.getTotalAmount()%></td>
                            <td class="<%=statusClass%>">
                                <span class="badge <%=badgeClass%>"><%=o.getStatus()%></span>
                            </td>
                            <td class="text-start"><%=o.getDeliveryAddress()%></td>
                            <td>
                                <form method="post" action="OrderServlet" class="d-flex flex-column gap-2">
                                    <input type="hidden" name="order_id" value="<%=o.getOrderId()%>">
                                    <select name="status" class="form-select form-select-sm">
                                        <option value="PENDING" <%= "PENDING".equalsIgnoreCase(o.getStatus()) ? "selected" : "" %>>PENDING</option>
                                        <option value="SHIPPED" <%= "SHIPPED".equalsIgnoreCase(o.getStatus()) ? "selected" : "" %>>SHIPPED</option>
                                        <option value="DELIVERED" <%= "DELIVERED".equalsIgnoreCase(o.getStatus()) ? "selected" : "" %>>DELIVERED</option>
                                        <option value="CANCELLED" <%= "CANCELLED".equalsIgnoreCase(o.getStatus()) ? "selected" : "" %>>CANCELLED</option>
                                    </select>
                                    <button type="submit" class="btn btn-sm btn-primary shadow">Update</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center text-muted">No orders found</td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <footer class="text-white py-3 text-center mt-4">
            <div class="container">
               
                <strong>&copy; All Rights Reserved</strong>
            </div>
        </footer>
    </div>
</body>
</html>

