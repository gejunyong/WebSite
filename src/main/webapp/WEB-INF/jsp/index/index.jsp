<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
</head>
<body>
	<section>
	<div class="bannerBox">
		<c:forEach items="${sliders}" var="s">z
			<a href="${s.imgUrl }" target="_blank" class="banner"
			style="background-image: url(<%=request.getContextPath() %>${s.imgPath });">
			</a>
		</c:forEach>
	</div>

	<div class="boxList boxShadow">
		<div class="cw clearfix">
			<div class="box">
				<div class="clearfix">
					<div class="fr">
						<h3>Our Company</h3>
						<p>
							<a
								href="<%=request.getContextPath()%>/index/about/companyprofile">Our
								Company is a medical instrument...</a>
						</p>
					</div>
					<a href="<%=request.getContextPath()%>/index/about/companyprofile"
						class="fl"><img
						src="<%=request.getContextPath()%>/resources/index/index_files/img1.jpg"
						alt=""></a>
				</div>
			</div>
			<div class="box">
				<div class="clearfix">
					<div class="fr">
						<h3>Our Products</h3>
						<p>
							<a href="">Our aim is providing innovative&amp;humanized...</a>
						</p>
					</div>
					<a href="" class="fl"><img
						src="<%=request.getContextPath()%>/resources/index/index_files/img2.jpg"
						alt=""></a>
				</div>
			</div>
			<div class="box">
				<div class="clearfix">
					<div class="fr">
						<h3>Our Services</h3>
						<p>
							<a href="<%=request.getContextPath()%>/index/service/salesmap">Company-products
								are available in almost...</a>
						</p>
					</div>
					<a href="<%=request.getContextPath()%>/index/service/salesmap"
						class="fl"><img
						src="<%=request.getContextPath()%>/resources/index/index_files/img3.jpg"
						alt=""></a>
				</div>
			</div>
		</div>

	</div>

	</section>

</body>
</html>