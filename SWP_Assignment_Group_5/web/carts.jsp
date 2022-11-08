<%-- 
    Document   : cart
    Created on : Oct 1, 2022, 12:02:34 PM
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
        <title>Cart</title>
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

            <section class="h-100 h-custom" style="background-color: #181A1B">
                <div class="container py h-50">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12">
                            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                                <div class="card-body p-0 ">
                                    <div class="row g-0">
                                        
                                        <div class="col-lg-8">
                                            <c:choose>
                                                    <c:when test="${sessionScope.cartSize ==0 || sessionScope.cartSize == null}">
                                                        <h2 style="margin: 50px">Your cart is Empty.<a href="shop?typePage=all&&page=1&&cond=0"> Let's shopping!</a></h2>
                                                </c:when>
                                                <c:otherwise>
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-center mb-5">
                                                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1></div>
                                                
                                                    <hr class="my-4">
                                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <h6 class="text-black mb-0">Image</h6>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                                            <h6 class="text-black mb-0">Title</h6>
                                                        </div>

                                                        <div class="col-md-1 col-lg-1 col-xl-1">
                                                            <h6 class="text-black mb-0">Size</h6>
                                                        </div>

                                                        <div class="col-md-2 col-lg-2 col-xl-2 d-flex quantity">
                                                            <h6 class="text-black mb-0">Quantity</h6>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 col-xl-2 offset-lg-1">
                                                            <h6 class="text-black mb-0">Price</h6>
                                                        </div>
                                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">

                                                        </div>
                                                    </div>
                                                    <c:forEach items="${carts}" var="c">

                                                        <form action="update-quantity">

                                                            <hr class="my-4">

                                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                                    <img src="${c.product.img}" class="img-fluid rounded-3" alt="">
                                                                </div>
                                                                <div class="col-md-3 col-lg-3 col-xl-3">
                                                                    <h6 class="text-black mb-0">${c.product.title}</h6>
                                                                </div>

                                                                <div class="col-md-1 col-lg-1 col-xl-1">
                                                                    <h6 class="text-black mb-0">${c.size}</h6>
                                                                </div>

                                                                <input type="hidden" name="productId" value="${c.product.product_id}">
                                                                <input type="hidden" name="size" value="${c.size}">
                                                                <div class="col-md-2 col-lg-2 col-xl-2 d-flex quantity">
                                                                    <input onchange="this.form.submit()" type="number" min="1" name="quantity" value="${c.quantity}"
                                                                           class="form-control form-control-sm disabled" />
                                                                </div>
                                                                <div class="col-md-2 col-lg-2 col-xl-2 offset-lg-1">
                                                                    <h6 class="mb-0">$${c.product.price*c.quantity}</h6>
                                                                </div>
                                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                                    <a href="delete-cart?productId=${c.product.product_id}&&size=${c.size}"><i class="fas fa-times"></i></a>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </c:forEach>                                             
                                                    <hr class="my-4">
                                                    <div class="pt-5">
                                                        <h6 class="mb-0">
                                                            <a href="shop?typePage=category&&cond=1&&page=1" class="text-body">
                                                                <i class="fas fa-long-arrow-alt-left me-2"></i>
                                                                Back to shop
                                                            </a>
                                                        </h6>
                                                    </div>                                          
                                                </div>
                                            </div>
                                            <div class="col-lg-4 bg-grey">
                                                <div class="p-5">
                                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                                    <hr class="my-4">

                                                    <div class="d-flex justify-content-between mb-4">
                                                        <h5 class="text-uppercase">Price: </h5>
                                                        <h5>$${totalMoney}</h5>
                                                    </div>

                                                    <h5 class="text-uppercase mb-3">Give code</h5>

                                                    <div class="mb-5">
                                                        <form action="carts" class="form-outline">
                                                            <input type="text" id="voucher_code" name="voucher_code"class="form-control form-control-lg" value="${voucher}" />
                                                            <input style="margin-top: 10px" type="submit" class="form-label" for="form3Examplea2" value="Apply"></input></br>
                                                            <label class="btn-outline-danger">${voucher_msg}</label>
                                                        </form>
                                                    </div>
                                                    <hr class="my-4">
                                                    <div class="d-flex justify-content-between mb-5">
                                                        <h5 class="text-uppercase">Total price</h5>
                                                        <h5>$${paymentMoney}</h5>
                                                    </div>
                                                    <a href="checkout?voucher=${voucher}&totalPrice=${totalMoney}" class="btn btn-dark btn-block btn-lg"
                                                       data-mdb-ripple-color="dark">Confirm</a>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</html>
