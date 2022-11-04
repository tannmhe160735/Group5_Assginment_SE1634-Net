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
            NProgress.configure({showSpinner: false});
            NProgress.start();
        </script>

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
                <jsp:include page ="admin_header.jsp"></jsp:include>


                <!-- ====================================
                    ??? CONTENT WRAPPER
                    ===================================== -->
<!--                <div class="content-wrapper">
                    <div class="content">

                         Top Statistics 
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
                    </div>-->


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
                                        <h4>${requestScope.count}</h4>
                                        <p class="mt-2">Total orders of this year</p>
                                    </div>
                                </div>
                                <div class="col-6 px-0">
                                    <div class="text-center p-4 border-left">
                                        <h4>$${requestScope.tong}</h4>
                                        <p class="mt-2">Total revenue of this year</p>
                                    </div>
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

                    <script src='plugins/charts/Chart.min.js'></script>
                    <script>
                  var barX = document.getElementById("barChart");
                  if (barX !== null) {
                      var myChart = new Chart(barX, {
                          type: "bar",
                          data: {
                              labels: [
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr",
                                  "May",
                                  "Jun",
                                  "Jul",
                                  "Aug",
                                  "Sep",
                                  "Oct",
                                  "Nov",
                                  "Dec"
                              ],
                              datasets: [
                                  {
                                      label: "signup",
                                      data: [5, 6, 4.5, 5.5, 3, 6, 4.5, 6, 8, 3, 5.5, 4],
                                      // data: [2, 3.2, 1.8, 2.1, 1.5, 3.5, 4, 2.3, 2.9, 4.5, 1.8, 3.4, 2.8],
                                      backgroundColor: "#4c84ff"
                                  }
                              ]
                          },
                          options: {
                              responsive: true,
                              maintainAspectRatio: false,
                              legend: {
                                  display: false
                              },
                              scales: {
                                  xAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false,
                                              display: false
                                          },
                                          ticks: {
                                              display: false, // hide main x-axis line
                                              beginAtZero: true
                                          },
                                          barPercentage: 1.8,
                                          categoryPercentage: 0.2
                                      }
                                  ],
                                  yAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false, // hide main y-axis line
                                              display: false
                                          },
                                          ticks: {
                                              display: false,
                                              beginAtZero: true
                                          }
                                      }
                                  ]
                              },
                              tooltips: {
                                  titleFontColor: "#888",
                                  bodyFontColor: "#555",
                                  titleFontSize: 12,
                                  bodyFontSize: 15,
                                  backgroundColor: "rgba(256,256,256,0.95)",
                                  displayColors: false,
                                  borderColor: "rgba(220, 220, 220, 0.9)",
                                  borderWidth: 2
                              }
                          }
                      });
                  }

                  var dual = document.getElementById("dual-line");
                  if (dual !== null) {
                      var urChart = new Chart(dual, {
                          type: "line",
                          data: {
                              labels: ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"],
                              datasets: [
                                  {
                                      label: "Old",
                                      pointRadius: 4,
                                      pointBackgroundColor: "rgba(255,255,255,1)",
                                      pointBorderWidth: 2,
                                      fill: false,
                                      backgroundColor: "transparent",
                                      borderWidth: 2,
                                      borderColor: "#fdc506",
                                      data: [0, 4, 3, 5.5, 3, 4.7, 0]
                                  },
                                  {
                                      label: "New",
                                      fill: false,
                                      pointRadius: 4,
                                      pointBackgroundColor: "rgba(255,255,255,1)",
                                      pointBorderWidth: 2,
                                      backgroundColor: "transparent",
                                      borderWidth: 2,
                                      borderColor: "#4c84ff",
                                      data: [0, 2, 4.3, 3.8, 5.2, 1.8, 2.2]
                                  }
                              ]
                          },
                          options: {
                              responsive: true,
                              maintainAspectRatio: false,
                              layout: {
                                  padding: {
                                      right: 10
                                  }
                              },

                              legend: {
                                  display: false
                              },
                              scales: {
                                  xAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false,
                                              display: false
                                          },
                                          ticks: {
                                              display: false, // hide main x-axis line
                                              beginAtZero: true
                                          },
                                          barPercentage: 1.8,
                                          categoryPercentage: 0.2
                                      }
                                  ],
                                  yAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false, // hide main y-axis line
                                              display: false
                                          },
                                          ticks: {
                                              display: false,
                                              beginAtZero: true
                                          }
                                      }
                                  ]
                              },
                              tooltips: {
                                  titleFontColor: "#888",
                                  bodyFontColor: "#555",
                                  titleFontSize: 12,
                                  bodyFontSize: 14,
                                  backgroundColor: "rgba(256,256,256,0.95)",
                                  displayColors: true,
                                  borderColor: "rgba(220, 220, 220, 0.9)",
                                  borderWidth: 2
                              }
                          }
                      });
                  }
                  var area = document.getElementById("area-chart");
                  if (area !== null) {
                      var areaChart = new Chart(area, {
                          type: "line",
                          data: {
                              labels: ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"],
                              datasets: [
                                  {
                                      label: "New",
                                      pointHitRadius: 10,
                                      pointRadius: 0,
                                      fill: true,
                                      backgroundColor: "rgba(76, 132, 255, 0.9)",
                                      borderColor: "rgba(76, 132, 255, 0.9)",
                                      data: [0, 4, 2, 6.5, 3, 4.7, 0]
                                  },
                                  {
                                      label: "Old",
                                      pointHitRadius: 10,
                                      pointRadius: 0,
                                      fill: true,
                                      backgroundColor: "rgba(253, 197, 6, 0.9)",
                                      borderColor: "rgba(253, 197, 6, 1)",
                                      data: [0, 2, 4.3, 3.8, 5.2, 1.8, 2.2]
                                  }
                              ]
                          },
                          options: {
                              responsive: true,
                              maintainAspectRatio: false,
                              legend: {
                                  display: false
                              },
                              layout: {
                                  padding: {
                                      right: 10
                                  }
                              },
                              scales: {
                                  xAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false,
                                              display: false
                                          },
                                          ticks: {
                                              display: false, // hide main x-axis line
                                              beginAtZero: true
                                          },
                                          barPercentage: 1.8,
                                          categoryPercentage: 0.2
                                      }
                                  ],
                                  yAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false, // hide main y-axis line
                                              display: false
                                          },
                                          ticks: {
                                              display: false,
                                              beginAtZero: true
                                          }
                                      }
                                  ]
                              },
                              tooltips: {
                                  titleFontColor: "#888",
                                  bodyFontColor: "#555",
                                  titleFontSize: 12,
                                  bodyFontSize: 14,
                                  backgroundColor: "rgba(256,256,256,0.95)",
                                  displayColors: true,
                                  borderColor: "rgba(220, 220, 220, 0.9)",
                                  borderWidth: 2
                              }
                          }
                      });
                  }
                  var line = document.getElementById("line");
                  if (line !== null) {
                      line = line.getContext("2d");
                      var gradientFill = line.createLinearGradient(0, 120, 0, 0);
                      gradientFill.addColorStop(0, "rgba(41,204,151,0.10196)");
                      gradientFill.addColorStop(1, "rgba(41,204,151,0.30196)");

                      var lChart = new Chart(line, {
                          type: "line",
                          data: {
                              labels: ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"],
                              datasets: [
                                  {
                                      label: "Rev",
                                      lineTension: 0,
                                      pointRadius: 4,
                                      pointBackgroundColor: "rgba(255,255,255,1)",
                                      pointBorderWidth: 2,
                                      fill: true,
                                      backgroundColor: gradientFill,
                                      borderColor: "#29cc97",
                                      borderWidth: 2,
                                      data: [0, 4, 3, 5.5, 3, 4.7, 1]
                                  }
                              ]
                          },
                          options: {
                              responsive: true,
                              maintainAspectRatio: false,
                              legend: {
                                  display: false
                              },
                              layout: {
                                  padding: {
                                      right: 10
                                  }
                              },
                              scales: {
                                  xAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false,
                                              display: false
                                          },
                                          ticks: {
                                              display: false, // hide main x-axis line
                                              beginAtZero: true
                                          },
                                          barPercentage: 1.8,
                                          categoryPercentage: 0.2
                                      }
                                  ],
                                  yAxes: [
                                      {
                                          gridLines: {
                                              drawBorder: false, // hide main y-axis line
                                              display: false
                                          },
                                          ticks: {
                                              display: false,
                                              beginAtZero: true
                                          }
                                      }
                                  ]
                              },
                              tooltips: {
                                  titleFontColor: "#888",
                                  bodyFontColor: "#555",
                                  titleFontSize: 12,
                                  bodyFontSize: 14,
                                  backgroundColor: "rgba(256,256,256,0.95)",
                                  displayColors: true,
                                  borderColor: "rgba(220, 220, 220, 0.9)",
                                  borderWidth: 2
                              }
                          }
                      });
                  }
                  var ctx = document.getElementById("linechart");
                  if (ctx !== null) {
                      var chart = new Chart(ctx, {
                          // The type of chart we want to create
                          type: "line",

                          // The data for our dataset
                          data: {
                              labels: [
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr",
                                  "May",
                                  "Jun",
                                  "Jul",
                                  "Aug",
                                  "Sep",
                                  "Oct",
                                  "Nov",
                                  "Dec"
                              ],
                              datasets: [
                                  {
                                      label: "",
                                      backgroundColor: "transparent",
                                      borderColor: "rgb(82, 136, 255)",
                                      data: [
                                          ${requestScope.revenue1},
                                          ${requestScope.revenue2},
                                          ${requestScope.revenue3},
                                          ${requestScope.revenue4},
                                          ${requestScope.revenue5},
                                          ${requestScope.revenue6},
                                          ${requestScope.revenue7},
                                          ${requestScope.revenue8},
                                          ${requestScope.revenue9},
                                          ${requestScope.revenue10},
                                          ${requestScope.revenue11},
                                          ${requestScope.revenue12}
                                      ],
                                      lineTension: 0.3,
                                      pointRadius: 5,
                                      pointBackgroundColor: "rgba(255,255,255,1)",
                                      pointHoverBackgroundColor: "rgba(255,255,255,1)",
                                      pointBorderWidth: 2,
                                      pointHoverRadius: 8,
                                      pointHoverBorderWidth: 1
                                  }
                              ]
                          },

                          // Configuration options go here
                          options: {
                              responsive: true,
                              maintainAspectRatio: false,
                              legend: {
                                  display: false
                              },
                              layout: {
                                  padding: {
                                      right: 10
                                  }
                              },
                              scales: {
                                  xAxes: [
                                      {
                                          gridLines: {
                                              display: false
                                          }
                                      }
                                  ],
                                  yAxes: [
                                      {
                                          gridLines: {
                                              display: true,
                                              color: "#eee",
                                              zeroLineColor: "#eee",
                                          },
                                          ticks: {
                                              callback: function (value) {
                                                  var ranges = [
                                                      {divider: 1e6, suffix: "M"},
                                                      {divider: 1e4, suffix: "k"}
                                                  ];
                                                  function formatNumber(n) {
                                                      for (var i = 0; i < ranges.length; i++) {
                                                          if (n >= ranges[i].divider) {
                                                              return (
                                                                      (n / ranges[i].divider).toString() + ranges[i].suffix
                                                                      );
                                                          }
                                                      }
                                                      return n;
                                                  }
                                                  return formatNumber(value);
                                              }
                                          }
                                      }
                                  ]
                              },
                              tooltips: {
                                  callbacks: {
                                      title: function (tooltipItem, data) {
                                          return data["labels"][tooltipItem[0]["index"]];
                                      },
                                      label: function (tooltipItem, data) {
                                          return "$" + data["datasets"][0]["data"][tooltipItem["index"]];
                                      }
                                  },
                                  responsive: true,
                                  intersect: false,
                                  enabled: true,
                                  titleFontColor: "#888",
                                  bodyFontColor: "#555",
                                  titleFontSize: 12,
                                  bodyFontSize: 18,
                                  backgroundColor: "rgba(256,256,256,0.95)",
                                  xPadding: 20,
                                  yPadding: 10,
                                  displayColors: false,
                                  borderColor: "rgba(220, 220, 220, 0.9)",
                                  borderWidth: 2,
                                  caretSize: 10,
                                  caretPadding: 15
                              }
                          }
                      });
                  }
                    </script>
                    </body>

                    </html>