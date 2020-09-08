{$canonical="/products/{$product->url}" scope=parent}

<!-- Хлебные крошки /-->
<ul class="path">
	<li><a href="/">Home</a></li>
	<li><a href="/products">Catalog</a></li>
	{foreach $category->path as $cat}
		<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
	{/foreach}
	<li><span>{$product->name|escape}</span></li>
</ul>
<!-- Хлебные крошки #End /-->
<div class="product-block">

<div class="ptable product jsprod mar-t-30">
	{if $product->image}
	<div class="ptableleft">
		<div>
			<div class="image">
            {if $product->featured}<div class="fichi"><span class="chit"></span></div>{/if}
            
            {* <!-- {if $product->action}
               <span class="credit-sign"><img src="files/uploads/icons/action.png"/></span>
                {/if}
                -->
               *}
               <div class="slider-for">
					{foreach $product->images as $i=>$image}
					<div>
						<a href="{$image->filename|resize:800:600:w}" class="quick_view" data-fancybox="qw1" data-qw-form="qw-form-1"><img src="{$image->filename|resize:430:430}" alt="{$product->name|escape}" /></a>
					</div>
					{/foreach}
				</div>
                  {if $product->gift}
               <span class="gift"><img src="files/uploads/icons/gift.png" title="Gift!" alt="Gift!"/></span>
                {/if}
			</div>
			{if $product->images|count>1}
			<div class="pp_images slider-nav">
				{foreach $product->images as $i=>$image}
				<div>
					<div class="pp_i_b">
						<span>
							<span>
								<img src="{$image->filename|resize:60:60}" alt="{$product->name|escape}" />
							</span>
						</span>
					</div>
				</div>
				{/foreach}
			</div>
			{/if}
		</div>
	</div>
	{/if}
     <h1 class="prodtitle" data-product="{$product->id}">{$product->name|escape}</h1>
	
    <div class="ptableleft2">
   
		<div>
         <div class="short-description"> {$product->annotation} </div>
    	</div>
         
	</div>
	<div class="ptableright">
    {if $product->variants|count > 0}
		{*<!-- <form class="variants pis_table mar-b-30" action="/cart">
		
			{if $product->variants|count > 1}
			<div class="blockselectprod">
				<b>выберите вариант</b>
				<div class="podipselect">
					<select class="ipselect ajaxselect" name="variant">
						{foreach $product->variants as $v}
							<option value="{$v->id}" {if $v->compare_price > 0}data-compareprice2="{$v->compare_price}" data-proc="- {floor(abs(100-{$v->price}/($v->compare_price)*100))}%" data-compare_price="<span><b class='clcomp'>{$v->compare_price|convert}</b> 
{$currency->sign|escape}</span>"{/if} data-price="<span><b class='calcitog'>{$v->price|convert}</b> {$currency->sign|escape}</span>">{$v->name}</option>
						{/foreach}
						</select>
				</div>
			</div>
			{else}
			{foreach $product->variants as $v}
			<input checked name="variant" value="{$v->id}" type="radio" style="display: none;"/>
			{/foreach}
			{/if}
		
			<div class="podcenlist prod">
            <div class="skidka"><div class="prc-old"{if $product->variant->compare_price > 0}{else} style="display: none;"{/if}>
     {if $product->variant->compare_price > 0}<span><b class="clcomp">{$product->variant->compare_price|convert}</b></span>{/if}</div>
                {if $product->variant->compare_price > 0}
                <span class="benefit prod">Скидка <b class="minus" style="color:#F00;">- {floor(($product->variant->compare_price)-{$product->variant->price})|convert} {$currency->sign|escape}</b> </span>
                {/if}
                </div>
				<div class="cenlist">
     <div class="prc-new"><span><b class="calcitog">{$product->variant->price|convert}</b> {$currency->sign|escape}</span></div>
				</div>
			</div>
			
			{if $properties}
			<div class="blockselectprod">
			<b>Дополнительно</b>
			<ul class="drops nof prodpage">
			{foreach $properties as $val}
				<li class="val{$val->id}">
					<label>
						<input style="vertical-align: middle; margin-right: 4px;" type="checkbox" name="properties[]" value="{$val->id}">
						<span class="itname">{$val->name} (+{$val->price|convert} {$currency->sign|escape})</span>
					</label>
				</li>
			{/foreach}
			</ul>
			</div>
			{/if}
			
			<div class="amountposit">
				<button type="submit" class="but addcart i-basket" value="" data-result-text="Добавлен">В корзину</button>
                <span class="credit">
               <a href="#" class="bluron" onclick="$('.oneclick').fadeIn(300); return false;">Купить в 1 клик</a>
               </span>
			</div>		
			
			<!--
			{literal}
			<script>		
			$(function() {
				$('select.ajaxselect').change(function(e) {
					e.preventDefault(); 
					$.ajax({
						dataType: 'json',
						url: "ajax/calc.php",
						data: {productid: {/literal}{$product->id}{literal}},
						success: function(data){
						if(data){
							$('.scriptblock').html(data.scriptblock);
						}
					}
					});
				});
			});
			</script>
			{/literal}-->
				
		</form>-->*}
			{else}
			<div class="soon">Unavailable</div><br /><br />
		{/if}
                
{*<!--Modal-->*}
<div id="qw-form-1" class="hidden">
	<div class="bigqwtext">{$product->name|escape}</div>
	
	<div class="short-description">
          {$product->annotation}
            </div>

</div>
{*<!--end Modal-->*}
		
		<div class="bpinfo">
			<a href="/delivery">Delivery and Payment</a>			
		</div>
        {if $product->credit}
		<div class="bpinfo">
			<div class="srok">Warranty: <strong>{$product->credit|escape}</strong></div>
		</div>
        {/if}		
	</div>
</div></div>

<!-- Блок Описание -->
<div class="ptable product jsprod mar-t-30">
<div class="tabs">

	<ul class="tabs__caption">
	    {if $product->features}<li {if $product->features}class="active"{/if}>Specifications</li>{/if}
        <li {if $product->features}{else}class="active"{/if}>Description</li>
        <li>Reviews<span>{$comments|count}</span></li>
		{if $product->video}<li>Video review</li>{/if}
	</ul>
   
   
{if $product->features}                  
	<div class="tabs__content prop active">
		<table class="table table-theme table-striped">
							{foreach $product->features as $f}
							<tr>
								<td>{$f->name}</td>
								<td>{$f->value}</td>
							</tr>
							{/foreach}
            	       </table>
	</div>
    {/if}

	<div class="tabs__content body_tabs">
		{if $product->body} 
        <div class="body_tabs"><h1 class="prodtitle" data-product="{$product->id}">{$product->name|escape}</h1>
        {$product->body}</div>
        {else}<p>No description</p>{/if}  
    </div>
    
  <div class="tabs__content">
	    {if $comments}
<div id="zcomments">
	<div class="zcomments">
		{foreach $comments as $comment}
		<div class="cgrid">
			<div>
				<div class="retable">
					{if $comment->image}
					<div class="rtd rtdimg">
						<a href="{$comment->image|resizepost:1920:0}" data-fancybox="gallery{$comment->id}"><img src="{$comment->image|resizepost:100:100}" alt="" /></a>
					</div>
					{/if}
					<div class="rtd rtdcom">
						<b>{$comment->name|escape}</b>
						<div class="comrate">
							<div class="rating" {if $comment->rate==1}data-tip="Awful"{elseif $comment->rate==2}data-tip="Poorly"{elseif $comment->rate==3}data-tip="Fine"{elseif $comment->rate==4}data-tip="Good"{elseif $comment->rate==5}data-tip="Excellent"{else}data-tip="Rating not set"{/if}>
								<div class="rat"{if $comment->rate==1}style="width: 20%;"{elseif $comment->rate==2}style="width: 40%;"{elseif $comment->rate==3}style="width: 60%;"{elseif $comment->rate==4}style="width: 80%;"{elseif $comment->rate==5}style="width: 100%;"{/if}></div>
							</div>
						</div>
						<p><span class="i-calendar"></span> {$comment->date|date}</p>
						{$comment->text|escape|nl2br}
						{if $comment->otvet|escape|nl2br}
						<div class="readmins">
						<b>Hoco</b>
						{$comment->otvet|escape|nl2br}
						</div>
						{/if}
					</div>
				</div>
				
			</div>
		</div>
		{/foreach}
	</div>
    <div class="alllink photoalllink mar-b-50 pad-t-30">
	<a href="#" class="bluron" onclick="$('.addrevproduct').fadeIn(300); return false;"><b>Add a review</b></a>
</div>

</div>
{else}
<p>There are no reviews yet. Be the first.</p>
<div class="alllink photoalllink mar-b-50 pad-t-30">
	<a href="#" class="bluron" onclick="$('.addrevproduct').fadeIn(300); return false;"><b>Add a review</b></a>
</div>{/if}
</div>

<!-- ВидеоОбзор -->
	 {if $product->video}
     <div class="tabs__content">
		<div class="youtube">        
		<p>{youtube url={$product->video} width='640' height='360'}</p>
        <p>{youtube url={$product->video2} width='640' height='360'}</p>
        </div>
        </div>
        {/if}
	
<!-- END ВидеоОбзор -->

</div><!-- .tabs -->

</div>


<link rel="stylesheet" href="design/{$settings->theme}/css/tabs.css"/>
<script src="design/{$settings->theme}/js/tabs_click-to-activate.js"></script>

{literal}
<script>
$(function() {
	// Раскраска строк характеристик
	$(".features li:even").addClass('even');
	});
</script>

{/literal}