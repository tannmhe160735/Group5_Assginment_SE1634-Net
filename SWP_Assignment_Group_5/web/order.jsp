<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:include page="staff_sidebar.jsp"></jsp:include>


                <!-- ====================================
                    ??? PAGE WRAPPER
                    ===================================== -->
                <div class="page-wrapper">

                    <!-- Header -->
                <jsp:include page="staff_header.jsp"></jsp:include>

                    <!-- ====================================
                        ??? CONTENT WRAPPER
                        ===================================== -->
                <c:forEach items="${listOrder}" var="listO">
                    <div class="content-wrapper" style="padding:30px">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-11">
                                <div class="card card-registration card-registration-2">
                                    <div class="card-body p-0 ">
                                        <div class="row g-0">
                                            <div class="col-lg-8 border-right">
                                                <div class="p-5">
                                                    <h3 class="fw-bold text-black">Order ID: ${listO.ord_id}</h3>
                                                    <p class="fw-normal text-black">Order Date: ${listO.date_created}</p>


                                                    <hr class="my-4"/>
                                                    
                                                    <c:forEach items="${listO.listOrders}" var="c">

                                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                                <img src="${c.product.img}" class="img-fluid rounded-3" alt="">
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                <h6 class="text-black mb-0">${c.product.title}</h6>
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                <h6 class="text-black mb-0">Size: ${c.size}</h6>
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                <h6 class="text-black mb-0">$${c.product.price} x ${c.quantity} </h6>
                                                            </div>
                                                        </div>
                                                        <hr class="my-4"/>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 bg-grey">
                                                <div class="p-3">
                                                    <h3 class="fw-bold mt-6">Summary</h3>
                                                    <hr class="my-4">
                                                    <p class="">User Name: ${listO.acc.acc_name}</p>
                                                    <hr class="my-2"/>
                                                    <p class="">Address: ${listO.address}</p>
                                                    <hr class="my-2"/>
                                                    <p class="">Phone: 0${listO.phone}</p>
                                                    <hr class="my-2"/>
                                                    <p class="">Email: ${listO.email}</p>
                                                    <hr class="my-2"/>
                                                     <p class="">Total Price: ${listO.total_price}</p>
                                                    <hr class="my-2"/>
                                                    <p class="">Payment Method: ${listO.payment}</p>
                                                    <hr class="my-2"/>
                                                    <c:if test="${listO.status==1}">
                                                        <p>Status : Pending</p>
                                                        <hr class="my-2"/>
                                                    </c:if>
                                                    <c:if test="${listO.status==2}">
                                                        <p>Status : Accepted</p>
                                                        <hr class="my-2"/>
                                                    </c:if>
                                                    <c:if test="${listO.status==3}">
                                                        <p>Status : Denied</p>
                                                        <hr class="my-2"/>
                                                    </c:if>
                                                        
                                                    <a href="changeStatus?action=accept&&order_id=${listO.ord_id}" class="btn btn col-5" style="background-color: #8a909d;color:white">Accept</a>
                                                    <a href="changeStatus?action=deny&&order_id=${listO.ord_id}" class="btn btn col-5" style="background-color: #8a909d;color:white">Deny</a>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>



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

        <script src='plugins/daterangepicker/moment.min.js'></script>
        <script src='plugins/daterangepicker/daterangepicker.js'></script>
        <script src='js/date-range.js'></script>
        <script src='plugins/toastr/toastr.min.js'></script>

        <script src="js/sleek.js"></script>
        <link href="options/optionswitch.css" rel="stylesheet">
        <script src="options/optionswitcher.js"></script>



    </body>

</html>
