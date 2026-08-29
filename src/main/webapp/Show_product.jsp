<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Product_pojo"%>
<!doctype html>
<html lang="en">
<head>
<title>Show</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap"
	rel="stylesheet">
<style>
.btn {
	background-color: white;
	color: #004085;
	font-weight: bold;
	border-radius: 8px;
	transition: 0.3s ease;
}

.btn:hover {
	transform: scale(1.05);
	background-color: green;
	color: white;
}
.custom-button:hover{
transform: scale(1.05);
}
.dashboard-btn {
	font-weight: bold;
	border: 2px solid white;
	border-radius: 10px;
	color: white;
	background-color: transparent;
	padding: 10px 25px;
	transition: 0.3s;
	text-decoration: none;
}

.dashboard-btn:hover {
	transform: scale(1.05);
	background-color: white;
	color: black;
}
</style>
</head>
<body
	style="background:  linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));; font-family: 'Cinzel', serif; color: white;">

	<header>
		<center>
			<h1 class="text-white my-3">Product Management System</h1>
		</center>
	</header>

	<main class="d-flex justify-content-center">
		<div class="p-5 mt-auto mb-5 text-center text-light fw-bold"
			style="padding: 25px; background-color: rgba(0, 0, 0, 0.2); border-radius: 15px; margin-top: 80px;">
			<h3 class="text-light fw-bold">All Products</h3>

			<%
			String sellerId = (String) session.getAttribute("sellerId");
			if (sellerId == null) {
			%>
			<div class='alert alert-danger'>Session expired. Please verify
				again.</div>
			<%
			} else {
			out.println("<div class='alert alert-success'>Welcome Seller: " + sellerId + "</div>");
			List<Product_pojo> product = (List<Product_pojo>) request.getAttribute("product");
			%>

			<div class="table-responsive">
				<table
					class="table table-striped table-bordered table-hover align-middle text-center">
					<thead class="table-dark">
						<tr>
							<th>Seller Port ID</th>
							<th>Product ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Created At</th>
							<th>Updated At</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (product != null && !product.isEmpty()) {
							for (Product_pojo p : product) {
						%>
						<tr>
							<td><%=p.getSeller_port_id()%></td>
							<td><%=p.getProduct_id()%></td>
							<td><%=p.getProduct_name()%></td>
							<td><%=p.getDescription()%></td>
							<td><%=p.getQuantity()%></td>
							<td>₹<%=p.getPrice()%></td>
							<td><%=p.getCreated_at()%></td>
							<td><%=p.getUpdated_at()%></td>
							<td>
								<form action="ProductServlet" method="post"
									onsubmit="return confirmAction(event)">
									<input type="hidden" name="product_id"
										value="<%=p.getProduct_id()%>">
									<button type="submit" name="preupdate" value="preupdate"
										class="custom-button"
										style="background-color: green; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
										Update</button>
									<button type="submit" name="delete" value="delete"
										class="custom-button"
										style="background-color: red; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
										Delete</button>
								</form> <script>
									function confirmAction(event) {
										const button = event.submitter;
										if (button.name === "preupdate") {
											return confirm("Are you sure you want to UPDATE this product?");
										} else if (button.name === "delete") {
											return confirm("⚠️ Are you sure you want to DELETE this product? This action cannot be undone.");
										}
										return true;
									}
								</script>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="8" class="text-danger">No products found for
								Seller ID <%=sellerId%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>

			<!-- Add New Product Button -->
			<div style="text-align: center; margin-top: 20px;">
				<a class="btn btn-outline-light btn-lg fs-4"
					href="Register_product.jsp" aria-current="page"
					style="font-weight: bold;"> Add New Product </a>
			</div>

			<!-- Return to Dashboard Button -->
			<div style="text-align: center; margin-top: 15px;">
				<a class="btn btn-lg fs-4 dashboard-btn" href="DashboardServlet">
					Return to Dashboard </a>
			</div>

		</div>
	</main>

	<footer class="my-4 my-sm-0 mx-4 text-white py-3"
		style="margin-bottom: 200px;">
		<div class="container text-center">
			<strong>&copy; All Rights Reserved By</strong>
		</div>
	</footer>

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
