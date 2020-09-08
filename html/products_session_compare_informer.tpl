{if $session->count > 0}
<a href="/compare"><span id="compare_informer1" class="i-chart-bar-2 active">
 <span class="num">{$session->count}</span>
 </span>
 </a>
 <div class="open-panel">
		<div class="item-in-cart clearfix">
        <h1>Сравнение</h1>
			<p class="empty">К сравнению характеристик <b>{$session->count}</b> {$session->count|plural:'товар':'товаров':'товара'}</p>
            <div class="but"><a href="/compare" class="but">Перейти в раздел <em class="i-right-dir"></em></a></div>
		</div>
	</div>
    
{else}
	<span id="compare_informer2" class="i-chart-bar-2"></span>
    <div class="open-panel">
		<div class="item-in-cart clearfix">
        <h1>Сравнение</h1>
			<p class="empty">Сравните товары по характеристикам!</p>
		</div>
	</div>
{/if}

