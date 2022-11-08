<%-- 
    Document   : checkout
    Created on : Nov 7, 2022, 8:45:11 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="h-100 h-custom"style="background-color: #181A1B;">
                <div class="container py h-50">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12">
                            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                                <div class="card-body p-0 ">
                                    <div class="row g-0">
                                        <div class="col-lg-8">
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-center mb-5">
                                                    <h1 class="fw-bold mb-0 text-black">Billing address</h1>
                                                </div>
                                                <hr class="my-4">

                                                <form action="checkout" method="post" class="needs-validation" novalidate="">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-3">
                                                            <label for="firstName">First name</label>
                                                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="" required="">
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <label for="lastName">Last name</label>
                                                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="" required="">                            </div>
                                                    </div>
                                                    <div class="mb-3">
                                                            <label for="phone">Phone</label>
                                                            <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="" required="">
                                                        </div>
                                                    
                                                    <div class="mb-3">
                                                        <label for="address">Address</label>
                                                        <input type="text" class="form-control" id="address" name="address" required="">
                                                        <div class="invalid-feedback"> Please enter your shipping address. </div>
                                                    </div>

                                                    <hr class="mb-4">
                                                    <h4 class="col-md-6 mb-3">Payment</h4>
                                                    <div class="d-block my-3">
                                                        <div class="custom-control custom-radio">    
                                                            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                                            <label class="custom-control-label" for="debit">Ship Cod</label>
                                                        </div>
                                                    </div>
                                                    <h4 class="col-md-6 mb-3">Shipping</h4>

                                                    <div class="d-block my-3">
                                                        <select class="select">
                                                            <option value="1">Nhanh: </option>
                                                            <option value="2">Sieu nhanh</option>
                                                            <option value="3">Nhanh vl</option>
                                                        </select>
                                                    </div>
                                                </form>

                                                <hr class="my-4">

                                                <div class="pt-5">
                                                    <h6 class="mb-0"><a href="category.html" class="text-body"><i
                                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 bg-grey">
                                            <div class="p-5">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1">Your Cart</h3>
                                                <hr class="my-4">
                                                <ul class="list-group mb-3 sticky-top">
                                                <c:forEach items="${carts}" var="c">
                                                    <li class="list-group-item d-flex justify-content-between">
                                                        <div>
                                                            <h6 class="my-0">${c.value.product.title}</h6>
                                                            <small class="text-muted">Quantity: ${c.value.quantity}</small>
                                                        </div>
                                                        <span class="text-muted">$${c.value.product.price*c.value.quantity}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Price: </h5>
                                                <h5>$${totalMoney}</h5>
                                            </div>

                                            <hr class="my-4">
                                            <h5 class="text-uppercase mb-3">Give code</h5>

                                            <div class="mb-5">
                                                <form action="checkout" class="form-outline">
                                                    <input type="text" id="voucher_code" name="voucher_code"class="form-control form-control-lg" />
                                                    <input style="margin-top: 10px" type="submit" class="form-label" for="form3Examplea2" value="Apply"></input></br>
                                                    <label>${voucher_msg}</label>
                                                </form>
                                            </div>

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase btn-outline-danger">Total price</h5>
                                                <h5 class="text-uppercase btn-outline-danger">$${paymentMoney}</h5>
                                            </div>

                                            <button type="button" class="btn btn-dark btn-block btn-lg"
                                                    data-mdb-ripple-color="dark">Confirm</button>
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

