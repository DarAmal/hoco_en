{if $categories}
{$first_category = $category->path|first}
{$last_category = $category->path[($category->path)|count-2]}


{if $level == 0}
<div id="nav">
	<div class="podmobnav">
		<a href="#" class="navtoggle bluron i-menu"></a>
		<div class="nav">
			{foreach item=c from=$categories}
			{if $c->visible}
				<div class="navone {if $category->id == $c->id}selected{/if} {if $first_category->id == $c->id}selected{/if}">
					<a>{if $c->image}<img class="cat" src="{$config->categories_images_dir}{$c->image}" alt="{$c->name}">{/if}
					<span{if $c->subcategories} class="i-angle-down"{/if}>{$c->name}</span></a>
					{if $c->subcategories}{include file='categories.tpl' categories=$c->subcategories level=1}{/if}
				</div>
			{/if}
			{/foreach}
            {get_dmenus var=dmenu7 group_id=7}
			{function name=dmenu_tree7}
				{if $dmenu7}
				{foreach $dmenu7 as $dm}
					{if $dm->visible}
                    <div class="navone {if $dm->url == 'new'} action{/if}{if $dm->url == $smarty.server.REQUEST_URI} class="selected"{/if}">
					<a href="{$dm->url}">
								{if $dm->submenus}
								<span>{$dm->name|escape}</span>
								{else}
								{$dm->name|escape}
								{/if}
					</a>
				</div>
					{/if}
				{/foreach}
				{/if}
			{/function}
			{dmenu_tree7 dmenu7=$dmenu7}
		</div>
	</div>
	          
	<div class="appendcart"></div>
</div>
{/if}

{if $level == 1}
<div id="nav1">
	<div>
		<div class="podnavtwo">
		{foreach item=c from=$categories}
		{if $c->visible}
			<div class="navtwo {if $category->id == $c->id}selected{/if} {if $last_category->id == $c->id}selected{/if}">
             	<a href="catalog/{$c->url}">
                {if $c->image}<img class="cat" src="{$config->categories_images_dir}{$c->image}" alt="{$c->name}">{/if}
                 <span{if $c->subcategories} class="i-angle-right"{/if}>{$c->name}</span></a>
				{if $c->subcategories}{include file='categories.tpl' categories=$c->subcategories level=2}{/if}
			</div>
		{/if}
		{/foreach}
		</div>
	</div>
</div>

{/if}

{if $level == 2}
<div>
	<div>
		<div class="podnavtwo">
		{foreach item=c from=$categories}
		{if $c->visible}
			<div class="navtwo {if $category->id == $c->id}selected{/if} {if $last_category->id == $c->id}selected{/if}">
             	<a href="catalog/{$c->url}"><span{if $c->subcategories} class="sub"{/if}>{$c->name}</span></a>
				{if $c->subcategories}{include file='categories.tpl' categories=$c->subcategories level=3}{/if}
			</div>
		{/if}
		{/foreach}
		</div>
	</div>
</div>
{/if}

{if $level == 3}
<div>
	<div>
		<div class="podnavtwo">
		{foreach item=c from=$categories}
		{if $c->visible}
			<div class="navtwo {if $category->id == $c->id}selected{/if} {if $last_category->id == $c->id}selected{/if}">
             	<a href="catalog/{$c->url}"><span{if $c->subcategories} class="sub"{/if}>{$c->name}</span></a>
				{if $c->subcategories}{include file='categories.tpl' categories=$c->subcategories level=4}{/if}
			</div>
		{/if}
		{/foreach}
		</div>
	</div>
</div>
{/if}

{/if}

{*  <div class="overlay{if $module==MainView} pro{/if}"></div> *}

