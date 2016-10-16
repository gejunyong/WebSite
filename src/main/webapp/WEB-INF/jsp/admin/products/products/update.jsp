<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Products</title>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/assets/zTree/js/jquery.ztree.all.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/assets/zTree/css/metroStyle.css" />

<style type="text/css">
.tree {
    min-height:20px;
    padding:19px;
    margin-bottom:20px;
    background-color:#fbfbfb;
    border:1px solid #999;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05)
}
.tree li {
    list-style-type:none;
    margin:0;
    padding:10px 5px 0 5px;
    position:relative
}
.tree li::before, .tree li::after {
    content:'';
    left:-20px;
    position:absolute;
    right:auto
}
.tree li::before {
    border-left:1px solid #999;
    bottom:50px;
    height:100%;
    top:0;
    width:1px
}
.tree li::after {
    border-top:1px solid #999;
    height:20px;
    top:25px;
    width:25px
}
.tree li span {
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
    border:1px solid #999;
    border-radius:5px;
    display:inline-block;
    padding:3px 8px;
    text-decoration:none
}
.tree li.parent_li>span {
    cursor:pointer
}
.tree>ul>li::before, .tree>ul>li::after {
    border:0
}
.tree li:last-child::before {
    height:30px
}
.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
    background:#eee;
    border:1px solid #94a0b4;
    color:#000
}
</style>
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
					<li><a href="#">Products</a></li>
					<li class="active">update</li>
				</ul>
				<!-- /.breadcrumb -->

			</div>


			<sf:form method="post" modelAttribute="t"
				enctype="multipart/form-data">
				<table class="table">
				 <tr><td>pId:</td><td>

<sf:input id="pid" path="pId" style="display:none;width:150px;"/>
<input id="citySel" style="width:150px;" onclick="showMenu();" />
		<div id="menuContent" class="menuContent" style="display:none; position: absolute;background:#CEEEFF;z-index: 99999">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>

					 </td></tr>
					<tr id="tr_imgPath">
						<td>title:</td>
						<td><sf:input path="title"  style="width:748px"/></td>
					</tr>
					<tr id="tr_imgPath">
						<td>old image:</td>
						<td><img alt="img" src="<%=request.getContextPath()%>/${t.imgPath }"></td>
					</tr>
					<tr id="tr_imgPath">
						<td>image:</td>
						<td><input type="file" name="attach" id="id_imgPath" />
						(Only supports jpg png gif format )
						<span style="color: red">${error}</span>
						</td>
					</tr>
					<tr>
						<td>content:</td>
						<td><sf:textarea id="editor" path="content" type="text/plain" style="width:748px;height:400px;"></sf:textarea></td>
					</tr>
					<tr>
						<td colspan='2'><a class="btn btn-primary" role="button"
							style="margin-left: 300px"
							href="<%=request.getContextPath()%>/admin/products/products/list">Cancel</a>
							<input class="btn btn-primary" style="margin-left: 80px"
							type="submit" value="Update" />&nbsp;&nbsp;<span style="color: red">${nodeerror}</span></td>
					</tr>
				</table>
			</sf:form>
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->

			<script type="text/javascript">
		    //实例化编辑器
		    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('editor');
			var lang = ue.getOpt('lang');
			</script>
			
			<script type="text/javascript">
			var setting = {
					check: {
						enable: true,
						chkStyle: "radio",
						radioType: "all"
					},
					view: {
						dblClickExpand: false
					},
					data: {
						simpleData: {
							enable: true
						}
					},
					callback: {
						onClick: onClick,
						onCheck: onCheck
					}
				};

				var dataStr;
				$.ajaxSettings.async = false;
				$.getJSON("<%=request.getContextPath()%>/admin/products/category/getList",function(data){
					 dataStr=data;
				});
				var zNodes =dataStr;

				function onClick(e, treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					zTree.checkNode(treeNode, !treeNode.checked, null, true);
					return false;
				}

				function onCheck(e, treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
					nodes = zTree.getCheckedNodes(true),
					v = "",
					pid="";
					for (var i=0, l=nodes.length; i<l; i++) {
						v += nodes[i].name + ",";
						pid+=nodes[i].id+","
					}
					if (v.length > 0 ){
						v = v.substring(0, v.length-1);
						pid =pid.substring(0, pid.length-1);
					}
					var cityObj = $("#citySel");
					cityObj.attr("value", v);
					$("#pid").attr("value", pid);
				}

				function showMenu() {
					var cityObj = $("#citySel");
					var cityOffset = $("#citySel").offset();
					$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

					$("body").bind("mousedown", onBodyDown);
				}
				function hideMenu() {
					$("#menuContent").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown);
				}
				function onBodyDown(event) {
					if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
						hideMenu();
					}
				}

				$(document).ready(function(){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
					onCheckSet();
				});
				
				
				function onCheckSet() {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					var i=parseInt("${t.pId}");
					var node = zTree.getNodeByParam("id",i, null);
					$("#citySel").attr("value",node.name);
					$("#pid").attr("value","${t.pId}");
				}
			</script>
</body>
</html>