//图片预加载
(function($){
	function Preload(imgs,options){
		this.imgs = (typeof imgs === 'string') ? [imgs] : imgs;
		this.opts = $.extend({},Preload.DEFAULTS,options);

		this._unoredered();
	}
	Preload.DEFAULTS = {
		each:null,//每张图片加载完毕后执行
		all:null//所有图片加载完毕后执行
	};
	Preload.prototype._unoredered = function(){
		//无序加载
		var imgs = this.imgs,
			opts = this.opts,
			count = 0,
			len = imgs.length;


		$.each(imgs,function(i,src){
			if(typeof src != 'string') return;
			var imgObj = new Image();
			$(imgObj).on('load error',function(){
				opts.each && opts.each(count);//判断，如果当传参数了在执行
				if(count>=len-1){
					//所有图片加载完成
					opts.all && opts.all();
				}
				count++;
			});
			imgObj.src = src;
		});
	};
	//完成一个jQuery插件，供外界调用，jQuery提供了两种方式
	// $.fn.extend -> $('#img').preload();  //这个是将插件附在一个元素上
	//$.extend -> $.preload();  //直接跟在jQuery对象上，作为一个工具方法
	$.extend({
		preload:function(imgs,opts){
			new Preload(imgs,opts);
		}
	});
})(jQuery);