<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Company Profile</title>
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
								<a href="#">About us</a>
							</li>
							<li class="active">Company Profile</li>
						</ul><!-- /.breadcrumb -->

					</div>


<sf:form method="post" modelAttribute="p" enctype="multipart/form-data">
	    <table class="table" style="width:750px;margin-left: 50px;text-align:center;" >
	    <tr>
	    <td style="font-size: large;">Content</td>
	    <td>
	    </td>
	    
	    <tr>
	    <td>
	    <sf:textarea id="editor" path="content" type="text/plain" style="width:748px;height:400px;"></sf:textarea>
	    </td>
	    </tr>
		<tr><td>
		<input  class="btn btn-primary" type="submit" value="修改"/>
		</td></tr>
		</table>
</sf:form>



					</div><!-- /.page-content -->
			</div><!-- /.main-content -->
			
			
			<script type="text/javascript">
		    //实例化编辑器
		    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('editor');
			var lang = ue.getOpt('lang');
			</script>
</body>
</html>