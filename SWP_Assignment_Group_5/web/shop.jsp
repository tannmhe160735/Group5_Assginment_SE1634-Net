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
                                <style>
                                    .list-group-item:hover{
                                        color:white;
                                        background-color: grey;
                                    }
                                    .active-cate{
                                        color:white;
                                        background-color: grey;
                                    }
                                </style>
                            <c:forEach items="${listCategories}" var="c">

                                <a href="shop?typePage=category&&cond=${c.cate_id}&&page=1">
                                    <li class="list-group-item ${cond==c.cate_id? "active-cate":""}">${c.cate_name}</li>
                                </a>
                            </c:forEach>

                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>Sản Phẩm</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center text-dark">
                            <c:forEach  items="${listProducts}" var="p">
                                <div class="col mb-5 ">
                                     
                                    <div class="card h-100">
                                       
                                    
                                             <a href="detail?productId=${p.product_id}">
                                                <img class="card-img" src="${p.img}" alt="..." />
                                            </a>
                                       
                                           
                                        <!-- Product image-->
                                        
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${p.title}</h5>
                                                <!-- Product price-->
                                                $${p.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->

                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${p.product_id}">
                                                    Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <c:set var="totalPage" value="${requestScope.totalPage}"/>
                        <c:if test="${totalPage!=1}">
                            <nav aria-label="Page navigation example">
                                <style>
                                    .page-link{
                                        color: white;
                                    }
                                    .page-item{
                                        margin: 20px;
                                    }
                                    .disabled {
                                        pointer-events: none;
                                        cursor: default;
                                        color:graytext;
                                    }

                                    .active{
                                        color:#FFC800;
                                    }

                                </style>

                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="page-link ${requestScope.condPrev}" href="shop?typePage=${requestScope.typePage}&&cond=${requestScope.cond}&&page=${requestScope.page-1}" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${requestScope.totalPage}" var="page">
                                        <li class="page-item">
                                            <a class="page-link ${page==requestScope.page? "active":""}" href="shop?typePage=${requestScope.typePage}&&cond=${requestScope.cond}&&page=${page}">${page}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link ${requestScope.condNext}" href="shop?typePage=${requestScope.typePage}&&cond=${requestScope.cond}&&page=${requestScope.page+1}">Next</a>
                                    </li>
                                </ul>

                            </nav>
                        </c:if>

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
