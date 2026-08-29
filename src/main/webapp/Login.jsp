<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));
            font-family: 'Poppins', sans-serif;
        }
        .card {
            border: none;
            border-radius: 1.5rem;
            overflow: hidden;
        }
        .form-control {
            transition: all 0.2s ease-in-out;
            font-size: 16px;
            color: #333;
            border-radius: 0.75rem;
        }
        .form-control:focus {
            transform: scale(1.05);
            font-size: 18px;
            color: #000;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.4);
            border-color: #000;
        }
        .btn-custom {
            border-radius: 50rem;
            font-weight: 600;
            padding: 0.75rem;
            transition: 0.2s ease-in-out;
        }
        .btn-custom:hover {
            transform: scale(1.03);
        }
        .card-header {
            background: rgb(255, 193, 7);
            color: black;
            padding: 2rem;
            text-align: center;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center vh-100">

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg">
                <div class="card-header">
                    <h2 class="fw-bold mb-0 background-warning">Login</h2>
                </div>
                <div class="card-body p-4">
                    <form method="post" action="login">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Port ID</label>
                            <input type="text" class="form-control form-control-lg"
                                   name="seller_id" placeholder="Enter Seller Port ID" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Password</label>
                            <input type="password" class="form-control form-control-lg"
                                   name="password" placeholder="Enter Password" required>
                        </div>
                        <button type="submit" class="btn btn-warning w-100 btn-lg btn-custom mb-3">
                            Login
                        </button>
                    </form>

                    <a href="Registration.jsp"
                       class="btn btn-outline-dark w-100 btn-lg btn-custom">Register</a>

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
        </div>
    </div>
</div>

</body>
</html>
