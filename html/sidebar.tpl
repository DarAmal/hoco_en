{if $category}
{if $category->brands || $category->whoms || $category->events || $features}
<div id="filter">
	{include file='filter.tpl'}
</div>
{/if} 
{else}
{if $brands || $whoms || $events || $features}
<div id="filter">
	{include file='filter.tpl'}
</div>
{/if} 
{/if}

{if $module=='ProductsView' || $module=='ProductView'}
{*<!--меню-->*}
<ul class="sid_left_menu">
    {if $category->subcategories}
        {$cats=$category->subcategories}
    {elseif $category->parent_id==0}
        {$cats=$categories}
    {else}
        {$cats=$category->path[($category->path)|count-2]->subcategories}
    {/if}
    {foreach $cats as $c}
	{if $c->visible}
		<li {if $category->id == $c->id}class="active"{/if}>
			<a href="catalog/{$c->url}">{$c->name|escape}</a>
		</li>
	{/if}
	{/foreach}
</ul>
{*<!--END меню-->*}
{else}
{*<!--меню-->*}
{get_dmenus var=dmenu4 group_id=4}
{function name=dmenu_tree4}
{if $dmenu4}
<ul class="sid_left_menu">
{foreach $dmenu4 as $dm}
	{if $dm->visible}
		<li {if $dm->url == $smarty.server.REQUEST_URI}class="active"{/if}>
			<a href="{$dm->url}">
				{if $dm->submenus}
				<span>{$dm->name|escape}</span>
				{else}
				{$dm->name|escape}
				{/if}
			</a>
		</li>
	{/if}
{/foreach}
</ul>
{/if}
{/function}
{dmenu_tree4 dmenu4=$dmenu4}
{*<!--END меню-->*}
{/if}

<br/>
{if $module==BlogView}{else}
{*<!--Последние новости-->*}
{get_posts var=last_posts limit=2}
{if $last_posts}
<div class="sidblock">
	<h3>Наши новости</h3>
	{foreach $last_posts as $post}
	<div class="biteam">
		<span class="i-calendar"> {$post->date|date}</span>
		<a href="news/{$post->url}">{$post->name|escape}</a>
		<span>{$post->annotation}</span>
	</div>
	{/foreach}
	<div class="alllink"><a href="/news">Все новости</a></div>
</div>
{/if}
{*<!--END Последние новости-->*}
{/if}