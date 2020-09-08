<li class="catprod product jsprod">
<div class="b-product-block__bg">
	<div>
		<div class="iprod">
			<div class="ipimage image">
          			<a href="products/{$product->url}"><img src="{$product->image->filename|resize:220:220}" alt="{$product->name|escape}"/></a>
			</div>
			
			<div class="ipname">
				<a href="products/{$product->url}">{$product->name|escape|truncate:75}</a>
			</div>
           {if $product->variants|count > 0}
           {if $product->variant->price|convert == 0}
              <div class="soon">SOON </div>
             {else}
			{*<!-- <form class="variants pis_table cena" action="/cart">
				{if $product->variants|count > 1}
				<div class="blockselect">
					<div class="podipselect">
						<select class="ipselect ajaxselect" name="variant">
						{foreach $product->variants as $v}
							<option value="{$v->id}" {if $v->compare_price > 0}data-compareprice2="{$v->compare_price}" data-proc="- {floor(abs(100-{$v->price}/($v->compare_price)*100))}%" data-compare_price="<span><b>{$v->compare_price|convert}</b> {$currency->sign|escape}</span>"{/if} data-price="<span><b>{$v->price|convert}</b> {$currency->sign|escape}</span>">{$v->name}</option>
						{/foreach}
						</select>
					</div>
				</div>
				{else}
				{foreach $product->variants as $v}
				<input checked name="variant" value="{$v->id}" type="radio" style="display: none;"/>
				{/foreach}
				{/if}
				
				<div class="podcenlist">
					<div class="cenlist iteam">
                    <div class="prc-old"{if $product->variant->compare_price > 0}{else} style="display: none;"{/if}>{if $product->variant->compare_price > 0}<span><b>{$product->variant->compare_price|convert}</b></span>{/if}</div>
						<div class="prc-new"><span><b>{$product->variant->price|convert}</b> {$currency->sign|escape}</span></div>
					</div>
                    {if $product->variant->compare_price > 0}
                <span class="benefit">Скидка<br/><b class="minus" style="color:#fff;">- {floor(($product->variant->compare_price)-{$product->variant->price})|convert}</b> {$currency->sign|escape}</span>
                {/if}
				</div>
				
				<div class="podbtn">
					<button type="submit" class="but addcart i-basket" value="" data-result-text="Хочу еще">В корзину</button>
				</div>
               
			</form>-->*}
			{/if}

			{*<!--фичи-->*}
			{*<div class="fichi">
            
				{if $product->featured}<span class="chit">Хит</span>{/if}
				<span class="cproc" {if $product->variant->compare_price > 0}{else}style="display: none"{/if}>
    <span class="txt">Скидка</span>- {floor(abs(100-{$product->variant->price}/($product->variant->compare_price)*100))}%</span>
                {if $product->is_new}<span class="new">NEW</span>{/if}
			</div>
            *}
            {else}
			<div class="soon">Unavailable</div>
		{/if}
		</div>
	</div>
    </div>
</li>