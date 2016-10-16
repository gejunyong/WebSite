<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Products</title>
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
			<img src="<%=request.getContextPath() %>/resources/index/index_files/products.jpg" class="banner pt15" height="80" width="980">
			<div class="clearfix main">
			
			
				<div class="content fr pt20">
					
					<h3 class="proTit">${p.title }
					<input name="hidTitle" id="hidTitle" value="${p.title }" type="hidden">
					</h3>

					<div class="proCon mt10">
						
						<div class="pt20">
							<table border="0">
								<tbody><tr>
									<td width="624">
									<li class="certList1">
									<a class="cboxElement" href="<%=request.getContextPath() %>/${p.imgPath }">
									<img width="500px" height="270px" src="<%=request.getContextPath() %>/${p.imgPath }">
									</a>
									</li>
									</td>
									<td style="vertical-align:top;">
									<a href="javascript:" onclick="addCart('${p.id}','${p.title }','${p.imgPath }')">
									<img src="<%=request.getContextPath() %>/resources/index/index_files/cart_add.png">
									</a>
									<br>
									</td>
								</tr>
							</tbody></table>
						</div>
						
						<div class="pb10 pt30">
						  ${p.content }
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
<script>
function addCart(id,name,path) {
    var ltmarket = getCookie("ltmarket");
    var count=0;
//This item was already in your inquiry basket！
	var ca = ltmarket.split(',');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
		if(c.indexOf(id)==0)
			count=1;
    }
    
	if(count==0){
		setCookie("ltmarket", ltmarket+id+"|"+name+"|"+path+",", 1);
		alert("1 item added to inquiry basket");
	}else{
		alert("This item was already in your inquiry basket！");
	}
	setMarket();
}
</script>
</body>
</html>