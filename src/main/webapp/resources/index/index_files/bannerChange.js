$(function(){
	var $banner = $(".banner");
	var len = $banner.length;
	var num = 1;
	var autoSpeed = 4000;
	
	//���� bannerBox ���ٸ���ͼƬ���������� ico
	$(".bannerBox").append("<div class='bannerIco'>");		
	for(var i=0;i<len;i++){
		$(".bannerIco").append("<a href='javascript:;'></a>");
	}
	
	var $ico = $(".bannerIco a");
	changeFun(0);
	
	//��껬����ֹͣ autoPlay
	$ico.mouseover(function(){
		clearInterval(auto);
		
		var index = $ico.index($(this));
		num = index+1;
		
		$banner.stop(false,true);
		changeFun(index);
	});
	
	$ico.mouseout(function(){
		auto = setInterval(autoPlay,autoSpeed);
	});
	
	//�ж�ͼƬ�����Ƿ���� 1 ��������� 1 �����Զ�����
	if(len>1){auto = setInterval(autoPlay,autoSpeed);}		
	
	function autoPlay(){
		if(num<len){								
			changeFun(num);
			num++;
		}else{num=0;}
	}
	
	//����Ч��
	function changeFun(num){
		$banner.fadeOut(1000).eq(num).fadeIn(1500);
		$ico.removeClass("cur").eq(num).addClass("cur");
	}
	
});