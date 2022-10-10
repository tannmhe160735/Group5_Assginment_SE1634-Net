<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description"
              content="Sleek Dashboard - Free Bootstrap 4 Admin Dashboard Template and UI Kit. It is very powerful bootstrap admin dashboard, which allows you to build products like admin panels, content management systems and CRMs etc.">

        <title>Dashboard Tùy Store</title>

        <!-- GOOGLE FONTS -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
              rel="stylesheet" />

        <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

        <!-- PLUGINS CSS STYLE -->
        <link href="plugins/simplebar/simplebar.css" rel="stylesheet" />
        <link href="plugins/nprogress/nprogress.css" rel="stylesheet" />

        <!-- No Extra plugin used -->
        <link href='plugins/jvectormap/jquery-jvectormap-2.0.3.css' rel='stylesheet'>
        <link href='plugins/daterangepicker/daterangepicker.css' rel='stylesheet'>


        <link href='plugins/toastr/toastr.min.css' rel='stylesheet'>

        <!-- SLEEK CSS -->
        <link id="sleek-css" rel="stylesheet" href="css/sleek.css" />
        <!-- FAVICON -->
        <link href="img/favicon.png" rel="shortcut icon" />



        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--
            HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
        -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <script src="plugins/nprogress/nprogress.js"></script>
    </head>

    <body class="header-fixed sidebar-fixed sidebar-dark header-light" id="body">
        <script>
            NProgress.configure({showSpinner: false});
            NProgress.start();
        </script>

        <!-- ====================================
          ??? WRAPPER
          ===================================== -->
        <div class="wrapper">

            <!-- ====================================
                  ??? LEFT SIDEBAR WITH OUT FOOTER
                ===================================== -->
            <jsp:include page="admin_sidebar.jsp"></jsp:include>


                <!-- ====================================
                    ??? PAGE WRAPPER
                    ===================================== -->
                <div class="page-wrapper">

                    <!-- Header -->
                <jsp:include page="admin_header.jsp"></jsp:include>

                    <!-- ====================================
                        ??? CONTENT WRAPPER
                        ===================================== -->
                    <div class="content-wrapper">
                        <div class="content">
                            <!--          <div class="card card-default">
                                        <div class="card-header">
                                          <a href="addProduct.html" class="btn btn-success"><span>Add New <b>Product</b></span></a>
                                        </div>
                                        <div>-->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Role_ID</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.accounts}" var="a">
                                    <tr>
                                        <td></td>
                                        <td>${a.acc_id}</td>
                                        <td>${a.acc_name}</td>
                                        <td>${a.email}</td>
                                        <c:if test="${a.gender eq true}">
                                            <td>Male</td>
                                        </c:if>
                                        <c:if test="${a.gender ne true}">
                                            <td>Female</td>
                                        </c:if>
                                        <td>${a.phone}</td>
                                        <td>${a.address}</td>
                                        <c:if test="${a.role_id eq 1}">
                                            <td>Admin</td>
                                        </c:if>
                                        <c:if test="${a.role_id eq 2}">
                                            <td>Staff</td>
                                        </c:if>
                                        <c:if test="${a.role_id eq 3}">
                                            <td>Customer</td>
                                        </c:if>
                                        <td>
                                            <a href="action?action=edit&id=${a.acc_id}"><i class="material-icons"
                                                                                           data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        </td>
                                        <td>
                                            <a href="action?action=delete&id=${a.acc_id}"><i class="material-icons"
                                                                                             data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Javascript -->
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/simplebar/simplebar.min.js"></script>

<script src='plugins/charts/Chart.min.js'></script>
<script src='js/chart.js'></script>

<script src='plugins/jvectormap/jquery-jvectormap-2.0.3.min.js'></script>
<script src='plugins/jvectormap/jquery-jvectormap-world-mill.js'></script>
<script src='js/vector-map.js'></script>

<script src='assets/plugins/daterangepicker/moment.min.js'></script>
<script src='plugins/daterangepicker/daterangepicker.js'></script>
<script src='js/date-range.js'></script>
<script src='plugins/toastr/toastr.min.js'></script>

<script src="js/sleek.js"></script>
<link href="options/optionswitch.css" rel="stylesheet">
<script src="options/optionswitcher.js"></script>



</body>

</html>
