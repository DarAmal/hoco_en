{$canonical="/news/{$post->url}" scope=parent}

{*<!-- Хлебные крошки -->*}
<ul class="path">
	<li><a href="/">Home</a></li>
	<li><a href="/news">News</a></li>
	<li><span>{$post->name|escape}</span></li>
</ul>
{*<!-- END Хлебные крошки -->*}

<h1 class="phead">{$post->name|escape}</h1>
<span class="i-calendar">{$post->date|date}</span><br/>

<div class="newstext mar-b-50">
	<a class="npimg" href="{$post->image|resizeblog:1920:0}" data-fancybox="example-set-{$post->id}">
		<img src="{$post->image|resizeblog:450:0}" alt="{$post->name|escape}" />
	</a>
	{$post->text}
</div>

<div class="allbumshare mar-b-30 pad-t-15">
		<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
		<script src="//yastatic.net/share2/share.js"></script>
		<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,viber,whatsapp,telegram"></div>
	</div>
{get_posts var=last_posts limit=4}
{if $last_posts}
<h2 class="mar-b-30">Другие события...</h2>
<ul class="relatednews">
	{foreach $last_posts as $relatedpost}
	{if $relatedpost->id != $post->id}
	<li>
		<b>{$relatedpost->name|escape}</b>
		<span>{$relatedpost->annotation}</span>
		<a href="news/{$relatedpost->url}" data-tip="Читать полностью &raquo;" class="more_icon"><i></i><i></i><i></i></a>
	</li>
	{/if}
	{/foreach}
</ul>
{/if}