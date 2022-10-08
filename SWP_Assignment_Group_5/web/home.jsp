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
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="home.jsp">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="shop">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>

                <a href="cart.jsp">
                    <button class="btn btn-outline-light" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </a>
                <a href="${sessionScope.log}"><button class="btn btn-outline-primary ms-lg-2">${sessionScope.value_log}  </button></a>

            </div>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container">
            <div class="masthead-subheading">Welcome To Tùy Store!</div>
            <h4 class="masthead-subheading">${sessionScope.acc.acc_name}</h4>
            <div class="masthead-heading text-uppercase">Giày gì cũng bán</div>
            <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
        </div>
    </header>
    <body id="page-top">
        <section class="page-section bg-dark" id="portfolio">
            <div class="container">
                <div class="text-center text-white">
                    <h2 class="section-heading text-uppercase">Sản Phẩm</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <div class="row">

                    <!-- Portfolio item 1-->
                    <c:forEach begin="1" end="6">
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                    </div>
                                    <img class="img-fluid" src="img/portfolio/1.jpg" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">Threads</div>
                                    <div class="portfolio-caption-subheading text-muted">Illustration</div>
                                </div>
                            </div>
                        </div>
                        <!-- Portfolio Modals-->
                        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="close-modal" data-bs-dismiss="modal"><img src="img/close-icon.svg" alt="Close modal" /></div>
                                    <div class="container">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-8">
                                                <div class="modal-body">
                                                    <!-- Project details-->
                                                    <h2 class="text-uppercase">Project Name</h2>
                                                    <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                                    <img class="img-fluid d-block mx-auto" src="img/portfolio/1.jpg" alt="..." />
                                                    <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <strong>Client:</strong>
                                                            Threads
                                                        </li>
                                                        <li>
                                                            <strong>Category:</strong>
                                                            Illustration
                                                        </li>
                                                    </ul>
                                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                                        Art to Cart
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>

                    </section>
                    <!-- Team-->
                    <section class="page-section " id="team" style="background-color: #181A1B">
                        <div class="container">
                            <div class="text-center text-white">
                                <h2 class="section-heading text-uppercase">Amazing Team</h2>
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

