{if $cart->total_products>0}
	<span class="cionecitwo">		
        <span class="i-cart"></span>
        <span class="cione">{$cart->total_products}</span>
        <span class="citwo">
				{$cart->total_price|convert} {$currency->sign}
			</span>
	</span>
	
{else}
	<span class="pusto"><span class="i-cart"></span> <span class="txt">Корзина пуста</span></span>
{/if}

{if $module !=='CartView'}
	<span class="opencartmodal" onclick="$('.minicart').fadeIn(300); $('.minicart').removeClass('hides'); return false;"></span>
	<div class="minicart hides">
		<div class="minctitle">
			<span class="mctnam">{if $cart->purchases}В корзине {$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}{else}Корзина пуста{/if}</span>
			<span class="mcclose" onclick="$('.minicart').fadeOut(300); $('.minicart').addClass('hides'); return false;"></span>
		</div>
		<div class="podtablescroll">
			<div class="mctable">
				{foreach $cart->purchases as $purchase}
				<div class="mcitem item_cart_{$purchase->new_variant_id}">
					{$image = $purchase->product->images|first}
					{if $image}
					<div class="mcimg">
						<a href="products/{$purchase->product->url}"><img src="{$image->filename|resize:50:50}" alt="{$purchase->product->name|escape}"></a>
					</div>
					{/if}
					
					<div class="mcname">
						<a href="products/{$purchase->product->url}">{$purchase->product->name|escape}{if $purchase->variant->name} <span>{$purchase->variant->name|escape}</span>{/if}</a>
						{if $purchase->properties}
						{foreach $purchase->properties as $property}
						<div class="carproper">
							<div>{$property['name']} (+{$property['price']|convert} {$currency->sign|escape})</div>
						</div>
						{/foreach}
						{/if}
						{if $purchase->variant->compare_price}
						<div class="carskidka">
						Скидка {floor(abs(100-{$purchase->variant->price}/($purchase->variant->compare_price)*100))} %
						</div>
						{/if}
					</div>
					
					<div class="mcamount">
						<div class="amountposit">
							<div class="amount">
								<input class="add_input" name="amounts{$purchase->new_variant_id}" onchange="update_minicart('{$purchase->new_variant_id}',$(this).val(),{$purchase->variant->price}{if $purchase->variant->compare_price},{$purchase->variant->compare_price}{/if});" type="text" value="{$purchase->amount}" min="1" max="10" data-variant="{$purchase->new_variant_id}" autocomplete="off" role="spinbutton">
								<span class="minus mcartminus">-</span>
								<span class="plus mcartplus">+</span>
							</div>
						</div>

					</div>
					
					<div class="mcprice total_mcprice_{$purchase->new_variant_id}">
						{if $purchase->variant->compare_price}
						<span class="cpcar"><span class="old_price_{$purchase->new_variant_id}">{($purchase->variant->compare_price*$purchase->amount)|convert}</span> {$currency->sign}</span>
						<br/>
						{/if}
						<span class="price_{$purchase->new_variant_id}">{($purchase->variant->price*$purchase->amount)|convert}</span> {$currency->sign}
					</div>
					
					<div class="mcardel">
						<a href="#" class="cartdelete mcardel" onclick="remove_item_minicart('{$purchase->new_variant_id}'); return false"></a>
					</div>
					
				</div>
				{/foreach}
			</div>
		</div>
		<div class="mcitogo">
			<span class="mcit">
				Итого: {$cart->total_price|convert} {$currency->sign}
			</span>
			<div class="butki">
				<a class="knop" href="#" onclick="$('.minicart').fadeOut(300); $('.minicart').addClass('hides'); return false;">&laquo; Продолжить покупку</a>
				<a class="knop next" href="/cart/">Оформить заказ &raquo;</a>
			</div>
		</div>
	</div>
	
	{/if}
    
{literal}
	<script>
	function update_minicart(new_variant_id,amount,price,old_price)
	{
		$.ajax({
			url: "ajax/minicart.php",
			data: {'new_variant_id':new_variant_id,'amount':amount},
			success: function(data){
				if(data){
					$('.mctnam').html(data.mctnam);
					$('.mcitogo').html(data.mcitogo);
                    $('.cione').html(data.cione);
					$('.pusto').html(data.pusto);
					$('.citwo').html(data.citwo);
					
					var str = price*amount;
					$('.price_'+new_variant_id).text(str.toLocaleString());	
					
					if(old_price) {
						var str_old = old_price*amount;
						$('.old_price_'+new_variant_id).text(str_old.toLocaleString());
					}
				}
			}
		});

	}

	function remove_item_minicart(remove_id)
	{
		$.ajax({
			url: "ajax/minicart.php",
			data: {'remove_id':remove_id},
			success: function(data){
				if(data){
					$('.mctnam').html(data.mctnam);
					$('.mcitogo').html(data.mcitogo);
					$('.item_cart_'+remove_id).slideUp(300);
    	            $('.cione').html(data.cione);
                    $('.pusto').html(data.pusto);
					$('.citwo').html(data.citwo);
				}
			} 
		});
	}
	</script>
	{/literal}
