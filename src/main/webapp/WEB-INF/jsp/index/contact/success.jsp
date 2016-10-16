<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>feedback</title>
</head>
<body>
		<section>
		<div class="cw">
			<img src="<%=request.getContextPath() %>/resources/index/index_files/contact.jpg" class="banner pt15" height="80" width="980">
			<div class="clearfix main">
			
						<div class="content fr pt40">
					
					<div class="onlineBody clearInput">
						<h6 class="col666 pb10 mb5 f14">Inquiry success</h6>
						<img alt="success" src="<%=request.getContextPath() %>/resources/index/index_files/success.png">

					</div>
					
				</div>
				<!-- sidebar -->
				

<div class="sidebar fl">
	<h3>Contact us</h3>
	<ul class="list">
		<li><a class="" href="<%=request.getContextPath() %>/index/contact/location">Location</a></li>
		<li><a class="cur" href="<%=request.getContextPath() %>/index/contact/feedback">Online Feedback</a></li>
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
	<script type="text/javascript">
	clearCookie("ltmarket");
	</script>
</body>
</html>