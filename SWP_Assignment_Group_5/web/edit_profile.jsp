<%-- 
    Document   : profile
    Created on : Oct 1, 2022, 12:05:28 PM
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

            <section style="background-color: #181A1B;">
                <div class="container py-5">
                    <!-- comment -->
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4 bg-dark">
                                <div class="card-body text-center">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <br>
                                    <br>
                                    <div class="d-flex justify-content-center mb-2">
                                        <input type="file" id="img" class="btn btn-primary" name="img" accept="image/*">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4 bg-dark text-white">
                                <div class="card-body">
                                    <form action="edit_profile" method="POST">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="acc_name" class="text-muted mb-0" value="${requestScope.acc.acc_name}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="email" class="text-muted mb-0" value="${requestScope.acc.email}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="phone" class="text-muted mb-0" value="${requestScope.acc.phone}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="address" class="text-muted mb-0" value="${requestScope.acc.address}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Gender</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <c:if test="${requestScope.acc.gender eq true}">
                                                Male <input type="radio" name="gender" checked="checked" value="true" />
                                                Female <input type="radio" name="gender" value="false" />
                                            </c:if>
                                            <c:if test="${requestScope.acc.gender ne true}">
                                                Male <input type="radio" name="gender" value="true" />
                                                Female <input type="radio" name="gender" value="false" checked="checked" />
                                            </c:if>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row" style="margin-top: 20px;">
                                        <div class="col-sm-9">
                                            <button onclick="sendback()" class="btn btn-outline-light btn-lg px-5" type="button">Back</button>
                                        </div>
                                        <div class="col-sm-3" >
                                            <button class="btn btn-outline-light btn-lg px-5" type="submit">Save</button>
                                        </div>
                                    </div>
                                </form>                 
                            </div>
                        </div>                       
                    </div>
                </div>
                                        <!-- comment -->
            </div>
        </section>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script>
        function sendback() {
            window.location.href = "profile";
        }
    </script>
</html>
