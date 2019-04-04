$(function(){
    var book_data = [];
    var list = new Array();
    var bookImg_path=$("input#bookImg_path").val();
    var book_path=$("input#book_path").val();
    var book_name=$("input#book_name").val();
    list=bookImg_path.split("|");
    for(i=0;i<list.length;i++){
    	console.log("****"+list[i]);
    }
    console.log("绘本'"+book_name+"'的路径："+book_path+"**********该绘本图片长度："+list.length);
    
    creat_html(list,book_name)

    function creat_html(data,book_name){

        $('.flipbook').html('');
        var b_ok = true,
            b_num = 0;
        var html ='';

        for(var i=0; i<data.length; i++){
            if(b_ok){
            	var p_img =book_name+"/"+data[i],
            		p_page = '';
            	var isshow = 'block';
            	console.log(p_img);
                if(i == data.length -1){
                    isshow = 'none';
                }
                
                var p_pImg = '<div class="coverR"><img style="position:absolute;top:0px;left:-560px;height:680px;width:1112px;" src="../book/images/'+p_img+'"/></div>';
                p_page+='<div class="page_d">'+p_pImg+'<p class="next_page" style="display:'+isshow+'">下一页</p></div>';
                
                if(i==0){
                	p_page += '<div class="page_L1 cover"><img style="position:absolute;height:680px;width:1154px;" src="../book/images/'+book_name+"/"+data[i+1]+'" alt="">' +
                	'<p class="pre_page">上一页</p> ' +
                	'</div>'
                }else if(i<data.length-1){
                	p_page += '<div class="page_L1 cover"><img style="position:absolute;left:-27px;height:680px;width:1200px;" src="../book/images/'+book_name+"/"+data[i+1]+'" alt="">' +
                	'<p class="pre_page">上一页</p> ' +
                	'</div>'
                }
                
                html+=p_page;
            }
        }
        if(b_ok){
            $('.flipbook').append(html);
            var turnWidth = $('#cover').outerWidth(),
                turnHeight = $('#cover').outerHeight();

            $('.flipbook').turn({
                width: turnWidth*2+20,
                height: turnHeight,
                elevation: 50,
                gradients: true,
                autoCenter: true,
                display:'double',
                when: { turning: function(event, page, pageObject) {

                    } }
            });
        }
    }
})