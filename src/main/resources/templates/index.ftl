<!doctype html>
<html class="fixed">
<head>

	<!-- Basic -->
	<meta charset="UTF-8">
	<title>App de Encuestas</title>
	<meta name="keywords" content="HTML5 Admin Template" />
	<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
	<meta name="author" content="JSOFT.net">

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<!-- Web Fonts  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

	<!-- Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="assets/vendor/morris/morris.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" href="assets/stylesheets/theme.css" />

	<!-- Skin CSS -->
	<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

	<!-- Head Libs -->
	<script src="assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
<section class="body">

	<!-- start: header -->
	<#include "body_header.ftl">
	<!-- end: header -->

	<div class="inner-wrapper">
		<!-- start: sidebar -->
		<#include "sidebar.ftl">
		<!-- end: sidebar -->

		<section role="main" class="content-body">
			<header class="page-header">
				<h2>dashboard</h2>

				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li>
							<a href="/">
								<i class="fa fa-home"></i>
							</a>
						</li>
						<li><span>dashboard</span></li>
					</ol>
				</div>
			</header>
			<div class="row">
				<div class="col-md-6">
					<section class="panel">
						<header class="panel-heading">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
								<a href="#" class="fa fa-times"></a>
							</div>

							<h2 class="panel-title">Lista de Encuestas</h2>
							<p class="panel-subtitle">Seleccione una encuesta para ver resultados</p>
						</header>
						<div class="panel-body">
							<div class="row">
								<div class="form-group mt-lg">
									<label class="col-sm-3 form-control-label">encuesta</label>
									<div class="col-sm-9">
										<select id="encuesta" name="encuesta" class="form-control"
												style="width: 100%;" tabindex="-1" aria-hidden="true"
												required>
											<option selected="selected">Seleccionar Encuesta</option>
											<#list encuestas as encuesta>
												<option value="${encuesta.getId()}">${encuesta.getComentario()} </option>
											</#list>
										</select>
									</div>
								</div>
							</div>
							<!-- Flot: Bars -->
							<div class="chart chart-md" id="flotBars"></div>
						</div>
					</section>
				</div>

			</div>
			<!-- start: page -->
			<!-- end: page -->
		</section>
	</div>
</section>

<!-- Vendor -->
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="assets/vendor/jquery-appear/jquery.appear.js"></script>
<script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
<script src="assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
<script src="assets/vendor/flot/jquery.flot.js"></script>
<script src="assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
<script src="assets/vendor/flot/jquery.flot.pie.js"></script>
<script src="assets/vendor/flot/jquery.flot.categories.js"></script>
<script src="assets/vendor/flot/jquery.flot.resize.js"></script>
<script src="assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
<script src="assets/vendor/raphael/raphael.js"></script>
<script src="assets/vendor/morris/morris.js"></script>
<script src="assets/vendor/gauge/gauge.js"></script>
<script src="assets/vendor/snap-svg/snap.svg.js"></script>
<script src="assets/vendor/liquid-meter/liquid.meter.js"></script>
<script src="assets/vendor/jqvmap/jquery.vmap.js"></script>
<script src="assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
<script src="assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="assets/javascripts/theme.init.js"></script>


<!-- Examples -->
<script src="assets/javascripts/dashboard/examples.dashboard.js"></script>
<script src="assets/javascripts/ui-elements/examples.charts.js"></script>
<script>

	$("#categoria").change(function() {
		var categoria = $(this).val();
		$.ajax({
			url: '/alquileres/famaverage/'+categoria,
			type: 'GET',
			success: function(response) {
				var plot = $.plot('#flotBars', [response], {
					colors: ['#8CC9E8'],
					series: {
						bars: {
							show: true,
							barWidth: 0.8,
							align: 'center'
						}
					},
					xaxis: {
						mode: 'categories',
						tickLength: 0
					},
					grid: {
						hoverable: true,
						clickable: true,
						borderColor: 'rgba(0,0,0,0.1)',
						borderWidth: 1,
						labelMargin: 15,
						backgroundColor: 'transparent'
					},
					tooltip: true,
					tooltipOpts: {
						content: '%y',
						shifts: {
							x: -10,
							y: 20
						},
						defaultTheme: false
					}
				});
			}

		});
	});

</script>

</body>
</html>