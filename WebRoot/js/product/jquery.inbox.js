(function($){

	$.fn.inbox = function(options){
		var _target, _title, _close, _body, _footer, _canel, _ok;
		var _mask;
		
		var $this = $(this);
		var defualts = {
			version: '1.0',
			clickEventName: "click",
			method: 'post',
			data:{},
			onpopup: function(e){},
			onclose: function(e){},
			onsubmit: function(data){},
			onerror: function(error){},
			oncanel: function(e){},
			popup: function(){
				popup();
			},
			close: function(){
				close();
			}
		};
		
		function getData(){
			var data = {};
			_target.find("input").each(function(index, element) {
				data[$(this).attr("name")] = $(this).val();
			});
			_target.find("textarea").each(function(index, element) {
				data[$(this).attr("name")] = $(this).val();
			});
			return data;
		}
	
		function popup(){
			defualts.onpopup(_target);
			_mask = $("<div class='inbox-mask'></div>");
			$('body').append(_mask);
			_target.slideDown(1000);
			_mask.show();	
		}
		
		function close(){
			_target.slideUp(1000, function(){
				_mask.hide();
				_mask.remove();	
			});	
			defualts.onclose(_target);
		}
		
		function canel(){
			_target.slideUp(1000, function(){
				_mask.hide();	
				_mask.remove();
			});	
			defualts.oncanel(_target);
		}
		
		function loading(isShow){
			var ldbox = $('<div class="ajax-loading"></div>');
			if(isShow){
				ldbox.show();
			}else{
				ldbox.hide();
			}
		}
		
		function enable(){
			var url = defualts.url || _target.find("form").attr("action");
			var method = defualts.method || _target.find("form").attr("method"); 
			if(url){
				loading(true);
				if(defualts.validate&&!defualts.validate()) return;
				var data = getData();
				data = $.extend(data, defualts.data);
				jQuery.ajax({
					url:url,
					data:data,
					dataType:'json',
					type:method,
					timeout:10000,
					success:function(rdata){
						loading(false);
						defualts.onsubmit(rdata);
					},
					error:function(xhr,type,errorThrown){
						loading(false);
						defualts.onerror(errorThrown);
					}
				});
			}else{
				defualts.onsubmit(rdata);
			}
			close();	
		}
		
		/*function createTitle(){
			var e = _target.find(".inbox-title");
			if(e) return e;
		}*/
		
		function init(e){
			_target = e;
			
			_close = $('<span class="iclose mui-icon icon mui-icon-closeempty"></span>');
	
			_close.bind(defualts.clickEventName, function(){
				close();
			});
			
			_canel = _target.find(".icanel");
			_canel.bind(defualts.clickEventName, function(){
				canel();
			});
			
			_ok = _target.find(".ienable");
			_ok.bind(defualts.clickEventName, function(){
				enable();
			});
			
			if(_target.find(".iclose").length==0){
				 _target.append(_close);
			}
			
		}
		
		defualts = $.extend(defualts, options); 
		init($this);
		return defualts;
	};
		
})(jQuery)