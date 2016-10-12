<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><decorator:title></decorator:title>-LIFE-TECH industry&trading co.,ltd. Ningbo luxtech import&export co.,ltd.</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/datepicker.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/ui.jqgrid.min.css" />
		
		<!-- text fonts -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/fonts/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/html5shiv.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/respond.min.js"></script>
		<![endif]-->
		
		
		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.2.1.1.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/resources/js/assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath()%>/resources/js/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=request.getContextPath()%>/resources/js/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.jqGrid.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/grid.locale-en.js"></script>

		<!--[if lte IE 8]>
		  <script src="<%=request.getContextPath()%>/resources/js/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery-ui.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.easypiechart.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.sparkline.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.flot.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.flot.pie.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/assets/js/ace.min.js"></script>
		<decorator:head></decorator:head>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="<%=request.getContextPath()%>/admin/" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							LIFE-TECH industry&trading co.,ltd. Ningbo luxtech import&export co.,ltd.
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="blue">
							<a href="<%=request.getContextPath()%>/index" target="_blank">
								Home
							</a>
						</li>
						<!--  
						<li class="purple">
							<a  class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>
						</li>

						<li class="green">
							<a class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>
						</li>
						-->

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info">
									<small>Welcome</small> admin
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="<%=request.getContextPath() %>/logout">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
				
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-picture-o"></i>
							<span class="menu-text">
								Slider
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						
						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/slider/list">
									<i class="menu-icon fa fa-caret-right"></i>
									Slider Manage
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				
				
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text">
								Products
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/slider/productscategory">
									<i class="menu-icon fa fa-caret-right"></i>
									products Category
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/slider/productsmanage">
									<i class="menu-icon fa fa-caret-right"></i>
									products Manage
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				
				
					
						<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text">
								About us
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						
						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/about/companyprofile">
									<i class="menu-icon fa fa-caret-right"></i>
									Company Profile
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/about/ourculture">
									<i class="menu-icon fa fa-caret-right"></i>
									Our Culture
								</a>
								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/about/certification/list">
									<i class="menu-icon fa fa-caret-right"></i>
									Certification
								</a>
								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/about/businesscustomers">
									<i class="menu-icon fa fa-caret-right"></i>
									Business Customers
								</a>
								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/about/facility/list">
									<i class="menu-icon fa fa-caret-right"></i>
									Facility
								</a>
								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>
      
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								Service
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">

							<li class="">
								<a href="<%=request.getContextPath() %>/admin/service/salesmap">
									<i class="menu-icon fa fa-caret-right"></i>
									Sales Map
								</a>
								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/service/serviceteam">
									<i class="menu-icon fa fa-caret-right"></i>
									Service Team
								</a>
								<b class="arrow"></b>
							</li>

						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text">
							
							News
							
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/news/companynews">
									<i class="menu-icon fa fa-caret-right"></i>
									Company News
								</a>

								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text">
							
							Contact us
							
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/contact/location">
									<i class="menu-icon fa fa-caret-right"></i>
									Location
								</a>

								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-envelope"></i>
							<span class="menu-text">
								Feedback
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						
						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/feedback/inquiry">
									<i class="menu-icon fa fa-caret-right"></i>
									Inquiry
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/feedback/onlinefeedback">
									<i class="menu-icon fa fa-caret-right"></i>
									Online Feedback
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-tag"></i>
							<span class="menu-text">
								Account
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						
						<ul class="submenu">
							<li class="">
								<a href="<%=request.getContextPath() %>/admin/account/changepassword">
									<i class="menu-icon fa fa-caret-right"></i>
									Change Password
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>


			<!-- add body content  -->
			<decorator:body></decorator:body>

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">WebSite System</span>
							CopyRight © 2016 - 2017 LIFE-TECH industry&trading co.,ltd. Ningbo luxtech import&export co.,ltd. All rights Reserved 
						</span>

						&nbsp; &nbsp;
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

</body>
</html>

