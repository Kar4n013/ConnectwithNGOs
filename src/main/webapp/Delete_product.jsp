<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ page import="java.sql.*"%>
<%@ page import="db_config.GetConnection"%>
<html lang="en">
<head>
<title>Delete</title>
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
body {
	background-image: url("temp4.jpg?v=2");
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	font-family: 'Cinzel', serif;
}
</style>
</head>

<body class="">

	<header>
		<center>
			<h1 class="text-white my-3">Product Management System</h1>
		</center>
	</header>
	<main class="text-white">
		<div class="container mt-5"
			style="padding: 25px; background-color: rgba(0, 0, 0, 0.2); border-radius: 15px; margin-top: 80px;">
			<h2 class="text-center mb-4">Delete Product</h2>
			<form method="post" action="ProductServlet" class="mx-auto"
				style="max-width: 500px;">
				<div class="mb-3">
					<label for="product_id" class="form-label">Product Id</label> <input
						type="number" class="form-control" id="product_id"
						name="product_id" placeholder="Enter product Id" required>
				</div>
				<div class="text-center">
					<button type="submit" name="delete" value="delete"
						class="btn btn-primary px-4">Delete</button>
				</div>
			</form>
			<c:if test="${not empty errorMsg}">
				<div
					style="color: red; text-align: center; margin-top: 20px; font-weight: bold; padding: 1%; background-color: white; border: 1px solid red; margin-top: 25px;">${errorMsg}</div>
			</c:if>
			<div style="text-align: center; margin-top: 20px;">
				<a class="btn btn-outline-light btn-lg fs-4"
					href="Register_product.jsp" aria-current="page"
					style="font-weight: bold;"> Add New Product </a>
			</div>
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
