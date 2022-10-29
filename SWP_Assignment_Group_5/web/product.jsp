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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">



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
                <jsp:include page="product_header.jsp"></jsp:include>

                    <!-- ====================================
                        ??? CONTENT WRAPPER
                        ===================================== -->
                <c:if test="${requestScope.pro eq null}">
                        <div class="content-wrapper">
                        <div class="content">
                            <div class="card card-default">
                                <div class="card-header">
                                    <a href="action_pro?action=add" class="btn btn-success"><span>Add New <b>Product</b></span></a>
                                </div>
                                <div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Price</th>
                                                <th>Sale_price</th>
                                                <th>Quantity</th>
                                                <th>Description</th>
                                                <th>Image</th>
                                                <th>Category</th>
                                                <th>Created_Date</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listProducts}" var="p">
                                            <tr>
                                                <td></td>
                                                <td>${p.product_id}</td>
                                                <td>${p.title}</td>
                                                <td>$${p.price}</td>
                                                <td>${p.sale_price}</td>
                                                <td>${p.quantity}</td>
                                                <td>${p.description}</td>
                                                <td><img src="${p.img}" style="width:150px; height:100px;" class="user-image" alt="User Image" /></td>                      
                                                <c:if test="${p.category_id eq 0}">
                                                    <td>Vans Auth</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 1}">
                                                    <td>Vans Authentic</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 2}">
                                                    <td>Vans Old skool</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 3}">
                                                    <td>Vans Slip-on</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 4}">
                                                    <td>Vans SK8 - Hitdth</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 5}">
                                                    <td>Vans Vault</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 6}">
                                                    <td>Vans Auth</td>
                                                </c:if>
                                                <td>${p.create_date}</td>
                                                <td>
                                                    <a href="action_pro?pro_id=${p.product_id}&action=edit" style="color: black;" ><i class="material-icons"
                                                                                                    data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                </td>
                                                <td>                                                   
                                                    <button type="button" data-toggle="modal" data-target="#modal${p.product_id}">
                                                        <i class="material-icons" title="Delete">&#xE872;</i>
                                                    </button>                                                                                                                                                                                      
                                                </td>
                                                <td>
                                                    <div id="modal${p.product_id}" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form action="action_pro?pro_id=${p.product_id}&action=delete" method="POST">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title">Delete Product</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <p>Are you sure you want to delete these Products?</p>
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
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div> 
                </c:if>
                <c:if test="${requestScope.pro ne null}">
                            <div class="content-wrapper">
                        <div class="content">
                            <div class="card card-default">
                                <div class="card-header">
                                    <a href="action_pro?action=add" class="btn btn-success"><span>Add New <b>Product</b></span></a>
                                </div>
                                <div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Price</th>
                                                <th>Sale_price</th>
                                                <th>Quantity</th>
                                                <th>Description</th>
                                                <th>Image</th>
                                                <th>Category</th>
                                                <th>Created_Date</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.pro}" var="p">
                                            <tr>
                                                <td></td>
                                                <td>${p.product_id}</td>
                                                <td>${p.title}</td>
                                                <td>$${p.price}</td>
                                                <td>${p.sale_price}</td>
                                                <td>${p.quantity}</td>
                                                <td>${p.description}</td>
                                                <td><img src="${p.img}" style="width:150px; height:100px;" class="user-image" alt="User Image" /></td>                      
                                                <c:if test="${p.category_id eq 0}">
                                                    <td>Vans Auth</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 1}">
                                                    <td>Vans Authentic</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 2}">
                                                    <td>Vans Old skool</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 3}">
                                                    <td>Vans Slip-on</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 4}">
                                                    <td>Vans SK8 - Hitdth</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 5}">
                                                    <td>Vans Vault</td>
                                                </c:if>
                                                <c:if test="${p.category_id eq 6}">
                                                    <td>Vans Auth</td>
                                                </c:if>
                                                <td>${p.create_date}</td>
                                                <td>
                                                    <a href="action_pro?pro_id=${p.product_id}&action=edit" style="color: black;" ><i class="material-icons"
                                                                                                    data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                </td>
                                                <td>                                                   
                                                    <button type="button" data-toggle="modal" data-target="#modal${p.product_id}">
                                                        <i class="material-icons" title="Delete">&#xE872;</i>
                                                    </button>                                                                                                                                                                                      
                                                </td>
                                                <td>
                                                    <div id="modal${p.product_id}" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form action="action_pro?pro_id=${p.product_id}&action=delete" method="POST">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title">Delete Product</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <p>Are you sure you want to delete these Products?</p>
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
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>              
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
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>



    </body>

</html>
