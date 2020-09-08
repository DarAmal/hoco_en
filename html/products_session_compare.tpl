{if $smarty.get.remove}
    {remove_product_session key=compare remove=$smarty.get.remove}
{/if}
{if $smarty.get.id}
    {add_product_session key=compare id=$smarty.get.id}
{/if}

{get_products var=products get_session_products=compare category_id=$smarty.get.category data_features=1 data_categories=1}

{if $products|count>0}
{foreach $products as $product}
    {foreach $product->options as $o}
        {$compare_features[{$o->feature_id}] = ['id'=>{$o->feature_id},'name'=>{$o->name}]}
        {$compare_products[{$o->product_id}][{$o->feature_id}] = {$o->value}}
        {$products_categories[$product->category->id] = $product->category}
    {/foreach}
{/foreach}

{if $products_categories}
<div id="brands">
	Показать: <a href="/compare" {if !$smarty.get.category}class="selected"{/if}>Все бренды</a>&nbsp;&nbsp;
	{foreach $products_categories as $c}
	<a href="{url params=[category=>$c->id]}" {if $c->id == $smarty.get.category}class="selected"{/if}>{$c->name|escape}</a>
	{/foreach}
</div>
{/if}



<div id='compare_wrap'>
<br />
<TABLE id='compare'>
    <TR>
        <td style="color:#000; width: 23%;">Характеристика</td>
        {foreach $products as $product}
        <td>
            <div id="{$product->id}">
<li class="catprod product jsprod">
<div class="b-product-block__bg">
	<div>
		<div class="iprod">
			<div class="ipimage image">
             {if $product->credit}
               <span class="credit-sign"><span class="txt">Выгодная<br/>рассрочка</span></span>
                {/if}
				<a href="products/{$product->url}"><img src="{$product->image->filename|resize:220:220}" alt="{$product->name|escape}"/></a>
			</div>
			
			<div class="ipname">
				<a href="products/{$product->url}">{$product->name|escape}</a>
			</div>
			<form class="variants pis_table cena" action="/cart">
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
                <span class="benefit">Выгода<br/><b class="minus" style="color:#F00;">{floor(($product->variant->compare_price)-{$product->variant->price})|convert}</b> {$currency->sign|escape}</span>
                {/if}
				</div>
				
				<div class="podbtn">
					<button type="submit" class="but addcart i-basket" value="" data-result-text="Хочу еще">Купить</button>
				</div>
                
                <div class="addbut">
                          
          <!-- Compare -->
          <div class="del-bt">
            <A href="{url params=[category=>$category, id=>null, remove=>$product->id]}" >
            <span class='mylist_add active' rel="tooltip" title="Удалить"><em class='i-cancel-3'></em></span>
            </A>
            </div>
        <!-- End Compare -->
        
         </div>
         
			</form>
			
			{*<!--фичи-->*}
			<div class="fichi">
				{if $product->featured}<span class="chit">Хит</span>{/if}
				<span class="cproc" {if $product->variant->compare_price > 0}{else}style="display: none"{/if}>
                <span class="txt">Скидка</span>- {floor(abs(100-{$product->variant->price}/($product->variant->compare_price)*100))}%</span>
			</div>
            
		</div>
	</div>
    </div>
</li>
                    		
					
				</div>
            
           
            {$category=$smarty.get.category}
            {if $products|count==1}{$category=null}{/if}
            
         
        </td>
        {/foreach}
    </TR>
    {foreach $compare_features as $f}
    <TR>
        <TD style="color:#999;">{$f.name}</TD>
        {foreach $products as $product}
        <TD>{if {$compare_products.{$product->id}.{$f.id}}}{$compare_products.{$product->id}.{$f.id}}{else}-{/if}</TD>
        {/foreach}
    </TR>
    {/foreach}
</TABLE>
</div>
{else}
    Список сравнения пуст! Выберите модели для сравнения характеристик.
  
  <br /> <br />  

{/if}

{literal}
<SCRIPT>
$(function() {
$('a.get_compare').fancybox({'href' : '#compare'});
    $("#compare tr:odd").addClass('odd');
    $('.this_hide').click(function(){
      var idx =$(this).parent().index();
      $('#compare tr').each(function(index) {
        $(this).find('td').eq(idx).hide();
      });
      return false;
    })
});
</SCRIPT>
{/literal}
