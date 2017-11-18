<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Personal Finance</title>

<!-- Bootstrap -->
<link href="UI/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="UI/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="UI/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="UI/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link href="UI/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">
<!-- Select2 -->
<link href="UI/vendors/select2/dist/css/select2.min.css"
	rel="stylesheet">
<!-- Switchery -->
<link href="UI/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- starrr -->
<link href="UI/vendors/starrr/dist/starrr.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="UI/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="UI/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<!-- top navigation -->
			<div class="top_nav" style="margin-left: 0px">
				<div class="nav_menu">
					<nav>
						<a href="/"><img src="UI/production/images/logo.png"
							style="width: 64px; margin-left: 10px; margin-top: 2px;"></a>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="margin-left: 0px">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<i class="fa fa-cogs" style="padding: 10px 15px 10px 10px;"></i>Configuration
								Console
							</h3>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>DB Installation</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="demo-form" data-parsley-validate=""
										class="form-horizontal form-label-left" novalidate=""
										action="Install" method="post">

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">DB Location <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" required="required" name="DBLocation"
													class="form-control col-md-7 col-xs-12"
													data-validate-words="2" placeholder="Path/to/pgsql"
													required="required"
													value="<%=request.getAttribute("DBLocation")%>"> <span
													class="fa fa-folder-open form-control-feedback right"
													aria-hidden="true"></span>

											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">DB Cluster Name <span
												class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBClustername"
													class="form-control col-md-7 col-xs-12"
													data-validate-words="2" placeholder="DB Cluster Name"
													required="required"
													value="<%=request.getAttribute("DBClustername")%>">
												<span class="fa fa-object-group form-control-feedback right"
													aria-hidden="true"></span>

											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">DB
												Name<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBName"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="2" placeholder="DB Name"
													required="required"
													value="<%=request.getAttribute("DBName")%>"> <span
													class="fa fa-database form-control-feedback right"
													aria-hidden="true"></span>

											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">DB
												Username <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBUsername"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="2" placeholder="DB User Name"
													required="required"
													value="<%=request.getAttribute("DBUsername")%>"> <span
													class="fa fa-user form-control-feedback right"
													aria-hidden="true"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">DB
												Password <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBPass"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="2" placeholder="DB Password"
													required="required"
													value="<%=request.getAttribute("DBPass")%>"> <span
													class="fa fa-key form-control-feedback right"
													aria-hidden="true"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">DB
												IP </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBIP"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="2"
													placeholder="DB IP - Leave Blank if you are not sure"
													value="<%=request.getAttribute("DBIP")%>"> <span
													class="fa fa-id-badge form-control-feedback right"
													aria-hidden="true"></span>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">DB
												Port </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="DBPort"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="2"
													placeholder="DB Port - Leave Blank if you are not sure"
													value="<%=request.getAttribute("DBPort")%>"> <span
													class="fa  fa-reply-all form-control-feedback right"
													aria-hidden="true"></span>
											</div>
										</div>



										<div class="ln_solid"></div>
										<div class="form-group" style="text-align: center;">
											<div class="col-md-3 col-sm-3 col-xs-12"></div>
											<div class="col-md-6 col-sm-6 col-xs-12 ">
												<input type="hidden" name="DBAction" value="save">
												<button type="submit" class="btn btn-primary">Cancel</button>
												<button type="submit" class="btn btn-success">Submit</button>
											</div>
										</div>
									</form>
									<div class="row" style="text-align: center">
										<label class="control-label"
											style="padding-top: 30px; font-size: 30px;"><%=request.getAttribute("DBStatus")%></label>
									</div>
									<div class="row" style="padding: 19px;">
										<div class="col-xs-3"></div>
										<div class="col-xs-6">
											<form action="Install" method="post">
												<input type="hidden" name="DBAction" value="start">
												<button type="submit"
													class="btn btn-primary btn-block btn-flat"
													<%if (request.getAttribute("DBStatus").equals("DB Running")) {%>
													disabled <%}%>>Start DB</button>
											</form>
										</div>
										<!-- /.col -->
									</div>
									<div class="row" style="padding: 19px">
										<div class="col-xs-3"></div>
										<div class="col-xs-3">
											<form action="Install" method="post">
												<input type="hidden" name="DBAction" value="erase">
												<button disabled type="submit"
													class="btn btn-danger btn-block btn-flat">Erase DB</button>
											</form>
										</div>
										<div class="col-xs-3">
											<form action="Install" method="post">
												<input type="hidden" name="DBAction" value="initialize">
												<button type="submit" id="initialize"
													class="btn btn-danger btn-block btn-flat">Initialize
													DB</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer style="margin-left: 0">
				<div class="pull-right">
					Personal Finance</a>
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
	<!-- bootstrap-progressbar -->
	<script
		src="UI/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="UI/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="UI/vendors/moment/min/moment.min.js"></script>
	<script src="UI/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="UI/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="UI/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="UI/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="UI/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="UI/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="UI/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="UI/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="UI/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script
		src="UI/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="UI/vendors/starrr/dist/starrr.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="UI/build/js/custom.min.js"></script>

	<!-- bootstrap-daterangepicker -->
	<script>
		$(document).ready(function() {
			$('#birthday').daterangepicker({
				singleDatePicker : true,
				calender_style : "picker_4"
			}, function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
			});
		});
	</script>
	<!-- /bootstrap-daterangepicker -->

	<!-- bootstrap-wysiwyg -->
	<script>
		$(document)
				.ready(
						function() {
							function initToolbarBootstrapBindings() {
								var fonts = [ 'Serif', 'Sans', 'Arial',
										'Arial Black', 'Courier',
										'Courier New', 'Comic Sans MS',
										'Helvetica', 'Impact', 'Lucida Grande',
										'Lucida Sans', 'Tahoma', 'Times',
										'Times New Roman', 'Verdana' ], fontTarget = $(
										'[title=Font]').siblings(
										'.dropdown-menu');
								$
										.each(
												fonts,
												function(idx, fontName) {
													fontTarget
															.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">'
																	+ fontName
																	+ '</a></li>'));
												});
								$('a[title]').tooltip({
									container : 'body'
								});
								$('.dropdown-menu input').click(function() {
									return false;
								}).change(
										function() {
											$(this).parent('.dropdown-menu')
													.siblings(
															'.dropdown-toggle')
													.dropdown('toggle');
										}).keydown('esc', function() {
									this.value = '';
									$(this).change();
								});

								$('[data-role=magic-overlay]')
										.each(
												function() {
													var overlay = $(this), target = $(overlay
															.data('target'));
													overlay
															.css('opacity', 0)
															.css('position',
																	'absolute')
															.offset(
																	target
																			.offset())
															.width(
																	target
																			.outerWidth())
															.height(
																	target
																			.outerHeight());
												});

								if ("onwebkitspeechchange" in document
										.createElement("input")) {
									var editorOffset = $('#editor').offset();

									$('.voiceBtn')
											.css('position', 'absolute')
											.offset(
													{
														top : editorOffset.top,
														left : editorOffset.left
																+ $('#editor')
																		.innerWidth()
																- 35
													});
								} else {
									$('.voiceBtn').hide();
								}
							}

							function showErrorAlert(reason, detail) {
								var msg = '';
								if (reason === 'unsupported-file-type') {
									msg = "Unsupported format " + detail;
								} else {
									console.log("error uploading file", reason,
											detail);
								}
								$(
										'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
												+ '<strong>File upload error</strong> '
												+ msg + ' </div>').prependTo(
										'#alerts');
							}

							initToolbarBootstrapBindings();

							$('#editor').wysiwyg({
								fileUploadError : showErrorAlert
							});

							window.prettyPrint;
							prettyPrint();
						});
	</script>
	<!-- /bootstrap-wysiwyg -->

	<!-- Select2 -->
	<script>
		$(document).ready(function() {
			$(".select2_single").select2({
				placeholder : "Select a state",
				allowClear : true
			});
			$(".select2_group").select2({});
			$(".select2_multiple").select2({
				maximumSelectionLength : 4,
				placeholder : "With Max Selection limit 4",
				allowClear : true
			});
		});
	</script>
	<!-- /Select2 -->

	<!-- jQuery Tags Input -->
	<script>
		function onAddTag(tag) {
			alert("Added a tag: " + tag);
		}

		function onRemoveTag(tag) {
			alert("Removed a tag: " + tag);
		}

		function onChangeTag(input, tag) {
			alert("Changed a tag: " + tag);
		}

		$(document).ready(function() {
			$('#tags_1').tagsInput({
				width : 'auto'
			});
		});
	</script>
	<!-- /jQuery Tags Input -->

	<!-- Parsley -->
	<script>
		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form .btn').on('click', function() {
				$('#demo-form').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});

		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form2 .btn').on('click', function() {
				$('#demo-form2').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form2').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});
		try {
			hljs.initHighlightingOnLoad();
		} catch (err) {
		}
	</script>
	<!-- /Parsley -->

	<!-- Autosize -->
	<script>
		$(document).ready(function() {
			autosize($('.resizable_textarea'));
		});
	</script>
	<!-- /Autosize -->

	<!-- jQuery autocomplete -->
	<script>
		$(document).ready(function() {
			var countries = {
				AD : "Andorra",
				A2 : "Andorra Test",
				AE : "United Arab Emirates",
				AF : "Afghanistan",
				AG : "Antigua and Barbuda",
				AI : "Anguilla",
				AL : "Albania",
				AM : "Armenia",
				AN : "Netherlands Antilles",
				AO : "Angola",
				AQ : "Antarctica",
				AR : "Argentina",
				AS : "American Samoa",
				AT : "Austria",
				AU : "Australia",
				AW : "Aruba",
				AX : "Åland Islands",
				AZ : "Azerbaijan",
				BA : "Bosnia and Herzegovina",
				BB : "Barbados",
				BD : "Bangladesh",
				BE : "Belgium",
				BF : "Burkina Faso",
				BG : "Bulgaria",
				BH : "Bahrain",
				BI : "Burundi",
				BJ : "Benin",
				BL : "Saint Barthélemy",
				BM : "Bermuda",
				BN : "Brunei",
				BO : "Bolivia",
				BQ : "British Antarctic Territory",
				BR : "Brazil",
				BS : "Bahamas",
				BT : "Bhutan",
				BV : "Bouvet Island",
				BW : "Botswana",
				BY : "Belarus",
				BZ : "Belize",
				CA : "Canada",
				CC : "Cocos [Keeling] Islands",
				CD : "Congo - Kinshasa",
				CF : "Central African Republic",
				CG : "Congo - Brazzaville",
				CH : "Switzerland",
				CI : "Côte d’Ivoire",
				CK : "Cook Islands",
				CL : "Chile",
				CM : "Cameroon",
				CN : "China",
				CO : "Colombia",
				CR : "Costa Rica",
				CS : "Serbia and Montenegro",
				CT : "Canton and Enderbury Islands",
				CU : "Cuba",
				CV : "Cape Verde",
				CX : "Christmas Island",
				CY : "Cyprus",
				CZ : "Czech Republic",
				DD : "East Germany",
				DE : "Germany",
				DJ : "Djibouti",
				DK : "Denmark",
				DM : "Dominica",
				DO : "Dominican Republic",
				DZ : "Algeria",
				EC : "Ecuador",
				EE : "Estonia",
				EG : "Egypt",
				EH : "Western Sahara",
				ER : "Eritrea",
				ES : "Spain",
				ET : "Ethiopia",
				FI : "Finland",
				FJ : "Fiji",
				FK : "Falkland Islands",
				FM : "Micronesia",
				FO : "Faroe Islands",
				FQ : "French Southern and Antarctic Territories",
				FR : "France",
				FX : "Metropolitan France",
				GA : "Gabon",
				GB : "United Kingdom",
				GD : "Grenada",
				GE : "Georgia",
				GF : "French Guiana",
				GG : "Guernsey",
				GH : "Ghana",
				GI : "Gibraltar",
				GL : "Greenland",
				GM : "Gambia",
				GN : "Guinea",
				GP : "Guadeloupe",
				GQ : "Equatorial Guinea",
				GR : "Greece",
				GS : "South Georgia and the South Sandwich Islands",
				GT : "Guatemala",
				GU : "Guam",
				GW : "Guinea-Bissau",
				GY : "Guyana",
				HK : "Hong Kong SAR China",
				HM : "Heard Island and McDonald Islands",
				HN : "Honduras",
				HR : "Croatia",
				HT : "Haiti",
				HU : "Hungary",
				ID : "Indonesia",
				IE : "Ireland",
				IL : "Israel",
				IM : "Isle of Man",
				IN : "India",
				IO : "British Indian Ocean Territory",
				IQ : "Iraq",
				IR : "Iran",
				IS : "Iceland",
				IT : "Italy",
				JE : "Jersey",
				JM : "Jamaica",
				JO : "Jordan",
				JP : "Japan",
				JT : "Johnston Island",
				KE : "Kenya",
				KG : "Kyrgyzstan",
				KH : "Cambodia",
				KI : "Kiribati",
				KM : "Comoros",
				KN : "Saint Kitts and Nevis",
				KP : "North Korea",
				KR : "South Korea",
				KW : "Kuwait",
				KY : "Cayman Islands",
				KZ : "Kazakhstan",
				LA : "Laos",
				LB : "Lebanon",
				LC : "Saint Lucia",
				LI : "Liechtenstein",
				LK : "Sri Lanka",
				LR : "Liberia",
				LS : "Lesotho",
				LT : "Lithuania",
				LU : "Luxembourg",
				LV : "Latvia",
				LY : "Libya",
				MA : "Morocco",
				MC : "Monaco",
				MD : "Moldova",
				ME : "Montenegro",
				MF : "Saint Martin",
				MG : "Madagascar",
				MH : "Marshall Islands",
				MI : "Midway Islands",
				MK : "Macedonia",
				ML : "Mali",
				MM : "Myanmar [Burma]",
				MN : "Mongolia",
				MO : "Macau SAR China",
				MP : "Northern Mariana Islands",
				MQ : "Martinique",
				MR : "Mauritania",
				MS : "Montserrat",
				MT : "Malta",
				MU : "Mauritius",
				MV : "Maldives",
				MW : "Malawi",
				MX : "Mexico",
				MY : "Malaysia",
				MZ : "Mozambique",
				NA : "Namibia",
				NC : "New Caledonia",
				NE : "Niger",
				NF : "Norfolk Island",
				NG : "Nigeria",
				NI : "Nicaragua",
				NL : "Netherlands",
				NO : "Norway",
				NP : "Nepal",
				NQ : "Dronning Maud Land",
				NR : "Nauru",
				NT : "Neutral Zone",
				NU : "Niue",
				NZ : "New Zealand",
				OM : "Oman",
				PA : "Panama",
				PC : "Pacific Islands Trust Territory",
				PE : "Peru",
				PF : "French Polynesia",
				PG : "Papua New Guinea",
				PH : "Philippines",
				PK : "Pakistan",
				PL : "Poland",
				PM : "Saint Pierre and Miquelon",
				PN : "Pitcairn Islands",
				PR : "Puerto Rico",
				PS : "Palestinian Territories",
				PT : "Portugal",
				PU : "U.S. Miscellaneous Pacific Islands",
				PW : "Palau",
				PY : "Paraguay",
				PZ : "Panama Canal Zone",
				QA : "Qatar",
				RE : "Réunion",
				RO : "Romania",
				RS : "Serbia",
				RU : "Russia",
				RW : "Rwanda",
				SA : "Saudi Arabia",
				SB : "Solomon Islands",
				SC : "Seychelles",
				SD : "Sudan",
				SE : "Sweden",
				SG : "Singapore",
				SH : "Saint Helena",
				SI : "Slovenia",
				SJ : "Svalbard and Jan Mayen",
				SK : "Slovakia",
				SL : "Sierra Leone",
				SM : "San Marino",
				SN : "Senegal",
				SO : "Somalia",
				SR : "Suriname",
				ST : "São Tomé and Príncipe",
				SU : "Union of Soviet Socialist Republics",
				SV : "El Salvador",
				SY : "Syria",
				SZ : "Swaziland",
				TC : "Turks and Caicos Islands",
				TD : "Chad",
				TF : "French Southern Territories",
				TG : "Togo",
				TH : "Thailand",
				TJ : "Tajikistan",
				TK : "Tokelau",
				TL : "Timor-Leste",
				TM : "Turkmenistan",
				TN : "Tunisia",
				TO : "Tonga",
				TR : "Turkey",
				TT : "Trinidad and Tobago",
				TV : "Tuvalu",
				TW : "Taiwan",
				TZ : "Tanzania",
				UA : "Ukraine",
				UG : "Uganda",
				UM : "U.S. Minor Outlying Islands",
				US : "United States",
				UY : "Uruguay",
				UZ : "Uzbekistan",
				VA : "Vatican City",
				VC : "Saint Vincent and the Grenadines",
				VD : "North Vietnam",
				VE : "Venezuela",
				VG : "British Virgin Islands",
				VI : "U.S. Virgin Islands",
				VN : "Vietnam",
				VU : "Vanuatu",
				WF : "Wallis and Futuna",
				WK : "Wake Island",
				WS : "Samoa",
				YD : "People's Democratic Republic of Yemen",
				YE : "Yemen",
				YT : "Mayotte",
				ZA : "South Africa",
				ZM : "Zambia",
				ZW : "Zimbabwe",
				ZZ : "Unknown or Invalid Region"
			};

			var countriesArray = $.map(countries, function(value, key) {
				return {
					value : value,
					data : key
				};
			});

			// initialize autocomplete with custom appendTo
			$('#autocomplete-custom-append').autocomplete({
				lookup : countriesArray
			});
		});
	</script>
	<!-- /jQuery autocomplete -->

	<!-- Starrr -->
	<script>
		$(document).ready(function() {
			$(".stars").starrr();

			$('.stars-existing').starrr({
				rating : 4
			});

			$('.stars').on('starrr:change', function(e, value) {
				$('.stars-count').html(value);
			});

			$('.stars-existing').on('starrr:change', function(e, value) {
				$('.stars-count-existing').html(value);
			});
		});
	</script>
	<!-- /Starrr -->
</body>
</html>
