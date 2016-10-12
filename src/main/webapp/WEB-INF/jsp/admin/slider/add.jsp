<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Slider</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">admin</a>
					</li>

					<li><a href="#">Slider</a></li>
					<li class="active">Add</li>
				</ul>
				<!-- /.breadcrumb -->

			</div>


			<sf:form method="post" modelAttribute="slider"
				enctype="multipart/form-data">
				<table class="table">
					<tr id="tr_imgPath">
						<td>image:</td>
						<td><input type="file" name="attach" id="id_imgPath" />1440*400px(Only
							supports jpg png gif format )<span style="color: red">${error}</span></td>
					</tr>
					<tr>
						<td>imgUrl:</td>
						<td><sf:input path="imgUrl"  /></td>
					</tr>
					<tr>
						<td>sortId:</td>
						<td><sf:input path="sortId" /></td>
					</tr>
					<tr>
						<td colspan='2'><a class="btn btn-primary" role="button"
							style="margin-left: 20px"
							href="<%=request.getContextPath()%>/admin/slider/list">Cancel</a>
							<input class="btn btn-primary" style="margin-left: 80px"
							type="submit" value="Add" /></td>
					</tr>
				</table>
			</sf:form>
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->


</body>
</html>