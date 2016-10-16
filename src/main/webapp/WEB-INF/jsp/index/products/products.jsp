<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Products</title>
</head>
<body>
		<section>
		<div class="cw">
			<img src="<%=request.getContextPath() %>/resources/index/index_files/products.jpg" class="banner pt15" height="80" width="980">
			<div class="clearfix main">
			
			
				<div class="content fr pt20">
					
					<h3 class="proTit">${cur.name}</h3>
					
					<div class="proCon mt10">
						<div id="divIntro" class="linear">
						</div>
	
        	    <div style="">
						<ul class="proList2 clearfix pdt1">
        	      
        	        <c:forEach items="${ps }" var="p">
        	          <li>
								<a href="<%=request.getContextPath() %>/index/products/detail/${p.id }"><img width="218px" height="117px" src="<%=request.getContextPath() %>/${p.imgPath }"></a>
								<p><a href="<%=request.getContextPath() %>/index/products/detail/${p.id }">${p.title}</a></p>
					 </li>
					 </c:forEach>
    
			</ul>
			</div>
 
					</div>
					
					
					
					
				</div>
				<!-- sidebar -->
				

<div class="sidebar fl">
	<h3>Products</h3>
	<ul class="list">
		<c:forEach items="${categorys }" var="c">
			<c:if test="${cur.id eq c.id }">
			<li><a class="cur" href="<%=request.getContextPath() %>/index/products/categorys/${c.id }">${c.name }</a></li>
			</c:if>
			<c:if test="${cur.id ne c.id }">
			<li><a  href="<%=request.getContextPath() %>/index/products/categorys/${c.id }">${c.name }</a></li>
			</c:if>
		</c:forEach>
	</ul>
	
	
<!-- common -->
<script type="text/javascript">
    $(function() {
    $(".searchPro").click(function() {

    var key = $("#siteSidebar_commonBody_txtKeyp").val();
            if (key == "SEARCH" || key == "")
                alert("Please select the keywords。")
            else
            	 location.href = "<%=request.getContextPath() %>/index/products/search?key=" + key;

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