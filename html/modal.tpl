<div class="modalitem cback">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				Заказать звонок
				<span class="close bluroff" onclick="$('.cback').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<form method="POST" id="feedback-form">
					<ul class="export">
						<li>
							<label>Имя:</label>
							<input type="text" name="nameFF" required placeholder="Ваше имя">
						</li>
						<li>
							<label>Телефон:</label>
							<input id="phone" type="text" name="phoneFF" required placeholder="(+992) xxx-xx-xx">
						</li>
						<li>
							<button type="submit" class="but" value="">Отправить</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modalitem vopros">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				Возникли вопросы?
				<span class="close bluroff" onclick="$('.vopros').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<form method="POST" id="vopros-form">
					<ul class="export">
						<li>
							<label>Имя <span>*</span></label>
							<input type="text" name="nameFF" required placeholder="Ваше имя">
						</li>
						<li>
							<label>Телефон <span>*</span></label>
							<input id="phone2" type="text" name="phoneFF" required placeholder="(+992) xxx-xx-xx">
						</li>
						<li>
							<label>E-mail</label>
							<input type="text" name="mailFF" placeholder="Электронная почта">
						</li>
						<li>
							<label>Опишите ваш вопрос <span>*</span></label>
							<textarea name="messageFF" required placeholder="....."></textarea>
						</li>
						<li>
							<button type="submit" class="but" value="">Отправить</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modalitem userprofile">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				{if $user}
				{$user->name}
				{else}
				Личный кабинет
				{/if}
				<span class="close bluroff" onclick="$('.userprofile').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<div id="ajaxlogin">
					{include file = "ajax_login.tpl"}
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modalitem testorder">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				Проверка заказа
				<span class="close bluroff" onclick="$('.testorder').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<div id="ajaxorder">
					{include file = "ajax_order.tpl"}
				</div>
			</div>
		</div>
	</div>
</div>



{if $user}
{else}
{literal}
<script>
$(function() {
	$('.login_form').submit(function(e) {
		e.preventDefault();
			 
		var s_data=$(this).serialize();
		$.ajax({
			type: 'POST',
			url: "ajax/login.php",
			data: s_data,
		success: function(data){
        if(data){
			$('#ajaxlogin').html(data.ajax_login);
			$('.message_error').show().html(data);
		}
		}
		});
	

	});
});
</script>
{/literal}
{/if}


<div class="modalitem send">
	<div class="modalclose"></div>
	<div class="modal">
		<div style="text-align: center;">
			<img class="icon icons8-Checkmark" src="" width="96" height="96" alt="Успешно!">
			<br/>
			<b>Заявка принята!</b>
			<p>В ближайшее время с вами свяжется наш менеджер!</p>
			<br/>
			<span class="link bluroff" onclick="$('.send').fadeOut(300); return false;">Закрыть</span>
		</div>
	</div>
</div>


<div class="modalitem serblock">
	<div class="modalclose"></div>
	<div class="bsear">
		<div>
		</div>
	</div>
</div>


{if $module=='ProductView'}
<div class="modalitem oneclick">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				Быстрый заказ товара
				<span class="close bluroff" onclick="$('.oneclick').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<form class="oneclickform">
					<ul class="export">
						<li>
						<input class="onename" value="{$user->name|escape}" type="text" placeholder="Введите Ваше имя *" required />
						</li>
						<li>
						<input id="oneclickphone" class="onephone" value="{$user->phone|escape}" type="text" placeholder="Введите номер телефона *" required />
						</li>
						<li>
						<input class="oneaddress" value="{$user->address|escape}" type="text" placeholder="Введите адрес доставки" />
						</li>
						<li>
						<textarea placeholder="Ваш комментарий к заказу" class="onecomment" id="user_comment" name="comment" data-notice="Текст комментарий">{$user->comment|escape}</textarea>
						</li>
                        <div class="g-recaptcha" data-sitekey="{$settings->site_code|escape}"></div>
						<li>
							<button type="submit" class="but oneclickbuy" value="">Заказать</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
{literal}
<script>
	$(function() {
		$('.oneclickform').submit(function(e) {
			if($('.variants').find('input[name=variant]:checked').size()>0) variant = $('.variants input[name=variant]:checked').val();
			if($('.variants').find('select[name=variant]').size()>0)
			variant = $('.variants').find('select').val();
			$.ajax({
				type: "post",
				url: "/ajax/oneclick.php",
				data: {amount: 1, variant: variant, name: $('.onename').val() , phone: $('.onephone').val() , address: $('.oneaddress').val() , comment: $('.onecomment').val()},
				dataType: 'json'
			});
			$(".oneclick").fadeOut(300),
			setTimeout('$(".send").fadeIn(300)', 300),
			setTimeout('$(".send").fadeOut(300)', 3500),
			setTimeout('$(".blurs").removeClass("blur")', 3500);
			jQuery('.oneclickform')[0].reset();
			return false;
		});
	});
</script>
{/literal}
{/if}
{if $module=='ProductView' || $page->url=='reviews' || $module=='PhotoView'}
<div class="modalitem addrevproduct">
	<div class="modalclose"></div>
	<div class="modal">
		<div>
			<div class="modaltitle">
				New review
				<span class="close bluroff" onclick="$('.addrevproduct').fadeOut(300); return false;"></span>
			</div>
			<div class="modalscroll">
				<form enctype="multipart/form-data" method="post">
					<ul class="export">
						<li>
							<input type="text" id="comment_name" name="name" placeholder="Your Name *" value="{$comment_name|escape}" required/>
						</li>
						<li>
							<input type="text" name="email" value="{$comment_email}" placeholder="Your Email *" />  
						</li>
						{if $module !=='PhotoView'}
						<li>
							<label>Photo</label>
							<input class='upload_image' name="image" id="file" type="file">
						</li>
						
						<li class="addrate">
							<label>{if $module=='ProductView'}Rate the product{elseif $page->url=='reviews'}Rate the store{/if}</label>
							<div id="reviewStars-input" class="prod">
								<input id="star-4" type="radio" name="rate" value="5"/>
								<label title="gorgeous" for="star-4"></label>

								<input id="star-3" type="radio" name="rate" value="4"/>
								<label title="good" for="star-3"></label>

								<input id="star-2" type="radio" name="rate" value="3"/>
								<label title="regular" for="star-2"></label>

								<input id="star-1" type="radio" name="rate" value="2"/>
								<label title="poor" for="star-1"></label>

								<input id="star-0" type="radio" name="rate" value="1"/>
								<label title="bad" for="star-0"></label>
							</div>
						</li>
						{/if}
						<li>
							<textarea id="comment_text" name="text" placeholder="Your review" required>{$comment_text}</textarea>
						</li>
                        <div class="g-recaptcha" data-sitekey="{$settings->site_code|escape}"></div>
						<li>
							<input class="frbutton" type="submit" name="comment" value="Send" />
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
{/if}

<div class="podmenumob">
	<div class="podmenumobclose"></div>
	<span class="close bluroff" onclick="$('.podmenumob').fadeOut(300); return false;"></span>
	<div class="mobmenublock">
	</div>
</div>

<div class="podmmenu podmmenupage bluroff"></div>
<div class="mmenu mmenupage">
	<div class="mmnav mmnavpage">
	</div>
</div>

<div class="podmmenu podmmenucat bluroff"></div>
<div class="mmenu mmenucat">
	{include file='mmenu.tpl' categories=$categories level=0}
</div>