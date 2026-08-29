<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("sellerId") == null) {
    response.sendRedirect("Login.jsp");
    return;
}
String portId = (String) sessionObj.getAttribute("sellerId");
%>

<!doctype html>
<html lang="en">

<head>
    <title>Dashboard</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --main-bg: rgb(20, 20, 20);
            --main-text: rgb(0, 0, 0);
            --sidebar-bg: rgb(38, 38, 38);
            --sidebar-link: rgb(220, 220, 220);
            --sidebar-hover-bg: rgb(102, 102, 102);
            --sidebar-hover-text: rgb(255, 255, 255);
            --border-color: rgb(90, 90, 90);
            --highlight-bg: rgb(186, 141, 68);
            --highlight-hover: rgb(255, 255, 255);
            --highlight-shadow: rgba(0, 0, 0, 0.4);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--main-bg);
            color: var(--main-text);
            line-height: 1.6;
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

        header, main, footer {
            margin-left: 240px;
            color: var(--main-text);
        }

        .custom-box {
            width: calc(100% - 20%);
            margin: 0 auto;
            transition: all 0.3s ease-in-out;
            border-radius: 15px;
            color: var(--main-text);
            font-weight: bold;
            font-size: 1.3rem;
            background: var(--highlight-bg);
        }

        .custom-box:hover {
            transform: scale(1.07);
            background: var(--highlight-hover) !important;
            box-shadow: 0 0 25px var(--highlight-shadow);
            color: var(--main-text) !important;
        }

        .custom-img {
            height: 420px;
            width: 500px
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
        }

        .carousel-caption {
            color: rgb(255, 255, 255);
        }

        header h1 {
            color: rgb(255, 215, 128);
            font-weight: 700;
        }

        header h4 {
            background: none;
            color: rgb(0, 0, 0);
            display: block;
            border-radius: 0;
        }

        header h5 {
            color: rgb(30, 30, 30);
        }

        footer {
            color: rgb(60, 60, 60);
        }
    </style>
</head>

<body style="background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));">

<header class="my-3 text-center position-relative">
    <h1>Import Export ERP System</h1>
    <div class="text-center my-3">
        <div class="d-inline-block px-4 py-3 rounded"
             style="background: rgba(255, 215, 128, 0.8); color: rgb(0, 0, 0);">
            <h4 style="font-size: 2.0rem; font-weight: 600; margin-bottom: 8px;">
                Welcome, <%=portId%> 👋
            </h4>
            <h5 style="font-size: 1.2rem; font-weight: 500; margin: 0;">
                This system makes it easy for sellers to handle their import and export operations.
            </h5>
        </div>
    </div>
</header>

<main>
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
                        <td><li class="nav-item"><a href="OrderServlet" class="nav-link">Order</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="ReportServlet" class="nav-link">Reports</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="ProfileServlet" class="nav-link">Profile</a></li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item"><a href="Login.jsp" class="nav-link logout">Logout</a></li></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </ul>
    </div>
				<h1 class="text-center mt-4 text-white">Seller Dashboard</h1>
    <div class="container mt-4">
        <div class="row g-4 justify-content-center">
            <div class="col-md-3 col-sm-6">
                <div class="card p-3 text-center h-100 shadow-sm custom-box">
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <p class="card-text">${productsCount}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="card p-3 text-center h-100 shadow-sm custom-box">
                    <div class="card-body">
                        <h5 class="card-title">Orders</h5>
                        <p class="card-text">${ordersCount}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="card p-3 text-center h-100 shadow-sm custom-box">
                    <div class="card-body">
                        <h5 class="card-title">Reported</h5>
                        <p class="card-text">${reportedProductsCount}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rounded container mt-2 col-md-8" >
        
        <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="profile.jpg" class="w-100 d-block custom-img" alt="First slide" />
                    <div class="carousel-caption d-none d-md-block" style="top: 40%;">
                        <h4>Profile update</h4>
                        <p class="fs-4">Keep your profile up to date with ease.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="manage.jpg" class="w-100 d-block custom-img" alt="Second slide" />
                    <div class="carousel-caption d-none d-md-block" style="top: 25%;">
                        <h4>Manage Products</h4>
                        <p class="fs-4">Quickly register and manage products in the system.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="order.jpg" class="w-100 d-block custom-img" alt="Third slide" />
                    <div class="carousel-caption d-none d-md-block" style="top: 15%;">
                        <h4>Order Products</h4>
                        <p class="fs-4">Quick and simple product ordering within the system.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="report.jpg" class="w-100 d-block custom-img" alt="Fourth slide" />
                    <div class="carousel-caption d-none d-md-block" style="top: 25%;">
                        <h4>Report Products</h4>
                        <p class="fs-4">Easily report product issues and check updates.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</main>

<footer class="my-3 text-center text-white">
    <h6>&copy; All Rights Reserved By</h6>
</footer>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
