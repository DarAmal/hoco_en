{if $categories}
{$first_category = $category->path|first}
{$last_category = $category->path[($category->path)|count-2]}

{if $level == 0}
<div class="mmnav">
	<ul>
	{foreach item=c from=$categories}
	{if $c->visible}
		<li class="{if $category->id == $c->id}active{/if} {if $first_category->id == $c->id}active{/if}">
			{if $c->subcategories}
			<a class="msub" href="#">{$c->name}</a>
			{else}
			<a href="catalog/{$c->url}">{$c->name}</a>
			{/if}
			{if $c->subcategories}{include file='mmenu.tpl' categories=$c->subcategories level=1}{/if}
		</li>
	{/if}
	{/foreach}
     {get_dmenus var=dmenu7 group_id=7}
			{function name=dmenu_tree7}
				{if $dmenu7}
				{foreach $dmenu7 as $dm}
					{if $dm->visible}
                    <li class="{if $dm->url == $smarty.server.REQUEST_URI}active{/if}">
                        {if $dm->submenus}
                        <a class="msub" href="#">{$dm->name|escape}</a>
                        {else}
                        <a href="{$dm->url}">{$dm->name|escape}</a>
                        {/if}
					</li>
    				{/if}
				{/foreach}
				{/if}
			{/function}
			{dmenu_tree7 dmenu7=$dmenu7}
	</ul>
	<div class="mmcenterlink">
		<a href="/products">Весь каталог &raquo;</a>
	</div>
    
    <div class="max">
	<div class="mobtable">
		<div class="zeblock">
			<div class="zenam">О нас</div>
			<div class="zenam mob">О нас</div>
			{get_dmenus var=dmenu3 group_id=3}
			{function name=dmenu_tree3}
				{if $dmenu3}
				<ul>
				{foreach $dmenu3 as $dm}
					{if $dm->visible}
						<li{if $dm->url == $smarty.server.REQUEST_URI} class="selected"{/if}>
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
			{dmenu_tree3 dmenu3=$dmenu3}
		</div>
        
        <div class="zeblock">
			<div class="zenam">В помощь</div>
			<div class="zenam mob">В помощь</div>
			{get_dmenus var=dmenu5 group_id=5}
			{function name=dmenu_tree5}
				{if $dmenu5}
				<ul>
				{foreach $dmenu5 as $dm}
					{if $dm->visible}
						<li{if $dm->url == $smarty.server.REQUEST_URI} class="selected"{/if}>
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
			{dmenu_tree5 dmenu5=$dmenu5}
		</div>
		</div>
         <div class="zecopy">
    <img src="design/{$settings->theme|escape}/images/foot_log.png" title="{$settings->site_name|escape}" alt="{$settings->site_name|escape}"/>
        <br/>
        <span>
        Найдите свои защитные чехлы, кабели, колонки, наушники, мобильные аккумуляторы, зарядные устройства и многое другое от <strong>hoco.</strong> Мы создаем широчайший ассортимент мобильных аксессуаров премиум-класса по доступным ценам.
        </span>		
	</div>
    
    	<div class="zecontact">
		{if $settings->vkontakte || $settings->twitter || $settings->instagram || $settings->youtube || $settings->facebook || $settings->odnoklassniki}
		<div class="socblock">
        {if $settings->facebook}<a href="{$settings->facebook}" target="_blank"><span class="i-facebook-squared-1"></span></a>{/if}
		{if $settings->instagram}<a href="{$settings->instagram}" target="_blank"><span class="i-instagram"></span></a>{/if}
        {if $settings->odnoklassniki}<a href="{$settings->odnoklassniki}" target="_blank"><img src="design/{$settings->theme}/images/odnoklassniki.png" alt="" /></a>{/if}
        {if $settings->twitter}<a href="{$settings->twitter}" target="_blank"><img src="design/{$settings->theme}/images/twitter.png" alt="" /></a>{/if}
		{if $settings->youtube}<a href="{$settings->youtube}" target="_blank"><img src="design/{$settings->theme}/images/youtube.png" alt="" /></a>{/if}
        {if $settings->vkontakte}<a href="{$settings->vkontakte}" target="_blank"><img src="design/{$settings->theme}/images/vk.png" alt="" /></a>{/if}</div>{/if}
	</div>
        </div>
        
       
        
</div>
{/if}




{if $level == 1}
<div class="mmenu{$c->id}">
	<ul>
	{foreach item=c from=$categories}
	{if $c->visible}
		<li class="{if $category->id == $c->id}active{/if} {if $last_category->id == $c->id}active{/if}">
			{if $c->subcategories}
			<a class="msub" href="#">{$c->name}</a>
			{else}
			<a href="catalog/{$c->url}">{$c->name}</a>
			{/if}
			{if $c->subcategories}{include file='mmenu.tpl' categories=$c->subcategories level=2}{/if}
		</li>
	{/if}
	{/foreach}
	</ul>
</div>
{/if}

{if $level == 2}
<div class="mmenu{$c->id}">
	<ul>
		<li>
			<a href="catalog/{$c->url}"><b>Все {$c->name}</b></a>
		</li>
	{foreach item=c from=$categories}
	{if $c->visible}
		<li class="{if $category->id == $c->id}active{/if} {if $last_category->id == $c->id}active{/if}">
			{if $c->subcategories}
			<a class="msub" href="#">{$c->name}</a>
			{else}
			<a href="catalog/{$c->url}">{$c->name}</a>
			{/if}
			{if $c->subcategories}{include file='mmenu.tpl' categories=$c->subcategories level=3}{/if}
		</li>
	{/if}
	{/foreach}
	</ul>
</div>
{/if}

{if $level == 3}
<div class="mmenu{$c->id}">
	<ul>
		<li>
			<a href="catalog/{$c->url}"><b>Все {$c->name}</b></a>
		</li>
	{foreach item=c from=$categories}
	{if $c->visible}
		<li class="{if $category->id == $c->id}active{/if} {if $last_category->id == $c->id}active{/if}">
			{if $c->subcategories}
			<a class="msub" href="#">{$c->name}</a>
			{else}
			<a href="catalog/{$c->url}">{$c->name}</a>
			{/if}
			{if $c->subcategories}{include file='mmenu.tpl' categories=$c->subcategories level=4}{/if}
		</li>
	{/if}
	{/foreach}
	</ul>
</div>
{/if}

{/if}