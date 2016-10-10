$(function(){
	var $banner = $(".banner");
	var len = $banner.length;
	var num = 1;
	var autoSpeed = 4000;
	
	//生成 bannerBox ，再根据图片的数量生成 ico
	$(".bannerBox").append("<div class='bannerIco'>");		
	for(var i=0;i<len;i++){
		$(".bannerIco").append("<a href='javascript:;'></a>");
	}
	
	var $ico = $(".bannerIco a");
	changeFun(0);
	
	//鼠标滑过，停止 autoPlay
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
	
	//判断图片数量是否大于 1 ，如果大于 1 ，则自动滚动
	if(len>1){auto = setInterval(autoPlay,autoSpeed);}		
	
	function autoPlay(){
		if(num<len){								
			changeFun(num);
			num++;
		}else{num=0;}
	}
	
	//滚动效果
	function changeFun(num){
		$banner.fadeOut(1000).eq(num).fadeIn(1500);
		$ico.removeClass("cur").eq(num).addClass("cur");
	}
	
});