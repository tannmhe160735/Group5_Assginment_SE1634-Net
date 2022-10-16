<%-- 
    Document   : shop
    Created on : Oct 1, 2022, 11:59:29 AM
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
            <!-- Navigation-->

            <!-- Section-->
            <section on class="py-5" style="background-color: #181A1B">
                <div class="container px-4 px-lg-5 my-5 text-light">
                    <div class="row">
                        <div class="col-md-3 mb-5 ">
                            <h3>Danh Mục</h3>
                            <ul class="list-group">
                            <c:forEach items="${listCategories}" var="c">
                                <li class="list-group-item"><a href="filter-category?categoryId=${c.cate_id}">${c.cate_name}</a></li>
                                </c:forEach>
                            <a href="#"><li class="list-group-item">${c.cate_name}</li></a>
                            <style>
                                .list-group-item:hover{
                                    background-color: gray;
                                }
                            </style>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>Sản Phẩm</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center text-dark">
                            <c:forEach  items="${listProducts}" var="p">
                                <div class="col mb-5 ">
                                    <div class="card h-100">
                                        <div class="card-body p-4">
                                            <img class="card-img-top" src="${p.img}" alt="..." />
                                        </div>
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img class="card-img-top" src="${P.imageUrl}" alt="..." />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${p.title}</h5>
                                                <!-- Product price-->
                                            </div>
                                        </div>
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <span class="text"> $${p.price}</span>
                                            </div>                                         
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail">View options</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>

</html>
