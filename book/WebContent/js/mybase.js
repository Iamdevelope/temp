$(function(){
    var book_data = [];
    var list = new Array();
    var bookImg_path=$("input#bookImg_path").val();
    var book_path=$("input#book_path").val();
    var book_name=$("input#book_name").val();
    list=bookImg_path.split("|");
    creat_html(list,book_name)

    function creat_html(data,book_name){

        $('.flipbook').html('');
        var b_ok = true,
            b_num = 0;
        var html ='';
        var flipHtml = '<div class="gl_book_num">';
        var skipHtml = '<input type="text" id="gl_nead_skip_page"><input type="button" id="gl_skip_button" value="跳转">';
        

        for(var i=0; i<data.length; i++){
            if(b_ok){
            	var p_img =book_name+"/"+data[i],
            		p_page = '';
            	var isshow = 'block';
                if(i == data.length -1){
                    isshow = 'none';
                }
                
                if(i<=1){
                	var p_pImg = '<div class="coverR"><img style="position:absolute;top:0px;left:-283px;height:340px;width:556px;" src="../book/images/'+p_img+'"/></div>';
                    p_page+='<div class="page_d">'+p_pImg+'<p class="next_page" style="display:'+isshow+'">下一页</p></div>';
                }else if(i<data.length){
                	var p_pImg = '<div class="coverR"><img style="position:absolute;top:0px;left:-274px;height:340px;width:556px;" src="../book/images/'+p_img+'"/></div>';
                    p_page+='<div class="page_d">'+p_pImg+'<p class="next_page" style="display:'+isshow+'">下一页</p></div>';
                }
                
                if(i==0){
                	p_page += '<div class="page_L1 cover"><img style="position:absolute;height:340px;width:577px;" src="../book/images/'+book_name+"/"+data[i+1]+'" alt="">' +
                	'<p class="pre_page">上一页</p> ' +
                	'</div>'
                }else if(i<data.length-1){
                	p_page += '<div class="page_L1 cover"><img style="position:absolute;height:340px;width:600px;" src="../book/images/'+book_name+"/"+data[i+1]+'" alt="">' +
                	'<p class="pre_page">上一页</p> ' +
                	'</div>'
                }
                flipHtml+='<p>第'+(i+1)+"/"+data.length+'页</p>'
                html+=p_page;
            }
        }
        flipHtml+='</div>'
        if(b_ok){
            $('.flipbook').append(html);
            $('.gl_flipbook').append(flipHtml);
            $('.gl_skip_page').append(skipHtml);
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
            $('.flipbook').bind('turned',function(event,page,view){
            	var index=0;
            	if(page%2==0){
            		index = 0-(21*(page/2));
            	}else{
            		index = 0-(21*((page-1)/2));
            	}
            	$('.gl_book_num').css('top',index);
            });
            $('input#gl_skip_button').click(function(){
            	var page = $('input#gl_nead_skip_page').val();
				page = parseInt(page);
				if(page==1){
					$('.flipbook').turn('page',1);
				}else{
					$('.flipbook').turn('page',(page-1)*2);
				}
            })	
        }
    }
})