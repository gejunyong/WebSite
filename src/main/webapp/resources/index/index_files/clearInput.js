jQuery(function(){
	var aArray = new Array();//新建数组
	var obj = jQuery(".clearInput input,.clearInput textarea");
	
	//初始颜色
	//obj.css("color","#cccccc");
	
	//将input中的内容存入数组中			
	for(var i = 0;i<obj.length;i++){
		aArray.push(obj.eq(i).val());
	}
	
	//获得焦点
	obj.focus(function(){
		var index = obj.index(jQuery(this));
		if(jQuery(this).val() == aArray[index]){
			jQuery(this).val("");
			//jQuery(this).css("color","#333");
		}
	});
	
	//失去焦点
	obj.blur(function(){
		var index = obj.index(jQuery(this));
		if(jQuery(this).val() == ""){
			jQuery(this).val(aArray[index]);
			//jQuery(this).css("color","#cccccc");
		}
	});	
	
});