<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Poppins', sans-serif;
}

.form-control {
	transition: all 0.2s ease-in-out;
	font-size: 16px;
	color: #333;
}

.form-control:focus {
	transform: scale(1.03);
	font-size: 18px;
	color: #000;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	border-color: #000000;
}

/* Wrapper ensures scrollability */
.wrapper {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow-y: auto;
	padding: 20px;
}

.card-custom {
	width: 100%;
	max-width: 520px;
	background: rgba(0, 0, 0, 0.75);
	color: white;
	border-radius: 1rem;
	padding: 2rem;
}
</style>
</head>
<body style="background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));">

	<div class="wrapper">
		<div class="card shadow-lg rounded-4 p-4 "
			style="width: 100%; max-width: 500px; background: rgba(0, 0, 0, 0.7); color: white; margin-top: 150px;">

			<h2 class="mb-4 text-center text-white">User Registration</h2>

			<form method="post" action="register"
				onsubmit="return validatePassword()">
				<div class="mb-3">
					<label class="form-label fw-semibold">Port ID</label> <input
						type="text" class="form-control form-control-lg" name="port_id"
						placeholder="Enter unique Port ID" required>
				</div>
				<div class="mb-3">
					<label class="form-label fw-semibold">Password</label> <input
						type="password" class="form-control form-control-lg"
						name="password" id="password" placeholder="Enter Password"
						minlength="8" required>
				</div>

				<div class="mb-3">
					<label class="form-label fw-semibold">Confirm Password</label> <input
						type="password" class="form-control form-control-lg"
						name="confirm_password" id="confirm_password"
						placeholder="Confirm Password" required>
					<div id="password-message" class="text-danger mt-1"></div>
				</div>
				<div class="mb-3">
					<label class="form-label fw-semibold">Location</label> <input
						type="text" class="form-control form-control-lg" name="location"
						placeholder="Enter Location" required>
				</div>
				<div class="mb-3">
					<label class="form-label fw-semibold">Name</label> <input
						type="text" class="form-control form-control-lg" name="name"
						placeholder="Enter Full Name" required>
				</div>
				<div class="mb-3">
					<label class="form-label fw-semibold">Email</label> <input
						type="email" class="form-control form-control-lg" name="email"
						placeholder="Enter Email Address" required>
				</div>
				<button type="submit"
					class="btn btn-warning w-100 btn-lg rounded-pill fw-bold">Register</button>
			</form>

			<div class="text-center mt-3">
				<span>Already have an account? </span> <a href="Login.jsp"
					class="text-warning fw-bold">Login here</a>
			</div>

			<%
			String error = (String) request.getAttribute("errorMessage");
			if (error != null) {
			%>
			<div class="alert alert-danger text-center mt-3"><%=error%></div>
			<%
			}
			%>
		</div>
	</div>

	<script>
		function validatePassword() {
			const password = document.getElementById("password").value;
			const confirmPassword = document.getElementById("confirm_password").value;
			const message = document.getElementById("password-message");

			if (password !== confirmPassword) {
				message.textContent = "Passwords do not match!";
				return false;
			} else {
				message.textContent = "";
				return true;
			}
		}
	</script>

</body>
</html>
