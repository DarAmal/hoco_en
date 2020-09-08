(function($){$.fn.jTabs=function(options){var defaults={content:"div.content",equal_height:false,cookies:false,animate:false,effect:"fade",speed:400};var options=$.extend(defaults,options);return this.each(function(){obj=$(this);var objTabs=$(options.content);var number_of_items=obj.children("li").size();var tabIndex=[];var tabs=[];for(i=1;i<=number_of_items;i++){tabIndex[i]=obj.find("li:nth-child("+i+")");tabIndex[i].attr("data-id",i)}for(i=1;i<=number_of_items;i++){tabs[i]=$(options.content+"> div:nth-child("+i+")")}if(options.equal_height){var maxHeight=0;$(options.content).children("div").each(function(){if($(this).outerHeight()>maxHeight){maxHeight=$(this).outerHeight()}});$(options.content).height(maxHeight)}if(options.cookies){if(getCookie("page")){showTab(getCookie("page"))}else{setCookie("page",1,999);showTab(1)}}else{showTab(1)}function showTab(num){tabIndex[num].addClass("active").siblings().removeClass("active");if(!options.animate){tabs[num].show().siblings().hide()}else{switch(options.effect){case"fade":tabs[num].fadeIn(options.speed).siblings().hide();break;case"slide":tabs[num].slideDown(options.speed).siblings().hide();break}}}obj.find("li").live("click",function(e){e.preventDefault();var tab_num=$(this).attr("data-id");showTab(tab_num);if(options.cookies)setCookie("page",tab_num,999)});function setCookie(c_name,value,expiredays){var exdate=new Date();exdate.setDate(exdate.getDate()+expiredays);document.cookie=c_name+"="+escape(value)+((expiredays==null)?"":";expires="+exdate.toUTCString())}function getCookie(c_name){if(document.cookie.length>0){c_start=document.cookie.indexOf(c_name+"=");if(c_start!=-1){c_start=c_start+c_name.length+1;c_end=document.cookie.indexOf(";",c_start);if(c_end==-1)c_end=document.cookie.length;return unescape(document.cookie.substring(c_start,c_end))}}return""}})}})(jQuery);