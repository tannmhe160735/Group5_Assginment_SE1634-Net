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
            <div class="col-xl-3 col-sm-6">
              <div class="card card-mini mb-4">
                <div class="card-body">
                  <h2 class="mb-1">71,503</h2>
                  <p>Online Signups</p>
                  <div class="chartjs-wrapper">
                    <canvas id="barChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6">
              <div class="card card-mini  mb-4">
                <div class="card-body">
                  <h2 class="mb-1">9,503</h2>
                  <p>New Visitors Today</p>
                  <div class="chartjs-wrapper">
                    <canvas id="dual-line"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6">
              <div class="card card-mini mb-4">
                <div class="card-body">
                  <h2 class="mb-1">71,503</h2>
                  <p>Monthly Total Order</p>
                  <div class="chartjs-wrapper">
                    <canvas id="area-chart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6">
              <div class="card card-mini mb-4">
                <div class="card-body">
                  <h2 class="mb-1">9,503</h2>
                  <p>Total Revenue This Year</p>
                  <div class="chartjs-wrapper">
                    <canvas id="line"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="content">
          <!-- Sales Graph -->
          <div class="card card-default">
            <div class="card-header">
              <h2>Sales Of The Year</h2>
              <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
              </button>
            </div>
            <div class="card-body">
              <canvas id="linechart" class="chartjs"></canvas>
            </div>
            <div class="card-footer d-flex flex-wrap bg-white p-0">
              <div class="col-6 px-0">
                <div class="text-center p-4">
                  <h4>$6,308</h4>
                  <p class="mt-2">Total orders of this year</p>
                </div>
              </div>
              <div class="col-6 px-0">
                <div class="text-center p-4 border-left">
                  <h4>$70,506</h4>
                  <p class="mt-2">Total revenue of this year</p>
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

        <script src='plugins/daterangepicker/moment.min.js'></script>
        <script src='plugins/daterangepicker/daterangepicker.js'></script>
        <script src='js/date-range.js'></script>
        <script src='plugins/toastr/toastr.min.js'></script>

        <script src="js/sleek.js"></script>
        <link href="options/optionswitch.css" rel="stylesheet">
        <script src="options/optionswitcher.js"></script>
</body>

</html>