{* Страница с формой обратной связи *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<div class="max pad-t-30 pad-b-50">
{*<!-- Хлебные крошки -->*}
<ul class="path two">
	<li><a href="/">Главная</a></li>
	<li><span>{$page->header|escape}</span></li>
</ul>
{*<!-- END Хлебные крошки -->*}

<h1 class="phead" data-page="{$page->id}">{$page->header|escape}</h1>

<div class="section">
	<article class="post">
		<div class="post-inner">
			{$page->body}
            
		</div>
	</article>
    
    <div class="opening-time">
				<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A69770e8ea0c98cfa7bd4335fb1dde5c202e95ba67143ab82da642ae42baca7d0&amp;width=600&amp;height=300&amp;lang=ru_RU&amp;scroll=true"></script>
					</div>
				</div>
</div>

</div>