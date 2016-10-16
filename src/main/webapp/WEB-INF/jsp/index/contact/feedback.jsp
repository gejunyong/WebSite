<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>feedback</title>
<script type="text/javascript">

    function checkForm(){
        	
        var i = 0;
        var iAlert = "";

        if ($("#txtType").val() == "") {
            i = i + 1;
            iAlert += "   " + i + " Please input Enquiry Type \n";
        } 
        if ($("#txtName").val() == "") {
            i++;
            iAlert += "   " + i + " Please input Your Name \n";
        }
        if ($("#txtTel").val() == "") {
            i = i + 1;
            iAlert += "   " + i + " Please input Telephone \n";
        }

        if ($("#txtCome").val() == "") {
            i++;
            iAlert += "   " + i + " Please input Your Company \n";
        }
        if ($("#txtEmail").val() == "") {
            i = i + 1;
            iAlert += "   " + i + " Please input Email \n";
        }
        else if (!isEmail($("#txtEmail").val())) {
            i = i + 1;
            iAlert += "   " + i + " Message format errors, you must include the @ symbol and.  \n";
        }
        if ($("#txtContents").val() == "(Less than 1000 Words）") {
            i++;
            iAlert += "   " + i + "  Please input Enquiry \n";
        }
        if (iAlert != "") {
            alert("Please confirm input \n" + iAlert);
            return false;
        }
        
        var ltmarket = getCookie("ltmarket");
	    var newStr='';
		var ca = ltmarket.split(',');
	    for(var i=0; i<ca.length-1; i++) {
	        var c = ca[i];
	        var p=c.split('|');
	        newStr=newStr+p[0]+',';
	    }
	    $("#inqProducts").val(newStr);
    }
    
 
    function isEmail(email) {   

        if (email.search(/^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/)!= -1){
        redflag=0;
        return true;   
        }
        else{   
        redflag=1;
        return false;
        }

     }
</script>
</head>
<body>
		<section>
		<div class="cw">
			<img src="<%=request.getContextPath() %>/resources/index/index_files/contact.jpg" class="banner pt15" height="80" width="980">
			<div class="clearfix main">
			
						<div class="content fr pt40">
					
					<div class="onlineBody clearInput">
						<h6 class="col666 pb10 mb5 f14">Inquiry information：</h6>
						<div class="onlineList clearfix linear">
							<table id="inquiryTable" align="left">
							
							
							</table>
						</div>
					
				 	<sf:form id="inqForm" method="post" modelAttribute="inquiry">
						<table cellspacing="0" cellpadding="0" border="0">						    
							<tbody><tr>
								<th>Subject：</th>
								<td><sf:input path="subject" name="txtTitle" id="txtTitle" class="olTxt" type="text"/></td>
								<th><em>*</em>Enquiry Type：</th>
								<td><sf:input path="enquiryType" name="txtType" id="txtType" class="olTxt" type="text"/></td>
							</tr>
							<tr>
								<th><em>*</em>Your Name：</th>
								<td><sf:input path="name" name="txtName" id="txtName" class="olTxt" type="text"/></td>
								<th><em>*</em>Telephone：</th>
								<td><sf:input path="phone" name="txtTel" id="txtTel" class="olTxt" type="text"/></td>
							</tr>
							<tr>
								<th><em>*</em>Your Company：</th>
								<td><sf:input path="company" name="txtCome" id="txtCome" class="olTxt" type="text"/></td>
								<th><em>*</em>E-mail：</th>
								<td><sf:input path="email" name="txtEmail" id="txtEmail" class="olTxt" type="text"/></td>
							</tr>
							<tr>
								<th>Your Country/Region	：</th>
								<td colspan="3"><sf:input path="country" name="txtAddress" id="txtAddress" class="olTxt" type="text"/></td>
							</tr>
							<tr>
								<th><em>*</em>Enquiry：</th>
								<td colspan="3"><sf:textarea path="enquiry" name="txtContents" id="txtContents" class="olTxt textarea"></sf:textarea>
								<br>
								<sf:input style="display:none" path="inqProducts" id="inqProducts" />
								</td>
							</tr>
							<tr>
								<th></th>
								<td colspan="3">
								<input onclick="return checkForm();" class="pr10" src="<%=request.getContextPath() %>/resources/index/index_files/btn1.jpg" style="border-width:0px;" type="image"/>

								<a href="">
								<img src="<%=request.getContextPath() %>/resources/index/index_files/btn2.jpg"></a>
								</td>
							</tr>
						</tbody>
						</table>
						</sf:form>
						
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
    var ltmarket = getCookie("ltmarket");
	var ca = ltmarket.split(',');
	if(ca.length>1){
		var html='<tr><td>image</td><td>title</td><td>ID</td><td>Del</td></tr>';
	    for(var i=0; i<ca.length-1; i++) {
	        var c = ca[i];
	        var p=c.split('|');
			html=html+'<tr><td><img height="50px" weight="70px" src="<%=request.getContextPath() %>/'+p[2]+'">'
			+'</img></td><td><a href="<%=request.getContextPath() %>/index/products/detail/'+p[0]+'" target="_blank">'+p[1]+'</A></td><td>'+p[0]+'</td><td><a href="#" onclick="beginDel('+p[0]+')"><img src="<%=request.getContextPath() %>/resources/index/index_files/delete.png"></img></a></td></tr>';
	    }
		$('#inquiryTable').html(html);
	}
	function beginDel(id){
	    var ltmarket = getCookie("ltmarket");
	    var newStr='';
		var ca = ltmarket.split(',');
	    for(var i=0; i<ca.length-1; i++) {
	        var c = ca[i];
			if(c.indexOf(id)==0){
				
			}else{
				newStr=newStr+c+',';
			}	
	    }
	    setCookie("ltmarket",newStr, 1);
		location.reload();
	}
	</script>
</body>
</html>