{* Страница с картой сайта *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<div class="max pad-t-30 pad-b-50">
{*<!-- Хлебные крошки -->*}
<ul class="path">
	<li><a href="/">Главная</a></li>
	<li><span>Карта сайта</span></li>
</ul>
{*<!-- END Хлебные крошки -->*}

<div class="block-text">
    <h1 class="title">Карта сайта</h1>

 <!-- {if $posts}
    <div class="posts">
        <ul>
    {foreach $posts as $p}
            <li><a href="{$p->url}">{$p->header}</a></li>   
    {/foreach}
        </ul>
    </div>
    {/if}
 -->
    {if $cats}
    <div class="maps">
    
    {function name=cat_prod}
    {if $prod}
        <ul class="product">
        {foreach $prod as $p}
            <li><a href="products/{$p->url}">{$p->name}</a></li>
        {/foreach}
        </ul>
    {/if}
    {/function}    
    
    {function name=cat_tree}
    {if $cats}
        <ul>
        {foreach $cats as $c}
            {* Показываем только видимые категории *}
            {if $c->visible}
                <li><a href="catalog/{$c->url}">{$c->name}</a>
                    {cat_tree cats=$c->subcategories}
                    {cat_prod prod=$c->products}
                </li>
            {/if}
        {/foreach}
        </ul>
    {/if}
    {/function}
    
    {cat_tree cats=$cats} 
    </div>
    {/if}
    <br/>
    <strong>Дополнительные разделы</strong>
     {if $pages}
    <div class="pages">
        <ul>
    {foreach $pages as $p}
            <li {if $p->url == '404' || $p->url == 'sitemap'}style=display:none;{/if}><a href="{$p->url}">{$p->header}</a></li>   
    {/foreach}
        </ul>
    </div>
    {/if}
    
</div>
</div>