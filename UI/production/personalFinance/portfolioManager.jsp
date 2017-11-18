<!DOCTYPE html>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<html lang="en">
<head>
<jsp:include page="template/meta-content.jsp" />
<!-- Datatables -->
<link
	href="UI/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="UI/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="UI/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="UI/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="UI/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
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
							<h3>
								Portfolio <small>View complete info of your portfolio</small>
							</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									<i class="fa fa-bars"></i> Tabs <small>Float left</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content" style="display: block;">


								<div class="" role="tabpanel" data-example-id="togglable-tabs">
									<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
										<li role="presentation" class="active"><a
											href="#tab_content1" id="bank-tab" role="tab"
											data-toggle="tab" aria-expanded="true">Bank</a></li>
										<li role="presentation" class=""><a href="#tab_content2"
											role="tab" id="profile-tab" data-toggle="tab"
											aria-expanded="false">Mutual Fund</a></li>
										<li role="presentation" class=""><a href="#tab_content3"
											role="tab" id="profile-tab2" data-toggle="tab"
											aria-expanded="false">Stocks</a></li>
									</ul>
									<div id="myTabContent" class="tab-content">
										<div role="tabpanel" class="tab-pane fade active in"
											id="tab_content1" aria-labelledby="bank-tab">
											<jsp:include page="holdings/bankPortfolio.jsp" />
											
										</div>
										<div role="tabpanel" class="tab-pane fade" id="tab_content2"
											aria-labelledby="profile-tab">
											<p>Yet to be developed</p>
										</div>
										<div role="tabpanel" class="tab-pane fade" id="tab_content3"
											aria-labelledby="profile-tab">
											<jsp:include page="holdings/stockPortfolio.jsp" />
											
										</div>
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
						Gentelella - Bootstrap Admin Template by <a
							href="https://colorlib.com">Colorlib</a>
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
		<!-- validator -->
		<script src="UI/vendors/validator/validator.js"></script>
		<!-- bootstrap-daterangepicker -->
		<script src="UI/vendors/moment/min/moment.min.js"></script>
		<script src="UI/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
		<!-- Datatables -->
		<script src="UI/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
		<script
			src="UI/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
		<script
			src="UI/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
		<script
			src="UI/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
		<script
			src="UI/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
		<script
			src="UI/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
		<script
			src="UI/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
		<script
			src="UI/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
		<script
			src="UI/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
		<script
			src="UI/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
		<script
			src="UI/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
		<script
			src="UI/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
		<script src="UI/vendors/jszip/dist/jszip.min.js"></script>
		<script src="UI/vendors/pdfmake/build/pdfmake.min.js"></script>
		<script src="UI/vendors/pdfmake/build/vfs_fonts.js"></script>

		<!-- Custom Theme Scripts -->
		<script src="UI/build/js/custom.min.js"></script>

		<!-- Portfolio Manager JS -->
		<script src="UI/production/js/js/portfolioManager.js"></script>

		<!-- Datatables -->
		<script>
		$(document).ready(function() {
			var handleDataTableButtons = function() {
				if ($("#datatable-buttons").length) {
					$("#datatable-buttons").DataTable({
						dom : "Bfrtip",
						buttons : [ {
							extend : "copy",
							className : "btn-sm"
						}, {
							extend : "csv",
							className : "btn-sm"
						}, {
							extend : "excel",
							className : "btn-sm"
						}, {
							extend : "pdfHtml5",
							className : "btn-sm"
						}, {
							extend : "print",
							className : "btn-sm"
						}, ],
						responsive : true
					});
				}
			};

			TableManageButtons = function() {
				"use strict";
				return {
					init : function() {
						handleDataTableButtons();
					}
				};
			}();

			$('#datatable').dataTable();

			$('#datatable-keytable').DataTable({
				keys : true
			});

			$('#datatable-responsive').DataTable();
			
			$('#stockTable').DataTable();
			
			$('#datatable-scroller').DataTable({
				ajax : "js/datatables/json/scroller-demo.json",
				deferRender : true,
				scrollY : 380,
				scrollCollapse : true,
				scroller : true
			});

			$('#datatable-fixed-header').DataTable({
				fixedHeader : true
			});

			var $datatable = $('#datatable-checkbox');

			$datatable.dataTable({
				'order' : [ [ 1, 'asc' ] ],
				'columnDefs' : [ {
					orderable : false,
					targets : [ 0 ]
				} ]
			});
			$datatable.on('draw.dt', function() {
				$('input').iCheck({
					checkboxClass : 'icheckbox_flat-green'
				});
			});

			TableManageButtons.init();
		});
	</script>
		<!-- /Datatables -->

		<!-- validator -->
		<script>
      // initialize the validator function
      validator.message.date = 'not a real date';

      // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
      $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField)
        .on('keypress', 'input[required][pattern]', validator.keypress);

      $('.multi.required').on('keyup blur', 'input', function() {
        validator.checkField.apply($(this).siblings().last()[0]);
      });

      $('form').submit(function(e) {
        e.preventDefault();
        var submit = true;

        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
          submit = false;
        }

        if (submit)
          this.submit();

        return false;
      });
    </script>
		<!-- /validator -->
		<!-- bootstrap-daterangepicker -->
		<script>
      var startDate = new Date();
      var endDate = new Date();
      var diff = 0;
      $(document).ready(function() {
        $('#bankStartDate').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_4"
        }, function(start, end, label) {
        	startDate = start;
        	diff  = new Date(endDate - startDate),
        	diff  = (diff)/1000/60/60/24;
        	$(".bankDuration").html(Math.ceil(diff));
        	$("#bankDuration").val(Math.ceil(diff));
        	console.log(diff);
        });
        $('#bankEndDate').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_4"
          }, function(start, end, label) {
        	  endDate = start;
        	  diff  = new Date(endDate - startDate),
          	  diff  = diff/1000/60/60/24;
        	  $(".bankDuration").html(Math.ceil(diff));
        	  $("#bankDuration").val(Math.ceil(diff));
              console.log(diff);
          });
      });
    </script>
</body>
</html>