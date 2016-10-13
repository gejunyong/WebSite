<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布报文</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">admin</a>
							</li>

							<li>
								<a href="#">About</a>
							</li>
							<li>
								<a href="#">Certification</a>
							</li>
							<li class="active">udpate</li>
						</ul><!-- /.breadcrumb -->

					</div>

			<sf:form method="post" modelAttribute="t"
				enctype="multipart/form-data">
				<table class="table">
					<tr id="tr_imgPath">
						<td>image:</td>
						<td><input type="file" name="attach" id="id_imgPath" />(Only
							supports jpg png gif format )<span style="color: red">${error}</span></td>
					</tr>
					<tr>
						<td>imgName:</td>
						<td><sf:input path="imgName"  /></td>
					</tr>
					<tr>
						<td>sortId:</td>
						<td><sf:input path="sortId" /></td>
					</tr>
					<tr>
						<td colspan='2'><a class="btn btn-primary" role="button"
							style="margin-left: 20px"
							href="<%=request.getContextPath()%>/admin/about/certification/list">Cancel</a>
							<input class="btn btn-primary" style="margin-left: 80px"
							type="submit" value="Update" /></td>
					</tr>
				</table>
			</sf:form>



					</div><!-- /.page-content -->
			</div><!-- /.main-content -->

</body>
</html>