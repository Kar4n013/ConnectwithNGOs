<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Password</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* reuse same styles from Profile.jsp */
body {
    background:linear-gradient(135deg, rgb(24, 28, 35), rgb(36, 46, 56));;
    font-family:'Poppins',sans-serif;
    color:#fff;
    display:flex;
    min-height:100vh;
}
.main-content {
    margin:auto;
    width:100%;
    max-width:500px;
    padding:30px;
}
.card-custom {
    background:rgba(255, 255, 255, 0.08);
    border-radius:16px;
    padding:30px;
    box-shadow:0 6px 18px rgba(0,0,0,0.25);
    color:#000;
}
.form-label{
color: white;
}
</style>
</head>
<body>
<div class="main-content">
    <div class="card-custom">
        <h2 class="mb-4 text-center text-white">Update Password</h2>

        <form method="post" action="ProfileServlet">
            <!-- Current Password -->
            <div class="mb-3">
                <label class="form-label fw-semibold">Current Password</label>
                <input type="password" name="currentPassword" class="form-control" placeholder="Enter current password" required>
            </div>

            <!-- New Password -->
            <div class="mb-3">
                <label class="form-label fw-semibold">New Password</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Enter new password" required>
            </div>

            <div class="text-center">
                <button type="submit" name="action" value="updatePassword" class="btn btn-primary fw-bold shadow-sm px-4">🔑 Update Password</button>
                <a href="ProfileServlet" class="btn btn-secondary fw-bold shadow-sm px-4">⬅ Back</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
