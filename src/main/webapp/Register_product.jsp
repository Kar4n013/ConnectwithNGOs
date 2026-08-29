<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Add Product</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

.main-content {
    margin-left: 240px;
    padding: 30px;
    width: calc(100% - 240px);
}

.card-custom {
    background:  rgba(255, 255, 255, 0.08);
    border-radius: 16px;
    padding: 30px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.25);
}
.form-label{
color: white;
}
.form-control {
    transition: all 0.2s ease-in-out;
    font-size: 16px;
    color: #333;
    border-radius: 10px;
}

.form-control:focus {
    transform: scale(1.05);
    font-size: 18px;
    color: #000;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
    border-color: #000;
}

.btn-primary {
    background-color: #004085;
    border: none;
    border-radius: 10px;
    transition: 0.3s ease;
}

.btn-primary:hover {
    transform: scale(1.05);
    background-color: #218838;
}

.custom-btn {
    background-color: white;
    color: black;
    font-weight: bold;
    border-radius: 10px;
    border: 2px solid white;
    transition: 0.3s ease;
}

.custom-btn:hover {
    transform: scale(1.05);
    background-color: white;
    color: red;
    text-decoration: none;
}

footer {
    background: rgba(0, 0, 0, 0.3);
}
</style>
</head>

<body>
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
                        <td><li class="nav-item"><a href="Register_product.jsp" class="nav-link active">Product</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="OrderServlet" class="nav-link">Orders</a></li></td>
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

<div class="main-content">
<header class="py-3 text-center">
    <h1 class="text-white">Product Management System</h1>
</header>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
            <div class="card-custom text-dark">
                <h2 class="mb-4 text-center text-white">Add Product</h2>

                <form method="post" action="ProductServlet" class="mt-3">
                    <div class="mb-3">
                        <label for="productName" class="form-label fw-semibold">Product Name</label>
                        <input type="text" class="form-control" id="productName"
                            name="productName" placeholder="Enter product name" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label fw-semibold">Description</label>
                        <textarea class="form-control" id="description" name="description"
                            rows="3" placeholder="Enter product description" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="quantity" class="form-label fw-semibold">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity"
                            placeholder="Enter quantity" required>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label fw-semibold">Price</label>
                        <input type="number" step="0.01" class="form-control" id="price"
                            name="price" placeholder="Enter price" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" name="insert" value="insert"
                            class="btn btn-primary fw-bold shadow-sm px-5">➕ Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="text-center mt-4 d-flex justify-content-center gap-4">
        <form action="ProductServlet" method="post">
            <button type="submit" name="show" value="show"
                class="btn btn-lg px-5 shadow fw-bold custom-btn">📦 Show Products</button>
        </form>
    </div>
</div>

<footer class="text-white py-3 text-center">
    <div class="container">
        <strong>&copy; All Rights Reserved By</strong>
    </div>
</footer>
</div>
</body>
</html>
