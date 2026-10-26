<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="light">
    <head>
        <title>Insert Product</title>
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
    </head>

    <body>
        <header>
            <!-- place navbar here -->
        </header>
        <main>

            <div
                class="container col-4 text-center"
            >
                <form action="RegisterItemServlet" method="post"  enctype="multipart/form-data" >

                    <h2>Register Item</h2>

                    <div class="mb-3">
                        <label for="title" class="form-label"></label>
                        <input
                            type="text"
                            class="form-control"
                            name="title"
                            id="title"
                            aria-describedby="helpId"
                            placeholder="Enter Item Title"
                        />
                       
                    </div>
                    
                    <div class="mb-3">
                        <label for="Category class="form-label"></label>
                        <select
                            class="form-select form-select-md"
                            name="Category
                            id="Category
                        >
                            <option selected>Select one</option>
                            <option value="Clothing">Clothing</option>
                            <option value="Stationery">Stationery</option>
                            <option value="Books">Books</option>
                            <option value="Electronics">Electronics</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label"></label>
                        <textarea class="form-control" name="description" id="description" rows="3" placeholder="Enter Description"></textarea>
                    </div>
                    
                     <div class="mb-3">
                        <label for="image" class="form-label">Choose file</label>
                        <input
                            type="file"
                            class="form-control"
                            name="image"
                            id="image"
                            placeholder="Enter Image"
                            aria-describedby="fileHelpId"
                        />
                       
                    </div>
                    
                    <button
                        type="submit"
                        class="btn btm-lg btn-primary"
                    >
                        Submit
                    </button>
                    




                </form>
            </div>
            

        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Bundle (includes Popper) -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
