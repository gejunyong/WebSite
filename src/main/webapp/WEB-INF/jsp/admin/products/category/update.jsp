<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Catepory</title>
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
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Admin</a>
							</li>

							<li>
								<a href="#">Products</a>
							</li>
							<li class="active">Catepory</li>
							<li class="active">Update</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<div class="page-content">
						</div><!-- /.ace-settings-container -->

						<div class="row">
							<div class="col-xs-12">
								　<div id="menuContent" class="menuContent" style="float:left;width:30%;border:1px solid rgb(170,170,170);z-index:10;">
								      <ul id="treeDemo" class="ztree" style="margin-top:0; width:100%; height:auto;"></ul>
								  </div>
								  <div id="content" class="menuContent" style="float:left;width:69%;border:1px solid rgb(170,170,170);z-index:10;">
									
												<sf:form method="post" modelAttribute="t"
												enctype="multipart/form-data">
												<table class="table">
													    <tr><td>pId:</td><td>
													    <sf:select path="pId"  cssStyle="width:100px">
													    	<c:forEach items='${categorys }' var='c'>
													    		<sf:option value="${c.id }" label="${c.name }"/> 
													    	</c:forEach>
												        </sf:select>  
												        </td></tr>
												
													<tr>
													<td>Name:</td>
														<td><sf:input path="name"  /></td>
													</tr>
													<tr><td>oldImage:</td><td><img width="330px" height="126px" src="<%=request.getContextPath()%>/${t.imgPath }"></td></tr>
													<tr id="tr_imgPath">
														<td>image:</td>
														<td><input type="file" name="attach" id="id_imgPath" />(Only
															supports jpg png gif format )<span style="color: red">${error}</span></td>
													</tr>
													<tr>
														<td>sortId:</td>
														<td><sf:input path="sortId" /></td>
													</tr>
													<tr>
														<td colspan='2'><a class="btn btn-primary" role="button"
															style="margin-left: 20px"
															href="<%=request.getContextPath()%>/admin/products/category/list">Cancel</a>
															<input class="btn btn-primary" style="margin-left: 80px"
															type="submit" value="Add" />&nbsp;&nbsp;<span style="color: red">${nodeerror}</span>
															</td>
													</tr>
												</table>
											</sf:form>
									
								  </div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
			</div><!-- /.main-content -->

<script type="text/javascript">
var setting = {
	    view: {
	        addHoverDom: addHoverDom,
	        removeHoverDom: removeHoverDom,
	        selectedMulti: false
	    },
	    data: {
	        simpleData: {
	            enable: true
	        }
	    },
	    edit: {
	        enable: false
	    }
	};

var dataStr;
$.ajaxSettings.async = false;
$.getJSON("<%=request.getContextPath()%>/admin/products/category/getList",function(data){
	 dataStr=data;
});
	var zNodes =dataStr;

	$(document).ready(function () {
	    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});

	function addHoverDom(treeId, treeNode) {
	    var sObj = $("#" + treeNode.tId + "_span");
	    if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
	    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
	        + "' title='add node' onfocus='this.blur();'></span>"
	        +"<span class='button edit' id='editBtn_" + treeNode.tId
	        + "' title='edit node' onfocus='this.blur();'></span>"
	        +"<span class='button remove' id='removeBtn_" + treeNode.tId
	        + "' title='remove node' onfocus='this.blur();'></span>";
	    sObj.after(addStr);
	    //add
	    var btn = $("#addBtn_" + treeNode.tId);
	    if (btn) btn.bind("click", function () {
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        location.href="add?pid="+treeNode.id;
	        //alert('add:'+treeNode.id);
	        return false;
	    });
	    //edit
	    var editbtn = $("#editBtn_" + treeNode.tId);
	    if (btn) editbtn.bind("click", function () {
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        location.href="update?id="+treeNode.id;
	        //alert('edit:'+treeNode.id);
	        return false;
	    });
	    //del
	    var removebtn = $("#removeBtn_" + treeNode.tId);
	    if (btn) removebtn.bind("click", function () {
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        location.href="delete?id="+treeNode.id;
	        //alert('del:'+treeNode.id+treeNode.name);
	        return false;
	    });
	};
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_" + treeNode.tId).unbind().remove();
	    $("#editBtn_" + treeNode.tId).unbind().remove();
	    $("#removeBtn_" + treeNode.tId).unbind().remove();
	};
</script>
</body>
</html>