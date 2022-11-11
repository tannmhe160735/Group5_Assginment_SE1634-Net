<%-- 
    Document   : home
    Created on : Oct 1, 2022, 11:58:34 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tùy Store</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/footer.css" rel="stylesheet" />
    </head>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="home.jsp">Tùy Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <span class="fas fa-bars ms-1"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <c:if test="${sessionScope.acc.role_id eq 1}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="admin">Management</a></li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role_id eq 3}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="profile">Welcome ${sessionScope.acc.acc_name}</a></li>
                        </c:if>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="shop?typePage=all&&page=1&&cond=0">Shop</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="ListOfPostPaginaged">Post</a></li>
                </ul>

                <a href="carts">
                    <button class="btn btn-outline-light" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.cartSize}</span>
                    </button>
                </a>
                <a href="${sessionScope.log}"><button class="btn btn-outline-primary ms-lg-2">${sessionScope.value_log}</button></a>

            </div>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container">
            <div class="masthead-subheading">Welcome ${sessionScope.acc.acc_name} To Tùy Store!</div>
            <div class="masthead-heading text-uppercase">Giày gì cũng bán</div>
        </div>
    </header>
    
        <!-- Team-->
        <section class="page-section " id="team" style="background-color: #181A1B">
            <div class="container">
                <div class="text-center text-white">
                    <h3 class="section-subheading text-muted">Trùm đường dây buôn bán giày fake.</h3>
                </div>
                <div class="row text-white" >
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="..." />
                            <h4>Parveen Anand</h4>
                            <p class="text-muted">Lead Designer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="..." />
                            <h4>Diana Petersen</h4>
                            <p class="text-muted">Lead Marketer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="..." />
                            <h4>Larry Parker</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="..." />
                            <h4>Larry Parker</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="..." />
                            <h4>Larry Parker</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer-->
        <jsp:include page ="footer.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>

