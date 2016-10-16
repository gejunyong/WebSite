<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title></decorator:title>-LIFE-TECH industry&trading co.,ltd. Ningbo luxtech import&export co.,ltd.</title>
<meta name="keywords" content="LIFE-TECH">
<meta name="description" content="LIFE-TECH"> 
<meta name="author" content="">
<!-- Apple iOS and Android stuff -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="<%=request.getContextPath() %>/resources/index/images/common/favicon.ico" type="image/x-icon">
<link href="<%=request.getContextPath() %>/resources/index/index_files/reset.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/layout.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/common.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/index.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/global.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/colorbox.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/index/index_files/page.css" type="text/css" rel="stylesheet">
<!--[if IE]><script src="js/lib/html5.js"></script><![endif]-->
<!--[if lt IE 10]><script type="text/javascript" src="js/lib/PIE.js"></script><![endif]-->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/jquery_002.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/jquery_003.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/iecss3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/clearInput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/index/index_files/bannerChange.js"></script>
<style class="firebugResetStyles" type="text/css" charset="utf-8">
</style>
<decorator:head></decorator:head>
<script type="text/javascript">
//设置cookie
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires+";path=/";
}
//获取cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}
//清除cookie  
function clearCookie(name) {  
    setCookie(name, "", -1);  
}  

function setMarket(){
    var ltmarket = getCookie("ltmarket");
	var ca = ltmarket.split(',');
	$('#basketCount').text(ca.length-1);
}
</script>
</head>
<body>
	
	<!-- Header -->

<script type="text/javascript">
    $(function() {
        //侧导航
        var $aside = $(".sidebar li");
        var $secList = $(".secListBox");

        $aside.hover(function() {
            $(this).find('div').stop(false, true);
            $secList.hide();
            $(this).find('div').fadeIn();
        }, function() {
            $secList.hide();
        });

    });
</script>

<script type="text/javascript">

    $(function() {
        $(".searchAll").click(function() {
            var key = $("#siteHeader_txtKey").val();
            if (key == "SEARCH" || key == "")
                alert("Please select the keywords。")
            else
                location.href = "<%=request.getContextPath() %>/index/products/search?key=" + key;

        })
    })
</script>

<script type="text/javascript">
    $(function() {
        var $sdList = $(".sdList");
        $(".navList li").hover(function() {
            $sdList.stop(false, true);
            $(this).find($sdList).slideDown().siblings().find($sdList).slideUp();
            //$(".navList li a").removeClass("has");
            //$(this).children('a').addClass("has");
        }, function() {
            $sdList.stop(false, true);
            $sdList.slideUp();
            //$(".navList li a").removeClass("has");
        });
    });
</script>

<header class="boxShadow">		
	<div class="cw clearfix">
		<a href="<%=request.getContextPath() %>/" class="fl"><img src="<%=request.getContextPath() %>/resources/index/index_files/logo.jpg" width="184"></a>
		<nav class="fl">
			<ul class="navList clearfix">
				<li><a class="" href="<%=request.getContextPath() %>/">Home</a>
				</li>	
				<li><a class="" href="<%=request.getContextPath() %>/index/about/companyprofile">About us</a>
					<dl class="sdList clearfix">
						<dd><a href="<%=request.getContextPath() %>/index/about/companyprofile" class="copy">Company Profile</a></dd>
						<dd><a href="<%=request.getContextPath() %>/index/about/ourculture" class="copy">Our Culture</a></dd>
						<dd><a href="<%=request.getContextPath() %>/index/about/certification" class="copy">Certification</a></dd>
						<dd><a href="<%=request.getContextPath() %>/index/about/businesscustomers" class="copy">Business Customers</a></dd>
						<dd><a href="<%=request.getContextPath() %>/index/about/facility" class="copy">Facility</a></dd>
					</dl>
				</li>									
				<li><a class="copy" href="<%=request.getContextPath() %>/index/products/categorys">Products</a>
					<dl class="sdList clearfix">
							<c:forEach items="${categorys }" var="c">
							 	<dd><a class="copy" href="<%=request.getContextPath() %>/index/products/categorys/${c.id }">${c.name }</a></dd>
							</c:forEach>
					</dl>
				</li>						
				<li><a class="" href="<%=request.getContextPath() %>/index/service/salesmap">Service</a>
					<dl class="sdList clearfix">
						<dd><a href="<%=request.getContextPath() %>/index/service/salesmap" class="copy">Sales Map</a></dd>
						<dd><a href="<%=request.getContextPath() %>/index/service/serviceteam" class="copy">Service Team</a></dd>
					</dl>
				</li>	
				<li><a class="" href="<%=request.getContextPath() %>/index/news/companynews">News</a>
					<dl class="sdList clearfix">
					
					<dd><a class="copy" href="<%=request.getContextPath() %>/index/news/companynews">Company News</a></dd>	
					</dl>
				</li>							
				<li><a class="" href="<%=request.getContextPath() %>/index/contact/location">Contact us</a>
					<dl class="sdList clearfix">
						<dd><a class="copy" href="<%=request.getContextPath() %>/index/contact/location">Location</a></dd>
						<dd><a class="copy" href="<%=request.getContextPath() %>/index/contact/feedback">Online Feedback</a></dd>
					</dl>
				</li>						
			</ul>
		</nav>
		<div class="toolBox fl">
			<div class="languageBox" href="#" style="width:233px;">
				<span style="font-size:small;"><a href="<%=request.getContextPath() %>/index/contact/feedback" style="color:blue;">
				<b>Inquiry Basket(&nbsp;<span id="basketCount"> </span>&nbsp;)</b></a></span>
			</div>				
			<div class="searchBox clearInput">
				<a href="javascript:void()" class="searchBtn searchAll"></a>
				<input name="siteHeader$txtKey" id="siteHeader_txtKey" value="SEARCH" type="text">
			</div>
		</div>
	</div>
</header>

	
<decorator:body>

</decorator:body>	

<!-- Footer -->	
<footer>
	<div class="cw pl70">
		<table class="footerTab" border="0" width="100%">
			<tbody><tr>
				<td style="padding-left:0;">
					<ul class="footerList">
						<li><h3><a href="<%=request.getContextPath() %>/index/about/companyprofile">About us</a></h3></li>
						<li><a href="<%=request.getContextPath() %>/index/about/companyprofile">Company Profile</a></li>
						<li><a href="<%=request.getContextPath() %>/index/about/ourculture">Our Culture</a></li>
						<li><a href="<%=request.getContextPath() %>/index/about/certification">Certification</a></li>
						<li><a href="<%=request.getContextPath() %>/index/about/businesscustomers">Business Customers</a></li>
						<li><a href="<%=request.getContextPath() %>/index/about/facility">Facility</a></li>
					</ul>
				</td>				
				<td>						
					<ul class="footerList">
						<li><h3><a href="<%=request.getContextPath() %>/index/news/companynews">News</a></h3></li>
							<li><a href="<%=request.getContextPath() %>/index/news/companynews">Company News</a></li>
					</ul>
				</td>
				<td>						
					<ul class="footerList">
						<li><h3><a href="<%=request.getContextPath() %>/index/products/categorys">Products</a></h3></li>
							<c:forEach items="${categorys }" var="c">
							 	<li><a href="<%=request.getContextPath() %>/index/products/categorys/${c.id }">${c.name }</a></li>
							</c:forEach>
					</ul>
				</td>
				<td>						
					<ul class="footerList">
						<li><h3><a href="<%=request.getContextPath() %>/index/service/salesmap">Service</a></h3></li>
						<li><a href="<%=request.getContextPath() %>/index/service/salesmap">Sales Map</a></li>
						<li><a href="<%=request.getContextPath() %>/index/service/serviceteam">Service Team</a></li>
					</ul>
				</td>
				<td style="padding-right:0;border:0;">
					<h3>TEL：<span>+86-0574-87642298</span></h3>
					<h3>FAX：<span>+86-0574-87642299</span></h3>
					<h3>E-mail：<a class="a1" >luxtech-joy@nbip.net<br>info@life-tek.com</a></h3>
					<h3>Address：<a class="a1 tdn" href=""> R606.Office Park Building,<br> No.535 Qingshuiqiao Road 
					<br>Ningbo National Hi-tech Zone
Ningbo,<br> China, P.C.315000</a></h3>
				</td>
			</tr>
		</tbody></table>
	</div>
	<div class="footerInfo">
		<div class="cw">
			<p class="tc">CopyRight © 2016 - 2017 LIFE-TECH industry&trading co.,ltd. Ningbo luxtech import&export co.,ltd. All rights Reserved 
			| <a href="<%=request.getContextPath() %>/index/contact/location">Contact</a></p>
		</div>
	</div>	
</footer>
<script type="text/javascript">
setMarket();
</script>
</body></html>