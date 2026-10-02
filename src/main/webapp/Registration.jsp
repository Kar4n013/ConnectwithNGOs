<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="en" data-bs-theme="light">
    <head>
        <title>Registration</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS v5.3.8 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
            crossorigin="anonymous"
        />
        
        <style>
            body{
    background-color: rgb(244, 148, 84);
}
.formbox{
    margin: 400px;
    padding: 10px;
    background-color: rgba(213, 125, 67, 0.187);
}
input,select{
    margin: 20px;
    margin-left: 50px;
    margin-right: 200px;
    border-radius: 10px;
    text-align: center;
}
input:hover{
    scale: 1.03;
}

button{
    margin-left: 100px;
}

button:hover{
    scale: 1.03;
}
        </style>
    </head>

    <body>
        
        <main>
            <div class="formbox text-center my-5">
                <form action="RegistrationServlet" method="post">
                    <h2>Register</h2>
                    <div class="mb-5 w-75">    
                        <input
                            type="text"
                            class="form-control "
                            name="name"
                            id="name"
                          
                            placeholder="Enter Name"
                        />
                     
                        <input
                            type="tel"
                            class="form-control"
                            name="phone"
                            id="phone"
                            aria-describedby="helpId"
                            placeholder="Enter Phone Number"
                        />
                      
                     
                        <input
                            type="email"
                            class="form-control"
                            name="email"
                            id="email"
                            aria-describedby="helpId"
                            placeholder="Enter Email id"
                        />
                      
                        <input
                            type="text"
                            class="form-control"
                            name="state"
                            id="state"
                            
                            placeholder="Enter your State name"
                        /> 
                     
                        <input
                            type="text"
                            class="form-control"
                            name="district"
                            id="district"
                            aria-describedby="helpId"
                            placeholder="Enter your district name"
                        />
                      
                   
                        <select
                            class="form-select form-select-md"
                            name="role"
                            id="role"
                        >
                            <option selected>Select one Role</option>
                            <option value="admin">Admin</option>
                            <option value="donor">Donor</option>
                          
                        </select>
                    
                        <input
                            type="password"
                            class="form-control"
                            name="password"
                            id="password"
                            placeholder="password"
                        />
                    
                    
                    <button
                        type="submit"
                        class="btn btn-primary"
                    >
                        Submit
                    </button>
                    
                    <a href="Login.jsp">Visit Example Website</a>
                    
                    </div>
                </form>
            </div>
        </main>
       
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
