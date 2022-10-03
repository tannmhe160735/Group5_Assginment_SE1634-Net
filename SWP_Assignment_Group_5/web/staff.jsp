<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description"
    content="Sleek Dashboard - Free Bootstrap 4 Admin Dashboard Template and UI Kit. It is very powerful bootstrap admin dashboard, which allows you to build products like admin panels, content management systems and CRMs etc.">

  <title>Dashboard T�y Store</title>

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
  <link id="sleek-css" rel="stylesheet" href="assets/css/sleek.css" />

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
    <aside class="left-sidebar ">
      <div id="sidebar" class="sidebar sidebar-with-footer">
        <!-- Aplication Brand -->
        <div class="app-brand" style="background-color: #012738">
          <a href="admin.html" title="Sleek Dashboard">
            <svg class="brand-icon" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid" width="30"
              height="33" viewBox="0 0 30 33">
              <g fill="none" fill-rule="evenodd">
                <path class="logo-fill-blue" fill="#7DBCFF" d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
                <path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z" />
              </g>
            </svg>
            <span class="brand-name text-truncate">T�y Store</span>
          </a>
        </div>
        <!-- begin sidebar scrollbar -->
        <div class="" data-simplebar style="height: 100%;">
          <!-- sidebar menu -->
          <ul class="nav sidebar-inner" id="sidebar-menu">
            <li class="has-sub ">
              <a href="admin.html">
                <i class="mdi mdi-view-dashboard-outline"></i>
                <span class="nav-text">Dashboard</span>
              </a>
            </li>

            <li class="has-sub ">
              <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#app"
                aria-expanded="false" aria-controls="app">
                <i class="mdi mdi-pencil-box-multiple"></i>
                <span class="nav-text">Manage</span> <b class="caret"></b>
              </a>

              <ul class="collapse " id="app" data-parent="#sidebar-menu">
                <div class="sub-menu">
                  <li class="">
                    <a class="sidenav-item-link" href="option.html">
                      <span class="nav-text">Option</span>
                    </a>
                    <a class="sidenav-item-link" href="#">
                      <span class="nav-text">Option</span>
                    </a>
                    <a class="sidenav-item-link" href="#">
                      <span class="nav-text">Option</span>
                    </a>
                    <a class="sidenav-item-link" href="#">
                      <span class="nav-text">Option</span>
                    </a>
                  </li>
                </div>
              </ul>
            </li>
          </ul>
        </div>

    </aside>


    <!-- ====================================
        ??? PAGE WRAPPER
        ===================================== -->
    <div class="page-wrapper">

      <!-- Header -->
      <header class="main-header " id="header">
        <nav class="navbar navbar-static-top navbar-expand-lg">
          <!-- Sidebar toggle button -->
          <button id="sidebar-toggler" class="sidebar-toggle">
            <span class="sr-only">Toggle navigation</span>
          </button>
          <!-- search form -->
          <div class="search-form d-none d-lg-inline-block">
            <div class="input-group">
              <button type="button" name="search" id="search-btn" class="btn btn-flat">
                <i class="mdi mdi-magnify"></i>
              </button>
              <input type="text" name="query" id="search-input" class="form-control"
                placeholder="'button', 'chart' etc." autofocus autocomplete="off" />
            </div>
            <div id="search-results-container">
              <ul id="search-results"></ul>
            </div>
          </div>

          <div class="navbar-right ">
            <ul class="nav navbar-nav">

              <!-- User Account -->
              <li class="dropdown user-menu">
                <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <img src="assets/img/user/user.png" class="user-image" alt="User Image" />
                  <span class="d-none d-lg-inline-block">Abdus Salam</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <!-- User image -->
                  <li class="dropdown-header">
                    <img src="assets/img/user/user.png" class="img-circle" alt="User Image" />
                    <div class="d-inline-block">
                      Abdus Salam <small class="pt-1">iamabdus@gmail.com</small>
                    </div>
                  </li>

                  <li>
                    <a href="user-profile.html">
                      <i class="mdi mdi-account"></i> My Profile
                    </a>
                  </li>
                  <li class="right-sidebar-in">
                    <a href="javascript:0"> <i class="mdi mdi-settings"></i> Setting </a>
                  </li>
                  <li class="dropdown-footer">
                    <a href="admin.html"> <i class="mdi mdi-logout"></i> Log Out </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>


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