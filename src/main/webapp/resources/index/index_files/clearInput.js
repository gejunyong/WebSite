jQuery(function(){
	var aArray = new Array();//�½�����
	var obj = jQuery(".clearInput input,.clearInput textarea");
	
	//��ʼ��ɫ
	//obj.css("color","#cccccc");
	
	//��input�е����ݴ���������			
	for(var i = 0;i<obj.length;i++){
		aArray.push(obj.eq(i).val());
	}
	
	//��ý���
	obj.focus(function(){
		var index = obj.index(jQuery(this));
		if(jQuery(this).val() == aArray[index]){
			jQuery(this).val("");
			//jQuery(this).css("color","#333");
		}
	});
	
	//ʧȥ����
	obj.blur(function(){
		var index = obj.index(jQuery(this));
		if(jQuery(this).val() == ""){
			jQuery(this).val(aArray[index]);
			//jQuery(this).css("color","#cccccc");
		}
	});	
	
});