i=0;
//banner===================================
//轮播
//点播
$('.banner ul.dian1 li').click(function(){
	$('.banner .tupian1').stop();
	i=$(this).index();
	$('.banner .tupian1').animate({'left':-i*window.outerWidth},500);
	$(this).addClass('col').siblings().removeClass('col');
});
//自动
t=setInterval(function(){
	if(i==4){
		i=0;
	}
	$('.banner .tupian1').animate({'left':-i*window.outerWidth},500);
	$('.banner ul.dian1 li').eq(i).addClass('col').siblings().removeClass('col');
	i++;
},2000);
//hover停止
$('.banner').hover(function(){
	clearInterval(t);
},function(){
	t=setInterval(function(){
	if(i==4){
		i=0;
	}
	$('.banner .tupian1').animate({'left':-i*window.outerWidth},500);
	$('.banner ul.dian1 li').eq(i).addClass('col').siblings().removeClass('col');
	i++;
},2000);
});
//基地项目======================================================================
//轮播
//点播
j=0;
$('.Tplink .lists ul li').hover(function(){
	$('.Tplink ul.tk').stop();
	j=$(this).index();
	$('.Tplink ul.tk').animate({'left':-1350*j},500);
	$('.Tplink .lists ul li').eq(j).addClass('col2').siblings().removeClass('col2');
});
//自动
p=setInterval(function(){
	if(j==3){
		j=0;
	}
	$('.Tplink ul.tk').animate({'left':-1350*j},500);
	j++;
},2000);
//hover停止
$('.Tplink').hover(function(){clearInterval(p);},
function(){
	p=setInterval(function(){
	if(j==3){
		j=0;
	}
	$('.Tplink ul.tk').animate({'left':-1350*j},500);
	j++;
},2000);
});
//信息公告=====================================================
$('.timew .timewul').click(function(){
	i=$(this).index();
	$('.timew .timewul').animate({'left':-1350},500);
	$('.plable').addClass('lanquan');
	$('.lablet').removeClass('lanquan');
})
$('.lablet').click(function(){
//	ne=$(this).index();
//	alert(ne);
	$('.timew .timewul').animate({'left':0},500);
	$('.lablet').addClass('lanquan');
	$('.plable').removeClass('lanquan');
})
//member=======================================================
$('.plables').click(function(){
    
	$('.pmemberw .pmemberwul').animate({'left':-1350},500);
	$('.plables').addClass('lanquans');
	$('.lablets').removeClass('lanquans');
})
$('.lablets').click(function(){
//	ne=$(this).index();
//	alert(ne);
	$('.pmemberw .pmemberwul').animate({'left':0},500);
	$('.lablets').addClass('lanquans');
	$('.plables').removeClass('lanquans');
})