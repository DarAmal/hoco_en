{$wrapper = 'index.tpl' scope=parent}
{$canonical="" scope=parent}
{get_session_products key=wishlist}


{*<!--Слайдер-->*}{include file='banner/slider_1.tpl'}
	
    
 <!--Новинки--> 
<div class="catmob">{get_is_new_products var=new_products limit=4 visible=1}
{if $new_products}
<div class="maintitle mar-b-50 new">
<span><a href="/new">NEW ARRIVAL</a></span><span class="line"></span></div>
<div class="max new">
	<div class="related">
                <ul class="catprods">
               {foreach $new_products as $product name=product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/new">All hoco. New</a></div>
    </div>
{/if}
</div>
<div class="cat" style="margin-top:-20px;">{get_is_new_products var=new_products limit=8 visible=1}
{if $new_products}
<div class="maintitle mar-b-50 new">
<span><a href="/new" rel="tooltip" title='All hoco. New'>NEW ARRIVAL</a></span><span class="line"></span></div>
<div class="max new">
	<div class="related">
                <ul class="catprods">
               {foreach $new_products as $product name=product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/new">All hoco. New</a></div>
</div>
{/if}</div>


{* <!--Акция--> *}
<div class="catmob">{get_action_products var=new_products limit=4 visible=1}
{if $new_products}
<div class="maintitle mar-b-50 action">
<span><a href="/action">Акция</a></span><span class="line"></span></div>
<div class="max action">
	<div class="related">
                <ul class="catprods">
               {foreach $new_products as $product name=product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/action">Все товары Акции</a></div>
    </div>
{/if}
</div>

<div class="cat">{get_action_products var=new_products limit=12 visible=1}
{if $new_products}
<div class="maintitle mar-b-50 action">
<span><a href="/action" rel="tooltip" title='Все товары Акции'>Акция</a></span><span class="line"></span></div>
<div class="max action">
	<div class="related">
                <ul class="catprods">
               {foreach $new_products as $product name=product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/action">Все товары Акции</a></div>
</div>
{/if}</div>

{*<!--Слайдер-->*}{include file='banner/slider_2.tpl'}

{* <!--Скидки Mob--> *}
<div class="catmob">{get_discounted_products var=discounted_products limit=4}
{if $discounted_products}
<div class="maintitle mar-b-50 sale">
<span><a href="/sale">Акция</a></span><span class="line"></span></div>
<div class="max sale">
	<div class="related">
                <ul class="catprods">
               {foreach $discounted_products as $product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/sale">Все Скидки каталога</a></div>
</div>
{/if}
</div>

{* <!--Скидки--> *}
<div class="cat" style="margin-top:-20px;">{get_discounted_products var=discounted_products limit=12}
{if $discounted_products}
<div class="maintitle mar-b-50 sale">
<span><a href="/sale" rel="tooltip" title='Все Скидки каталога'>Акция</a></span><span class="line"></span></div>
<div class="max sale">
	<div class="related">
                <ul class="catprods">
               {foreach $discounted_products as $product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
	<div class="alllink pad-t-30"><a href="/sale">Все Скидки каталога</a></div>
</div>
{/if}</div>

{*<!--Слайдер-->*}{include file='banner/slider_3.tpl'}


<div class="cat" style="margin-top:-20px;">
{get_posts var=last_posts limit=3}
{if $last_posts}
<div class="maintitle mar-b-50 news">
<span class="title"><a href="/news" rel="tooltip" title='All Events'>Latest news</a></span><span class="line"></span></div>
<div class="max news">
	<div class="lastcomnews">
		{foreach $last_posts as $post}
	       <div class="iteamlastnews">
				{if $post->image}<a class="lpimg" href="news/{$post->url}"><span><span><img src="{$post->image|resizeblog:400:250}" alt="{$post->name|escape}" /></span></span></a>{/if}
				<a class="lpname" href="news/{$post->url}">{$post->name}</a>
                <span class="day">{$post->date|date}</span>
			</div>
		{/foreach}
	</div>
	
	<div class="alllink pad-t-30"><a href="/news">All Events</a></div>
</div>
{/if}</div>
