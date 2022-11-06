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

  <script src="plugins/nprogress/nprogress.js"></script>
</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light" id="body">
  <script>
    NProgress.configure({ showSpinner: false });
    NProgress.start();
  </script>

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
    <jsp:include page ="staff_header.jsp"></jsp:include>

      <!-- ====================================
          ??? CONTENT WRAPPER
          ===================================== -->
      <div class="content-wrapper">
        <div class="content">

          <!-- Top Statistics -->
          <div class="row">
              <h3 class="text-center">Staff Management </h3>
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

        <script src='plugins/daterangepicker/moment.min.js'></script>
        <script src='plugins/daterangepicker/daterangepicker.js'></script>
        <script src='js/date-range.js'></script>
        <script src='plugins/toastr/toastr.min.js'></script>

        <script src="js/sleek.js"></script>
        <link href="options/optionswitch.css" rel="stylesheet">
        <script src="options/optionswitcher.js"></script>
</body>

</html>