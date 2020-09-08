{* Список товаров *}

{* Канонический адрес страницы *}
{if $category && $brand}
{$canonical="/catalog/{$category->url}/{$brand->url}" scope=parent}
{elseif $category && $whom}
{$canonical="/catalog/{$category->url}/whom/{$whom->url}" scope=parent}
{elseif $category && $event}
{$canonical="/catalog/{$category->url}/event/{$event->url}" scope=parent}
{elseif $category}
{$canonical="/catalog/{$category->url}" scope=parent}
{elseif $brand}
{$canonical="/brands/{$brand->url}" scope=parent}
{elseif $whom}
{$canonical="/whoms/{$whom->url}" scope=parent}
{elseif $event}
{$canonical="/events/{$event->url}" scope=parent}
{elseif $keyword}
{$canonical="/products?keyword={$keyword|escape}" scope=parent}
{else}
{$canonical="/products" scope=parent}
{/if}
{get_session_products key=wishlist}

<!-- Хлебные крошки /-->
<ul class="path">
	<li><a href="/">Home</a></li>
	<li><a href="/products">Catalog</a></li>
	{if $category}
	{foreach $category->path as $cat}
		{* <!--if $cat@last || !$brand
		<li><span>{$cat->name|escape}</span></li>
		{* <!--else--> *}
		<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
		{* <!--/if--> *}
	{/foreach}
	{if $brand}
	<li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a></li>
	{/if}
	{if $whom}
	<li><a href="catalog/{$cat->url}/whom/{$whom->url}">{$whom->name|escape}</a></li>
	{/if}
	{if $event}
	<li><a href="catalog/{$cat->url}/event/{$event->url}">{$event->name|escape}</a></li>
	{/if}
	{elseif $brand}
	<li><a href="brands/{$brand->url}">{$brand->name|escape}</a></li>
	{elseif $whom}
	<li><a href="whoms/{$whom->url}">{$whom->name|escape}</a></li>
	{elseif $event}
	<li><a href="events/{$event->url}">{$event->name|escape}</a></li>
	{elseif $keyword}
	<li><span>Поиск</span></li>
	{/if}
</ul>
<!-- Хлебные крошки #End /-->

{* Заголовок страницы *}
<div class="pspage">
	{if $keyword}
	<h1 class="phead">Search {$keyword|escape}</h1>
	{elseif $page}
	<h1 class="phead">{$page->name|escape}</h1>
	{else}
	<h1 class="phead">{$category->name|escape} {$brand->name|escape} {$whom->name|escape} {$event->name|escape}</h1>
	{/if}
	
    {* Фильтр по свойствам *}
{if $features}
<div id="features">
	{foreach $features as $key=>$f}
	<div class="feature_values">
		{foreach $f->options as $o}
		<a href="{url params=[$f->id=>$o->value, page=>null]}" {if $smarty.get.$key == $o->value}class="selected"{/if}>{$o->value|escape}</a>
		{/foreach}
        <a href="{url params=[$f->id=>null, page=>null]}" {if !$smarty.get.$key}class="selected"{/if}>Все</a>		
	</div>
	{/foreach}
</div>
{/if}

	{if $products}
	<div class="fil">
		<ul class="samopal">
			<li>
				<span>
					{if $sort=='position'}
					<b>Sort by default <i class="i-down-dir"></i></b>
					{elseif $sort=='name_asc'}
					<b>By name from A to Z</b>
					{elseif $sort=='name_desc'}
					<b>By name from Z to A</b>
					{elseif $sort=='price_asc'}
					<b>By price: low to high</b>
					{elseif $sort=='price_desc'}
					<b>By price:high to low</b>
					{/if}
				</span>
				<ul class="drops">
					<li><a {if $sort=='position'}class="selected"{/if} href="{url sort=position page=null}">Sort by default</a></li>
					<li><a {if $sort=='name_asc'}class="selected"{/if} href="{url sort=name_asc page=null}">By name from A to Z</a></li>
					<li><a {if $sort=='name_desc'}class="selected"{/if} href="{url sort=name_desc page=null}">By name from Z to A</a></li>
					<li><a {if $sort=='price_asc'}class="selected"{/if} href="{url sort=price_asc page=null}">By price: low to high</a></li>
					<li><a {if $sort=='price_desc'}class="selected"{/if} href="{url sort=price_desc page=null}">By price:high to low</a></li>
				</ul>
			</li>
		</ul>
	</div>
	{/if}
</div>

{if $products}


<div class="related">
<ul class="catprods">
{foreach $products as $product}
    {include file='product_iteam.tpl'}
{/foreach}
</ul>
</div>

{include file='pagination.tpl'}	
{else}
No items found.
{/if}



{if $current_page_num==1}
{if $page->body}
<div class="prodopis">
<div class="maxtext">
{$page->body}
</div>
</div>
{/if}
{/if}

{if $current_page_num==1}
{if $category->description}
<div class="prodopis">
<div class="maxtext">
{$category->description}
</div>
</div>
{/if}
{/if}

{if $current_page_num==1}
{if $brand->description}
<div class="prodopis">
<div class="maxtext">
{$brand->description}
</div>
</div>
{/if}
{/if}

{if $current_page_num==1}
{if $whom->description}
<div class="prodopis">
<div class="maxtext">
{$whom->description}
</div>
</div>
{/if}
{/if}

{if $current_page_num==1}
{if $event->description}
<div class="prodopis">
<div class="maxtext">
{$event->description}
</div>
</div>
{/if}
{/if}