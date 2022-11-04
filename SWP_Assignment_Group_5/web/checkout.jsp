<%-- 
    Document   : checkout
    Created on : Nov 1, 2022, 11:11:11 PM
    Author     : Asus
--%>

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

                                                <form class="needs-validation" novalidate="">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-3">
                                                            <label for="firstName">First name</label>
                                                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <label for="lastName">Last name</label>
                                                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">                            </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="email">Email</label>
                                                        <input type="email" class="form-control" id="email" placeholder="you@example.com">
                                                        <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="address">Address</label>
                                                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                                                        <div class="invalid-feedback"> Please enter your shipping address. </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-5 mb-3">
                                                            <label for="country">Country</label>
                                                            <select class="custom-select d-block w-100" id="country" required="">
                                                                <option value="">Choose...</option>
                                                                <option>United States</option>
                                                            </select>
                                                            <div class="invalid-feedback"> Please select a valid country. </div>
                                                        </div>
                                                        <div class="col-md-4 mb-3">
                                                            <label for="state">State</label>
                                                            <select class="custom-select d-block w-100" id="state" required="">
                                                                <option value="">Choose...</option>
                                                                <option>California</option>
                                                            </select>
                                                            <div class="invalid-feedback"> Please provide a valid state. </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="zip">Zip</label>
                                                            <input type="text" class="form-control" id="zip" placeholder="" required="">
                                                            <div class="invalid-feedback"> Zip code required. </div>
                                                        </div>
                                                    </div>
                                                    <hr class="mb-4">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="same-address">
                                                        <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="save-info">
                                                        <label class="custom-control-label" for="save-info">Save this information for next time</label>
                                                    </div>
                                                    <hr class="mb-4">
                                                    <h4 class="mb-3">Payment</h4>
                                                    <div class="d-block my-3">
                                                        <div class="custom-control custom-radio">    
                                                            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                                            <label class="custom-control-label" for="debit">Ship Cod</label>
                                                        </div>
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
                                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                        <div>
                                                            <h6 class="my-0">Product name</h6>
                                                            <small class="text-muted">Brief description</small>
                                                        </div>
                                                        <span class="text-muted">$12</span>
                                                    </li>
                                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                        <div>
                                                            <h6 class="my-0">Second product</h6>
                                                            <small class="text-muted">Brief description</small>
                                                        </div>
                                                        <span class="text-muted">$8</span>
                                                    </li>
                                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                        <div>
                                                            <h6 class="my-0">Third item</h6>
                                                            <small class="text-muted">Brief description</small>
                                                        </div>
                                                        <span class="text-muted">$5</span>
                                                    </li>
                                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                                        <div class="text-success">
                                                            <h6 class="my-0">Promo code</h6>
                                                            <small>EXAMPLECODE</small>
                                                        </div>
                                                        <span class="text-success">-$5</span>
                                                    </li>

                                                </ul>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="text-uppercase">items 3</h5>
                                                    <h5>€ 132.00</h5>
                                                </div>

                                                <h5 class="text-uppercase mb-3">Shipping</h5>

                                                <div class="mb-4 pb-2">
                                                    <select class="select">
                                                        <option value="1">€5.00</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select>
                                                </div>

                                                <h5 class="text-uppercase mb-3">Give code</h5>

                                                <div class="mb-5">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
                                                        <label class="form-label" for="form3Examplea2">Enter your code</label>
                                                    </div>
                                                </div>

                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-5">
                                                    <h5 class="text-uppercase">Total price</h5>
                                                    <h5>€ 137.00</h5>
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
