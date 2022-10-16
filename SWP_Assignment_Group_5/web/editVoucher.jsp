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
                <div>
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Product</h4>
                                <a href="listVoucher"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                            </div>
                            <form action="editProduct?code=${requestScope.voucher.voucher_code}" method="post">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Voucher Code</label>
                                        <input name="new_code" type="text" class="form-control" required value="${requestScope.voucher.voucher_code}" >
                                    </div>
                                    <div class="form-group">
                                        <label>Experience Date - ${requestScope.voucher.voucher_experience}</label>
                                        <input name="date" type="date" class="form-control" required >
                                    </div>
                                    <div class="form-group">
                                        <label>Discount(%)</label>
                                        <input name="discount" type="text" class="form-control" required value="${requestScope.voucher.voucher_discount}">
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <a href="listVoucher"><button type="button" class="btn btn-close" data-dismiss="modal" aria-hidden="true">Cancel</button></a>
                                    <input type="submit" class="btn btn-success" value="Save">
                                </div>
                            </form>
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
