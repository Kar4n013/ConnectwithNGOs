<!doctype html>
<html lang="en" data-bs-theme="light">
    <head>
        <title>Dashboard</title>
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
            <nav
                class="navbar navbar-expand-sm navbar-light bg-light"
            >
                <div class="container">
                   <h2>Hello </h2> 
                    
                    <div class="collapse navbar-collapse" id="collapsibleNavId">
                        <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                           
                                <a class="nav-link active mt-1" href="#" aria-current="page"
                                    > <h4>Insert Item</h4>
                                    <span class="visually-hidden">(current)</span></a
                                >
                           
                            
                        </ul>
                        <form class="d-flex my-2 my-lg-0" method="post" action="InsertProduct.jsp">
                           
                            <button
                                class="btn btn-outline-success my-2 my-sm-0"
                                type="submit"
                            >
                                Insert Item
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
            
        </header>
        <main>

            <div
                class="container"
            >
                <div class="card mb-3" style="max-width: 540px;" >
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img
                                src="Image Source"
                                class="img-fluid rounded-start"
                                alt="Card title"
                            />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">
                                    This is a wider card with supporting text below as a
                                    natural lead-in to additional content. This content is a
                                    little bit longer.
                                </p>
                                <p class="card-text">
                                    <small class="text-body-secondary"
                                        >Last updated 3 mins ago</small
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            

        </main>
        <footer>
            
        </footer>
        <!-- Bootstrap JavaScript Bundle (includes Popper) -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
