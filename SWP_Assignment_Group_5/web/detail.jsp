<%-- 
    Document   : detail
    Created on : Oct 1, 2022, 12:01:06 PM
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
    <jsp:include page="header.jsp"></jsp:include>
        <body id="page-top">
            <!-- Product section-->
            <section class="py text-white" style="background-color: #181A1B">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"
                                                   src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                        <div class="col-md-6">
                            <div class="small mb-1">SKU: BST-498</div>
                            <h1 class="display-5 fw-bolder">Shop item</h1>
                            <div class="fs-5 mb-5">
                                <span class="text-decoration-line-through">$45.00</span>
                                <span>${product.price}</span>
                        </div>
                        <p class="lead">${product.description}</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1"
                                   style="max-width: 3rem" />
                            <button class="btn btn-outline-light flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-dark">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4 text-white">Các Sản phẩm khác</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${listRelatedProducts}" var="RP">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                <!-- Product image-->
                                <img class="card-img-top" src="${RP.img}" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${RP.title}</h5>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <span class="text-muted text-decoration-line-through">$20.00</span>
                                        $${RP.price}
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail?productId=${RP.product_id}">Detail</a></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </section>

        <!-- Comment-->
        <section style="background-color: #181A1B;">
            <div class="container my-5 py-5 text-dark">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-12 col-lg-10 col-xl-8">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="text-white mb-0">Unread comments (4)</h4>
                            <div class="card">
                                <div class="card-body p-2 d-flex align-items-center">
                                    <h6 class="text-primary fw-bold small mb-0 me-1">Comments "ON"</h6>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked />
                                        <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex flex-start">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp" alt="avatar" width="40"
                                         height="40" />
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h6 class="text-primary fw-bold mb-0">
                                                lara_stewart
                                                <span class="text-dark ms-2">Hmm, This poster looks cool</span>
                                            </h6>
                                            <p class="mb-0">2 days ago</p>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="small mb-0" style="color: #aaa;">
                                                <a href="#!" class="link-grey">Remove</a> •
                                                <a href="#!" class="link-grey">Reply</a> •
                                                <a href="#!" class="link-grey">Translate</a>
                                            </p>
                                            <div class="d-flex flex-row">
                                                <i class="fas fa-star text-warning me-2"></i>
                                                <i class="far fa-check-circle" style="color: #aaa;"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex flex-start">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp" alt="avatar" width="40"
                                         height="40" />
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h6 class="text-primary fw-bold mb-0">
                                                the_sylvester_cat
                                                <span class="text-dark ms-2">Loving your work and profile! </span>
                                            </h6>
                                            <p class="mb-0">3 days ago</p>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="small mb-0" style="color: #aaa;">
                                                <a href="#!" class="link-grey">Remove</a> •
                                                <a href="#!" class="link-grey">Reply</a> •
                                                <a href="#!" class="link-grey">Translate</a>
                                            </p>
                                            <div class="d-flex flex-row">
                                                <i class="far fa-check-circle text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex flex-start">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(20).webp" alt="avatar" width="40"
                                         height="40" />
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h6 class="text-primary fw-bold mb-0">
                                                mindyy_def
                                                <span class="text-dark ms-2">Really cool Which filter are you using?
                                                </span>
                                            </h6>
                                            <p class="mb-0">3 days ago</p>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="small mb-0" style="color: #aaa;">
                                                <a href="#!" class="link-grey">Remove</a> •
                                                <a href="#!" class="link-grey">Reply</a> •
                                                <a href="#!" class="link-grey">Translate</a>
                                            </p>
                                            <div class="d-flex flex-row">
                                                <i class="fas fa-user-plus" style="color: #aaa;"></i>
                                                <i class="far fa-star mx-2" style="color: #aaa;"></i>
                                                <i class="far fa-check-circle text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex flex-start">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(14).webp" alt="avatar" width="40"
                                         height="40" />
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h6 class="text-primary fw-bold mb-0">
                                                t_anya
                                                <span class="text-dark ms-2"><span class="text-primary">@macky_lones</span>
                                                    <span class="text-primary">@rashida_jones</span> Thanks
                                                </span>
                                            </h6>
                                            <p class="mb-0">4 days ago</p>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="small mb-0" style="color: #aaa;">
                                                <a href="#!" class="link-grey">Remove</a> •
                                                <a href="#!" class="link-grey">Reply</a> •
                                                <a href="#!" class="link-grey">Translate</a>
                                            </p>
                                            <div class="d-flex flex-row">
                                                <i class="far fa-check-circle text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
