$().ready(function(){
	//获得测试数据集，
	var d = example.data;
	//将列表放入的位置，默认就写这个就可以了
	var $where = $("#MsgId");
	//构建块形列表
	CreatList.msg($where,"all",example.data);

	/*使用的时候，上面几行都不要写直接写下面的*/
	//CreatList.init("all",0);//参数为列表的类型[全部信息，活动信息，投票信息。。。]
});

var CreatList={
	init:function(type,p){
		//type 信息类型  ，p 从第几页开始
		//此处写通过Ajax得到分页的数据内容；
		/*$.ajax({
			url:.....
			success:function(result){
				CreatList.msg($where,type,result.data);
			}
		})*/
		console.log("你已经重新刷新了列表，type:"+type);
	},
	msg:function($w,type,d){
		var model = MSGmodel.namol;
		var str = "", pgStr = "";
		for(var i=0; i<d.list.length; i++){
			str += model;
			var liStr = "";
			if(i+1 == d.curent){
				liStr = '<li><span class="active">'+(i+1)+'</span></li>';
			}else{
				liStr = '<li><a href="javascript:void(0);" class="paginaList" data-pag="'+i+'">'+(i+1)+'</a></li>';
			}
			pgStr += liStr;
		}

		$w.html(str);
		$(".pagination ul").html(pgStr);
		$(".paginaList").on("click.p",function(){
			pageNum = $(this).data("pag");
			console.log(pageNum);
			//这个是分页的
			CreatList.init("all");
		});
	}
}

var MSGmodel={
	namol:'<li class="span4">'+
            '<div class="inner">'+
                '<div class="preview-box">'+
                     '<blockquote>{content}...</blockquote>'+
                '</div>'+
                '<a class="preview-mask" href="#"></a>'+
                '<h5>'+
                    '<a href="#">{title}</a>'+
                '</h5>'+
                '<div class="info">'+
                    '<span class="author-info">'+
                        '<div class="author-name">{author}</div>'+
                    '</span>'+
                    '<span class="opts">'+
                        '<a href="javascript:void(0);">'+
                           ' <span >{date}</span>'+
                        '</a>'+
                    '</span>'+
                '</div>'+
            '</div>'+
        '</li>',
	img:"",
	self:""
};


//测试数据
var example = {
		data:{
			//信息列表
			list:[{
				title:"张三发布的信息1",
				content:"这是一篇由张三发布的信息1，里面包括了...",
				author:"张三",
				date:"2015-03-05"
			},{
				title:"张三发布的信息2",
				content:"这是一篇由张三发布的信息2，里面包括了...",
				author:"张三",
				date:"2015-03-05"
			}],
			curent:1,//当前第几页
			pg:3 //共有三页内容
		},
		others:""
	}