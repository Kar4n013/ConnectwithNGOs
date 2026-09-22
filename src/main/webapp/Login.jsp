<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="logindesign.css">
</head>

<body>

    <div class="mainbox">
        <div class="role">
            <button class="rolebutton" onclick="admin()" id="admin">Admin</button>
            <button class="rolebutton" onclick="donor()" id="donor">Donor</button>
        </div>
        <div class="credentialbox">
            <form action="LoginServlet" method="post">
                <input type="text" id = "user" name="admin"  placeholder="Admin Id (Phone Number or Email)">
                <input type="password" id = "password" name="pass" placeholder="Password">
                <button type="submit" class="proceed">
                    Proceed
                </button>
            </form>
        </div>
    </div>
    <script>
        const roles = document.getElementById("user");
        function admin() {
            roles.placeholder = "Admin Id (Phone Number or Email)";
            roles.name = "admin";
            active()
        }

        function donor() {
            roles.placeholder = "Donor Id (Phone Number or Email)";
            roles.name = "donor";
            active()
        }

        function active() {
            if (roles.name === 'admin') {
                document.getElementById('admin').style.backgroundColor = "white";
                document.getElementById('donor').style.backgroundColor = "rgba(238, 199, 147, 0.7)";
            } else {
                document.getElementById('donor').style.backgroundColor = "white";
                document.getElementById('admin').style.backgroundColor = "rgba(238, 199, 147, 0.7)";
            }
        }

        active();
    </script>

</body>

</html>