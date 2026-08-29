<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="model.Profile_pojo"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">

<style>
:root {
	--sidebar-bg: #2c2c2c;
	--sidebar-link: #e6c06c;
	--sidebar-hover-bg: #e6c06c;
	--sidebar-hover-text: #000;
	--border-color: #555;
}

body {
	background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));;
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

/* Main Content */
.main-content {
	margin-left: 240px;
	padding: 30px;
	width: calc(100% - 240px);
}

/* Card & Form */
.card-custom {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(10px);
	border-radius: 16px;
	padding: 30px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.25);
	font-size: 16px; /* fixed */
	color: white;
}

.form-label {
	color: white;
}

.form-control {
	border-radius: 10px;
	transition: all 0.2s ease-in-out;
	font-size: 16px;
	color: #333;
}

.form-control:focus {
	transform: scale(1.05);
	font-size: 18px;
	color: #000;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	border-color: #000;
}

/* Buttons */
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

.btn-danger {
	border: none;
	border-radius: 10px;
	transition: 0.3s ease;
}

.btn-danger:hover {
	transform: scale(1.05);
	background-color: #c82333;
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

<script>
	function confirmUpdate() {
		return confirm("Are you sure you want to update your profile?");
	}
	function confirmDelete() {
		return confirm("Are you sure you want to delete your profile? This action cannot be undone.");
	}
</script>
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
							<td><li class="nav-item"><a href="Register_product.jsp"
									class="nav-link">Product</a></li></td>
						</tr>
						<tr>
							<td><li class="nav-item"><a href="OrderServlet"
									class="nav-link">Orders</a></li></td>
						</tr>
						<tr>
							<td><li class="nav-item"><a href="ReportServlet"
									class="nav-link">Reports</a></li></td>
						</tr>
						<tr>
							<td><li class="nav-item"><a href="ProfileServlet"
									class="nav-link active">Profile</a></li></td>
						</tr>
						<tr>
							<td><li class="nav-item"><a href="DashboardServlet"
									class="nav-link">Back to Dashboard</a></li></td>
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
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-8">
					<div class="card-custom">
						<h2 class="mb-4 text-center text-white">Your Profile</h2>

						<%
						Profile_pojo profile = (Profile_pojo) request.getAttribute("profile");
						String message = (String) request.getAttribute("message");
						if (message != null) {
						%>
						<div
							class="alert alert-success text-center rounded-pill shadow-sm"><%=message%></div>
						<%
						}
						%>

						<%
						if (profile != null) {
						%>
						<form method="post" action="ProfileServlet">
							<div class="mb-3">
								<label class="form-label fw-semibold">Port ID</label> <input
									type="text" class="form-control bg-light"
									value="<%=profile.getPortId()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold">Password</label> <input
									type="password" class="form-control bg-light"
									value="<%=profile.getPassword()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold">Name</label> <input
									type="text" name="name" class="form-control"
									value="<%=profile.getName()%>" placeholder="Enter your name"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold">Location</label> <input
									type="text" name="location" class="form-control"
									value="<%=profile.getLocation()%>"
									placeholder="Enter your location" required>
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold">Email</label> <input
									type="email" name="email" class="form-control"
									value="<%=profile.getEmail()%>" placeholder="Enter your email"
									required>
							</div>

							<div class="d-flex justify-content-center gap-3 mt-4">
								<button type="submit" name="action" value="update"
									class="btn btn-primary fw-bold shadow-sm px-4"
									onclick="return confirmUpdate()">✏️ Update</button>

								<button type="submit" name="action" value="delete"
									class="btn btn-danger fw-bold shadow-sm px-4"
									onclick="return confirmDelete()">🗑️ Delete</button>

								<a href="UpdatePassword.jsp"
									class="btn btn-success fw-bold shadow-sm px-4">🔑 Update
									Password</a>
							</div>

						</form>
						<%
						} else {
						%>
						<div
							class="alert alert-warning text-center rounded-pill shadow-sm">Profile
							not found.</div>
						<%
						}
						%>
					</div>
				</div>
			</div>

			<div class="text-center mt-4 d-flex justify-content-center gap-4">
				<a href="Login.jsp"
					class="btn btn-lg px-5 shadow fw-bold custom-btn">🔒 Logout</a>
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
