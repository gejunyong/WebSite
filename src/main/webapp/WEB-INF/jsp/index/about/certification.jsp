<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Certification</title>
    <script type="text/javascript">
        $(function() {
            $(".certList1 a").colorbox({maxWidth:"100%"});
            $(".certList2 a").colorbox({maxWidth:"100%"});
        });
    </script>
</head>
<body>
		<section>
		<div class="cw">
			<img src="<%=request.getContextPath() %>/resources/index/index_files/about.jpg" class="banner pt15" height="80" width="980">
			<div class="clearfix main">
			
				<div class="content fr pt40">
					
					<div class="pl30">
						<ul class="certList certList1 clearfix">
						
						<c:set var="sliderNum" value="0" />
						
							<c:forEach items="${p}" var="cs">
							<c:if test="${sliderNum ne 3 }">
								 <li>
									<a href="<%=request.getContextPath() %>${cs.imgPath }" class="cboxElement">
									<img src="<%=request.getContextPath() %>${cs.imgPath }"  width="120"  height="150"/>
									</a>
									<p>${cs.imgName}</p>
								 </li>
								 <c:set var="sliderNum" value="${sliderNum+1}" />
							 </c:if>
							 <c:if test="${sliderNum eq 3 }">
							 	<li>
									<a href="<%=request.getContextPath() %>${cs.imgPath }" class="cboxElement">
									<img src="<%=request.getContextPath() %>${cs.imgPath }" width="120"  height="150"/>
									</a>
									<p>${cs.imgName}</p>
								 </li>
								 <c:set var="sliderNum" value="0" />
								</ul>
								<ul class="certList certList1 clearfix">
							 </c:if>
							</c:forEach>

						</ul>
					</div>
					
				</div>
				<!-- sidebar -->
				

<div class="sidebar fl">
	<h3>About us</h3>
	<ul class="list">
		<li><a class="" href="<%=request.getContextPath() %>/index/about/companyprofile">Company Profile</a></li>
		<li><a class="" href="<%=request.getContextPath() %>/index/about/ourculture">Our Culture</a></li>
		<li><a class="cur" href="<%=request.getContextPath() %>/index/about/certification">Certification</a></li>
		<li><a class="" href="<%=request.getContextPath() %>/index/about/businesscustomers">Business Customers</a></li>
		<li><a class="" href="<%=request.getContextPath() %>/index/about/facility">Facility</a></li>
	</ul>
	
	
<!-- common -->
<script type="text/javascript">
    $(function() {
    $(".searchPro").click(function() {

    var key = $("#siteSidebar_commonBody_txtKeyp").val();
            if (key == "SEARCH" || key == "")
                alert("Please select the keywords。")
            else
                location.href = "/en/product/search.aspx?keyp=" + key;

        })
    })
</script>
<div class="pl20">
		<a href="<%=request.getContextPath() %>/index/contact/location" title="Contact us"><img src="<%=request.getContextPath() %>/resources/index/index_files/tel.jpg" class="pt20" height="28" width="162"></a>
		<h4 class="conTit1 mt20" style="padding-bottom:0;">Product Search</h4>
		<div class="searchBox clearInput proSearchBox">
			<a href="#" class="searchBtn searchPro"></a>
			<input name="siteSidebar$commonBody$txtKeyp" id="siteSidebar_commonBody_txtKeyp" value="SEARCH" type="text">
		</div>
		<img src="<%=request.getContextPath() %>/resources/index/index_files/local.jpg" class="pt20">
</div>
	
</div>
				
			</div>
		</div>		
	</section>
</body>
</html>