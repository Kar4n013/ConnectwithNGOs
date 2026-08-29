<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ page import="java.sql.*"%>
<%@ page import="db_config.GetConnection"%>
<html lang="en">

<head>
<title>Update</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap"
	rel="stylesheet">
<style>
.form-control {
	transition: all 0.2s ease-in-out;
	font-size: 16px;
	color: #333;
}

.form-control:focus {
	transform: scale(1.05);
	font-size: 30px;
	color: #000000;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	border-color: #000000;
}
</style>
</head>

<body style="background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56)); font-family: 'Cinzel', serif;">

	<header>
		<center>
			<h1 class="text-white my-3">Product Management System</h1>
		</center>

	</header>
<%@ page import="model.Product_pojo" %>
<%
    Product_pojo p = (Product_pojo) request.getAttribute("product");
%>

<main class="text-white">
    <div class="container mt-5"
        style="padding: 25px; background-color: rgba(0, 0, 0, 0.2); border-radius: 15px; margin-top: 80px;">
        <h2 class="text-center mb-4">Update Product</h2>
        <form method="post" action="ProductServlet" class="mx-auto"
            style="max-width: 500px;">

            <!-- Keep product_id hidden so user can't change it -->
            <input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">
            <input type="hidden" name="seller_port_id" value="<%=p.getSeller_port_id()%>">

            <div class="mb-3">
                <label for="product_id_display" class="form-label">Product Id</label>
                <input type="text" class="form-control" id="product_id_display"
                       value="<%=p.getProduct_id()%>" disabled>
            </div>

            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName"
                       name="productName" value="<%=p.getProduct_name()%>" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"
                          rows="3" required><%=p.getDescription()%></textarea>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity"
                       value="<%=p.getQuantity()%>" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" step="0.01" class="form-control" id="price"
                       name="price" value="<%=p.getPrice()%>" required>
            </div>

            <div class="text-center">
                <button type="submit" name="update" value="update"
                        class="btn btn-primary px-4">Update</button>
            </div>
        </form>

        <c:if test="${not empty errorMsg}">
            <div style="color: red; text-align: center; margin-top: 20px; font-weight: bold; padding: 1%; margin-top: 25px;">
                ${errorMsg}
            </div>
        </c:if>
    </div>
</main>

	<footer class="text-white py-3">
		<div class="container text-center">

			<strong>&copy; All Rights Reserved By</strong>
		</div>
	</footer>

	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>

</html>