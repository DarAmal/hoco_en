  {get_browsed_products var=browsed_products limit=5}
             {if $browsed_products}
			<div class="related browsed">
                <h2 class="pad-t-50 mar-b-30">Recently viewed products</h2>
                <ul class="catprods">
				{foreach $browsed_products as $browsed_product}
				<li class="image">
                <a href="products/{$browsed_product->url}"><img src="{if $browsed_product->image}{$browsed_product->image->filename|resize:150:150}{else}design/{$settings->theme}/images/bg/nofoto.png{/if}" alt="{$browsed_product->name}" title="{$browsed_product->name}">         
                <span class="name">{$browsed_product->name}</span>
               </a>
              {if $browsed_product->variants[0]|count > 0}
             {*<!--<div class="price">{$browsed_product->variants[0]->price|convert} {$currency->sign|escape}</div>-->*}
                {else}
                Not available
                 {/if}
				</li>		
				{/foreach}
			</ul></div>
			{/if}
  