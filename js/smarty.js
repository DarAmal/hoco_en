$(function(){
	// Карусели товаров на главной
	$('.prodblockslick').slick({
		infinite: true,
		arrows: true,
		dots: false,
		draggable: false,
		slidesToShow: 3,
		slidesToScroll: 3,
		responsive: [
			{
				breakpoint: 1341,
				settings: {
					arrows: false,
					dots: true,
				}
			},
			{
				breakpoint: 881,
				settings: {
					arrows: false,
					slidesToShow: 2,
					slidesToScroll: 2,
					dots: true
				}
			},
			{
				breakpoint: 551,
				settings: {
					arrows: false,
					slidesToShow: 1,
					slidesToScroll: 1,
					adaptiveHeight: true,
					dots: true
				}
			}
		]
	});
	
	// Последние комментарии на главной
	$('.lastcom').slick({
		infinite: true,
		arrows: true,
		dots: false,
		centerMode: true,
		centerPadding: '0px',
		slidesToShow: 3,
		slidesToScroll: 1,
		swipeToSlide: true,
		adaptiveHeight: true,
		responsive: [
			{
				breakpoint: 1341,
				settings: {
					arrows: false,
					dots: true
				}
			},
			{
				breakpoint: 881,
				settings: {
					arrows: false,
					slidesToShow: 2,
					centerMode: false,
					dots: true
				}
			},
			{
				breakpoint: 481,
				settings: {
					arrows: false,
					slidesToShow: 1,
					slidesToScroll: 1,
					adaptiveHeight: true,
					dots: true
				}
			}
		]
	});
	
	// Преимущества
	$('.advant').slick({
		infinite: true,
		arrows: false,
		dots: false,
		swipeToSlide: true,
		slidesToShow: 5,
		slidesToScroll: 5,
		responsive: [
			{
				breakpoint: 881,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
					arrows: true
				}
			},
			{
				breakpoint: 481,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 2,
					adaptiveHeight: true,
					arrows: true
				}
			},
			{
				breakpoint: 426,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 4,
					adaptiveHeight: true,
					arrows: false
				}
			},
			{
				breakpoint: 321,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
					adaptiveHeight: true,
					arrows: false
				}
			}
			
		]
	});
	
	// Большой слайдер на главной
	$('.sliderslick').slick({
		infinite: true,
		arrows: true,
		dots: false,
		slidesToShow: 1,
		slidesToScroll: 1,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					arrows: false,
					dots: true
				}
			}
		]
	});
	
	$('.leftbanner').slick({
		infinite: true,
		arrows: false,
		dots: true,
		adaptiveHeight: true,
		slidesToShow: 1,
		slidesToScroll: 1
	});

	
	
});

//  ========== 
    //  = Scroll inspector = 
    //  ========== 
    $(function(){
	$nav = $('#shapka');
	$nav.css('width', $nav.outerWidth());
	$window = $(window);
	$h = $nav.offset().top;
	$window.scroll(function(){
		if ($window.scrollTop() > $h){
			$nav.addClass('fixed');
		} else {
			$nav.removeClass('fixed');
		}
	});
    });
        
$(document).ready(function() { 

	
	$(".nav>.navone").hover(function() { 
		$(this).find(">div").fadeToggle(130);
	});
	
	$(".product_iteam_slick").hover(function() { 
		$(this).find(".formpanel").slideToggle(130);
	});
	
	$(".podnavtwo>.navtwo").hover(function() { 
		$(this).find(">div").fadeToggle(130);
	});
	
	$('ul.nav1s li').hover(function() {
		$(this).toggleClass("active");
	});
	
	$('span.opencartmodal').hover(function() {
		$(this).toggleClass("act");
	});
	
	$('.navone').hover(function() {
		$(this).toggleClass("active");
	});
	
	$('select.ipselect').hover(function() {
		$(this).toggleClass("active");
	});
	
	$('.navtwo').hover(function() {
		$(this).toggleClass("active");
	});
	
	$('.bluron').click(function() {
		$('.blurs').addClass("blur"),
		$('body').addClass("hid");
	});
	$('.bluroff').click(function() {
		$('.blurs').removeClass("blur"),
		$('body').removeClass("hid");
	});
	
	$(".mylist_add").click(function () {
		$(this).addClass("active");
	});
	
	$("li.catprod").hover(function() { 
		$(this).find(".ipdescr").slideToggle(130);
	});
	
	$("li.catprod").hover(function() { 
		$(this).toggleClass("active");
	});

/*	jQuery(function($) {
		$.mask.definitions['~']='[+-]';
		$('#phone').mask('(+992) xxx-xx-xx');
		$('#phone2').mask('(+992) xxx-xx-xx');
		$('#phonecart').mask('(+992) xxx-xx-xx');
		$('.regphone').mask('(+992) xxx-xx-xx');
		$('#oneclickphone').mask('(+992) xxx-xx-xx');
	});
*/
	$("ul.tabs").jTabs({content: ".tabs_content", animate: true});
	$("ul.modallogin").jTabs({content: ".modallogin_content", animate: true});
	
	
	$(function(){
		document.getElementById('feedback-form').onsubmit = function(){
			var http = new XMLHttpRequest();
			http.open("POST", "/contacts.php", true);
			http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			http.send(
				"nameFF=" + this.nameFF.value +
				"&phoneFF=" + this.phoneFF.value
			);
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) {
					$(".cback").fadeOut(300),
					setTimeout('$(".send").fadeIn(300)', 300),
					setTimeout('$(".send").fadeOut(300)', 3500),
					setTimeout('$(".blurs").removeClass("blur")', 3500);
				}
			}
			http.onerror = function() {
				alert('Извините, данные не были переданы');
			}
			return false;
		}		
	});
	
	$(function(){
		document.getElementById('vopros-form').onsubmit = function(){
			var http = new XMLHttpRequest();
			http.open("POST", "/contacts-vopros.php", true);
			http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			http.send(
				"nameFF=" + this.nameFF.value +
				"&phoneFF=" + this.phoneFF.value +
				"&mailFF=" + this.mailFF.value +
				"&messageFF=" + this.messageFF.value
			);
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) {
					$(".vopros").fadeOut(300),
					setTimeout('$(".send").fadeIn(300)', 300),
					setTimeout('$(".send").fadeOut(300)', 3500),
					setTimeout('$(".blurs").removeClass("blur")', 3500);
				}
			}
			http.onerror = function() {
				alert('Извините, данные не были переданы');
			}
			return false;
		}		
	});
	
    $('select.ajaxselect').change(function() {
        price = $(this).find('option:selected').data('price');
        compare_price = '';
		proc = '';
		compare_price2   = parseInt($(this).find('option:selected').data('compareprice2'),10);
        if(typeof $(this).find('option:selected').data('compare_price') == 'string')
            compare_price = $(this).find('option:selected').data('compare_price');
        $(this).find('option:selected').data('compare_price');
        if(typeof $(this).find('option:selected').data('proc') == 'string')
            proc = $(this).find('option:selected').data('proc');
        $(this).find('option:selected').data('proc');
		
        $(this).closest('.jsprod').find('.prc-new').html(price);
		
		if(compare_price2>0) {
			$(this).closest('.jsprod').find('.prc-old').html(compare_price);
			$(this).closest('.jsprod').find('.prc-old').fadeIn();
			$(this).closest('.jsprod').find('.cproc').html(proc);
			$(this).closest('.jsprod').find('.cproc').show(300);
		} else {
			$(this).closest('.jsprod').find('.prc-old').fadeOut();
			$(this).closest('.jsprod').find('.cproc').hide(300);
		}
	
        return false;
    });
       
	$(function() {
		$('.order_form').submit(function(e) {
			e.preventDefault();
				 
			var s_data=$(this).serialize();
			$.ajax({
				type: 'POST',
				url: "ajax/order.php",
				data: s_data,
			success: function(data){
			if(data){
				$('#ajaxorder').html(data.ourl);
				$('.message_error').show().html(data);
			}
			}
			});
		

		});
	});
	   
	$(".variki label").live("click", function(){
		price   = $(this).find('input').data('price');
		compare_price   = $(this).find('input').data('compareprice');
		sku   = $(this).find('input').data('sku');
		proc   = $(this).find('input').data('proc');
		compare_price2   = parseInt($(this).find('input').data('compareprice2'),10);
		
		$(this).closest('.jsprod').find('.prc-new').html(price);
		$(this).closest('.jsprod').find('.prc-sku').html(sku);

		if(compare_price2>0) {
			$(this).closest('.jsprod').find('.prc-old').html(compare_price);
			$(this).closest('.jsprod').find('.prc-old').fadeIn();
			$(this).closest('.jsprod').find('.cproc').html(proc);
			$(this).closest('.jsprod').find('.cproc').show(300);
		} else {
			$(this).closest('.jsprod').find('.prc-old').fadeOut();
			$(this).closest('.jsprod').find('.cproc').hide(300);
		}
		$(this).closest('.jsprod').find('input').click(function () {
			$('input').removeClass("active");
		});
	});

	$("[data-tip]").addClass('tip');
	
	$(function(){
		var balloon = $('<div class="balloon"></div>').appendTo('body');
		function updateBalloonPosition(x, y){
			balloon.css({ left: x + 15, top: y + 15});
		}
		$('.tip').each(function(){
		var element = $(this);
		var text = element.data('tip');
		text = text.replace(/  /gi, '<br>');
		element.data('tip','');
		element.hover(function(event){
			balloon.html(text);
			updateBalloonPosition(event.pageX, event.pageY); 
			balloon.show();
		},function(){
			balloon.hide();
		})
		element.mousemove(function(event){
			updateBalloonPosition(event.pageX, event.pageY);
		});
		});
	});
	
	$('.mainhidetext').readmore({
		maxHeight: 255,
		speed: 500,
		moreLink: '<a class="slink" style="margin-top: 15px;" href="#">Подробнее</a>',
		lessLink: '<a class="slink" style="margin-top: 15px;" href="#">Скрыть</a>'
	});
	
	$('.maxtext').readmore({
		maxHeight: 246,
		speed: 500,
		moreLink: '<a class="slink" style="margin-top: 15px;" href="#">Подробнее</a>',
		lessLink: '<a class="slink" style="margin-top: 15px;" href="#">Скрыть</a>'
	});
	
	$('.mail_form').submit(function(e) {
		e.preventDefault();			
            $.ajax({
                type: "post",
                url: "/ajax/mail.php",
                data: {email: $('.onemail').val()},
                dataType: 'json'
            });
			
			$(".mail_form").slideUp(300);
			$(".sendonecloic").slideDown(300);		
			
            return false;

    });
	
	$('.featured').slick({
		infinite: true,
		arrows: true,
		dots: false,
		autoplay: true,
		autoplaySpeed: 4000,
		slidesToShow: 5,
		slidesToScroll: 3,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
					infinite: true,
					dots: true
				}
			},
			{
				breakpoint: 600,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 2
				}
			},
			{
				breakpoint: 480,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1
				}
			}
		]
	});
	
	 $('.slider-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1, 
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	
	$('.slider-nav').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: false,
		swipeToSlide: true,
		centerMode: true,
		centerPadding: '0px',
		focusOnSelect: true,
		responsive: [
			{
				breakpoint: 769,
				settings: {
					arrows: false,
					dots: true,
				}
			},
			{
				breakpoint: 721,
				settings: {
					slidesToShow: 5,
					slidesToScroll: 1,
					centerMode: false,
					arrows: false,
					dots: true,
				}
			},
			{
				breakpoint: 550,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1,
					centerMode: false,
					arrows: false,
					dots: true,
				}
			}
		]
	});
	
	$('.modalclose').click(function() {
		$(this).closest('.modalitem').fadeOut(130);
		$('.blurs').removeClass("blur");
		$('body').removeClass("hid");
	});
	
	$('.podmenumobclose').click(function() {
		$(this).closest('.podmenumob').fadeOut(300);
		$('.blurs').removeClass("blur");
		$('body').removeClass("hid");
		$('.mobmenublock').slideUp('500');
	});
	
	//$('.openmenu').click(function() {
	//	$('.podmenumob').fadeIn(300);
	//	$('.blurs').addClass("blur");
	//	$('body').addClass("hid");
	//	$('.mobmenublock').slideDown('500');
	//});
	
	$(window).on('resize', function() {
		if($(window).width()<880){
			$('.mmnavpage').append( $('ul.nav1') );
			$('ul.nav1').addClass("navvr");
			$('ul.nav1').removeClass("nav1");
			$('.msub').addClass("mobsub");
		}
		else {
			$('ul.navvr').addClass("nav1");
			$('ul.nav1').removeClass("navvr");
			$('.top').append( $('ul.nav1') );
			$('.mobsub').removeClass("mobsub");
		};
		
		if($(window).width()<600){
			$('.appendcart').append( $('#cart_informer') );
		}
		else {
			$('.topcart').append( $('#cart_informer') );
		}
		
		
		if($(window).width()<560){
			$(".amountposit").each(function () {
				 $(this).closest('.cartable').find('.sudaamounts').append(this);
			});
			//$('.sudaamounts').append( $('.carkolvo>.amountposit') );
		}
		else {
			$(".amountposit").each(function () {
				 $(this).closest('.cartable').find('.carkolvo').append(this);
			});
			//$('.carkolvo').append( $('.sudaamounts>.amountposit') );
		}	
		
	});
	$(window).resize();
	
	$(document).on("click",".mobsub",function() {
		$(this).closest('li').find('>div').slideToggle();
		return false;
	});
	
	
    $('.zenam.mob').click(
        function() {
		   $(this).closest('.zeblock').find('>ul').slideToggle();
		   $(this).toggleClass('active');
        }
    );

// Мобильная навигация	

	var main = function() {
		$('a.navtoggle').click(function() {
			$('html').addClass("now");
			$('body').addClass("hid");
			$('.podmmenucat').fadeIn(300);
			$('.mmenucat').animate({
				left: '0px'
			}, 300);
			 
			$('.blurs').animate({
				left: '285px'
			}, 300);
			return false;
		});
		
		$('.podmmenucat').click(function() {
			$('html').removeClass("now");
			$('body').removeClass("hid");
			$('.mmenucat').animate({
				left: '-305px'
			}, 300);
			
			$('.blurs').animate({
				left: '0px'
			}, 300);
			$(this).fadeOut(300);
			return false;
		});
		
		$('.openmenu').click(function() {
			$('html').addClass("now");
			$('body').addClass("hid");
			$('.podmmenupage').fadeIn(300);
			$('.mmenupage').animate({
				left: '0px'
			}, 300);
			 
			$('.blurs').animate({
				left: '285px'
			}, 300);
			return false;
		});
		
		$('.podmmenupage').click(function() {
			$('html').removeClass("now");
			$('body').removeClass("hid");
			$('.mmenupage').animate({
				left: '-305px'
			}, 300);
			
			$('.blurs').animate({
				left: '0px'
			}, 300);
			$(this).fadeOut(300);
			return false;
		});
	};

	$('.mmnav a').click(function() {
		$(this).toggleClass("act");
	});
	$(document).ready(main);

	
	
	$("form.validate").submit(function(e) {

		var ref = $(this).find("[required]");

		$(ref).each(function(){
			if ( $(this).val() == '' )
			{
				alert("Required field should not be blank.");

				$(this).focus();

				e.preventDefault();
				return false;
			}
		});  return true;
	});
	
		$(document).on("click",".mcartminus",function() {
			var $input = $(this).closest('.amount').find('input');
			var count = parseInt($input.val()) - 1;
			count = count < 1 ? 1 : count;
			$input.val(count);
			$input.change();
			return false;
		});
		$(document).on("click",".mcartplus",function() {
			var $input = $(this).closest('.amount').find('input');
			var count = parseInt($input.val()) + 1;
			count = count > 1000 ? 1000 : count;
			$input.val(count);
			$input.change();
			return false;
		});
	
	$(function() { 
	$(window).scroll(function() { 
		if($(this).scrollTop() != 0) {
 		$('#toTop').fadeIn();
 		} else {
 		$('#toTop').fadeOut();
 		}
 });
 		$('#toTop').click(function() {
 		$('body,html').animate({scrollTop:0},800);
 });
	
	 });
});