
var CreatList={
	init:function(type,p){
		//type 信息类型  ，p 从第几页开始
		//此处写通过Ajax得到分页的数据内容；
		var $where = $("#MsgId");
		$.ajax({
			url:"/property-sys/property-sys/articleAction!list.action",
			data : {
				type : type,
				currentPage : p+1
			},
			type:"post",
			success:function(result){
				CreatList.msg($where,type,result.msg.data);
			}
		})
		console.log("你已经重新刷新了列表，type:"+type);
	},
	msg:function($w,type,d){
		var str = "", pgStr = "";
		for(var i=0; i<d.list.length; i++){//数据
			var item = d.list[i];
			var model = MSGmodel.namol;
			var content=item.content;
			var lengthLimit=100;
			if(content.length>lengthLimit){
				content=content.substring(0,lengthLimit)+"...";
			}
			model = model.replace(/{title}/g, item.title)
				.replace(/{content}/g, content)
				.replace(/{author}/g, item.author)
				.replace(/{date}/g, item.date);
			str += model;
			
		}
		for(var i=0; i<d.pg; i++){//页码
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
			//console.log(pageNum);
			//这个是分页的
			CreatList.init(type,pageNum);
		});
	}
}

var MSGmodel={
	namol:'<li class="span4">'+
            '<div class="inner">'+
                '<div class="preview-box">'+
                     '<blockquote>{content}</blockquote>'+
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


//模块html加载
function changeMainPanel(pname){
    $.ajax({
        url:"modules/"+pname+".html",
        dataType:"html",
        type:"get",
        cache:true,
        success:function(result){
            $("#main-panel").html(result);
        },error:function(){
        	alert("404");
        }
    });
}