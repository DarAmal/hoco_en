{$canonical="/{$page->url}" scope=parent}

{*<!-- Хлебные крошки -->*}
<ul class="path">
	<li><a href="/">Home</a></li>
	<li><span>{$page->header|escape}</span></li>
</ul>
{*<!-- END Хлебные крошки -->*}

<h1 class="phead" data-page="{$page->id}">{$page->header|escape}</h1>

<div class="txt">
{$page->body}
</div>

{if $page->url == 'compare'}
    {include file='products_session_compare.tpl'}
{/if}

{if $page->url == 'reviews'}
    {include file='reviews.tpl'}
{elseif $page->url == 'wishlist'}
    {include file='products_session_wishlist.tpl'}
{/if}

<br/>
<div class="allbumshare mar-b-30 pad-t-15">
		<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
		<script src="//yastatic.net/share2/share.js"></script>
		<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,viber,whatsapp,telegram"></div>
	</div>