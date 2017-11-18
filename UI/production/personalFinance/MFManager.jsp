<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="template/meta-content.jsp" />
    <link href="UI/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="UI/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="UI/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="UI/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="UI/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
  </head>

  <body class="nav-sm">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">

            <!-- sidebar menu -->
  			<jsp:include page="template/sidebar-menu.jsp" />
            <!-- /sidebar menu -->

           
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <jsp:include page="template/top-navigation.jsp" />
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Mutual Funds Manager <small></small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>List of interested MF <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                    	<li><a class="btn btn-primary btn-sm" href="portfolioManager">Portfolio</a></li>
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30" style="display:inline-block">
                      MF Manager lists the Mutual Funds that the investors are commonly interested and they could buy easily through online.
                    </p>
                    <a class="btn btn-success btn-xs" style="display:inline-block;float:right;margin-bottom:30px" href="PortfolioManager">Add new MF to the list</a>
                    
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>AMFI</th>
                          <th>Company</th>
                          <th>Scheme Name</th>
                          <th>Type</th>
                          <th>Rank</th>
                          <th>Tax</th>
                          <th>No Tax</th>
                          <th>Benchmark</th>
                          <th>Risk</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Tiger</td>
                          <td>Nixon</td>
                          <td>System Architect</td>
                          <td>d</td>
                          <td>5</td>
                          <td>Edinburgh</td>
                          <td>61</td>
                          <td>2011/04/25</td>
                          <td>$320,800</td>
                        </tr>
                        
                      </tbody>
                    </table>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="UI/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="UI/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="UI/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="UI/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="UI/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="UI/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="UI/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="UI/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="UI/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="UI/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="UI/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="UI/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="UI/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="UI/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="UI/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="UI/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="UI/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
    <script src="UI/vendors/jszip/dist/jszip.min.js"></script>
    <script src="UI/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="UI/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="UI/build/js/custom.min.js"></script>

    <!-- Datatables -->
    <script>
      $(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [
                {
                  extend: "copy",
                  className: "btn-sm"
                },
                {
                  extend: "csv",
                  className: "btn-sm"
                },
                {
                  extend: "excel",
                  className: "btn-sm"
                },
                {
                  extend: "pdfHtml5",
                  className: "btn-sm"
                },
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons();
            }
          };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
          'order': [[ 1, 'asc' ]],
          'columnDefs': [
            { orderable: false, targets: [0] }
          ]
        });
        $datatable.on('draw.dt', function() {
          $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
          });
        });

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
  </body>
</html>