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
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4 bg-dark">
                                <div class="card-body text-center">
                                    <img src="${requestScope.acc.avatar}" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="text-muted mb-4" class="my-3">${requestScope.acc.acc_name}</h5>
                                <p class="text-muted mb-4">${requestScope.acc.address}</p>
                                <div class="d-flex justify-content-center mb-2">
                                    <button onclick="sendback()" type="button" class="btn btn-primary">Edit</button>
                                    <button onclick="sendto()" type="button" class="btn btn-outline-primary ms-1">Change Password</button>
                                </div>
                            </div>
                        </div>
                        <!--                        <div class="card mb-4 mb-lg-0 ">
                                                    <div class="card-body p-0">
                                                        <ul class="list-group list-group-flush rounded-3">
                                                            <li class="list-group-item d-flex justify-content-between align-items-center p-3 bg-dark text-white">
                                                                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                                                <p class="mb-0">instagram</p>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center p-3 bg-dark text-white">
                                                                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                                                <p class="mb-0">facebook</p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4 bg-dark text-white">
                            <div class="card-body">
                                <div class="row">
                                    <h4  style="color: green;">${requestScope.msg}</h4>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${requestScope.acc.acc_name}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${requestScope.acc.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">0${requestScope.acc.phone}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${requestScope.acc.address}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Gender</p>
                                    </div>
                                    <c:if test="${requestScope.acc.gender eq true}">
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Male</p>
                                    </div> 
                                    </c:if>
                                    <c:if test="${requestScope.acc.gender ne true}">
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Female</p>
                                    </div> 
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <!--              <div class="row">
                                        <div class="col-md-6">
                                          <div class="card mb-4 mb-md-0 bg-dark text-white">
                                            <div class="card-body">
                                              <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                              </p>
                                              <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                              <div class="progress rounded mb-2" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="col-md-6">
                                          <div class="card mb-4 mb-md-0 bg-dark text-white">
                                            <div class="card-body">
                                              <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                              </p>
                                              <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                              <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                              <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                              <div class="progress rounded mb-2" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                  aria-valuemin="0" aria-valuemax="100"></div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>-->
                    </div>
                </div>
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
                                            window.location.href = "edit_profile";
                                        }
                                        function sendto() {
                                            window.location.href = "change_pass.jsp";
                                        }
    </script>
</html>
