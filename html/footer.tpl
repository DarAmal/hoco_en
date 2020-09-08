<div class="newsblock">
<div class="mainfeatured">
	<div class="max">
		<form id="mail_form" class="mail_form validate" method="post">
			<div class="mailtable">
				<div class="mt_text"><span class="i-mail-4"></span>
					New products, Sales, Offers! 
				</div>
				<span class="podimmail">
				<input class="onemail" type="email" name="email" value="{$callback_email}" placeholder="Your Email" required/>
				<button class="btnmail but" type="submit" name="callback" value="">Subscribe</button>
				    </span>
				
			</div>
		</form>
		<div class='sendonecloic'>
			<b>Спасибо за подписку!</b>
			Теперь Вы всегда будете в курсе новостей и акций.
		</div>
	</div>
</div>
</div>


<div class="mar-b-50 footer">
<div class="max">
	<div class="mobtable">
		<div class="zeblock">
			<div class="zenam">ABOUT</div>
			<div class="zenam mob">ABOUT</div>
			{get_dmenus var=dmenu3 group_id=3}
			{function name=dmenu_tree3}
				{if $dmenu3}
				<ul class="about">
				{foreach $dmenu3 as $dm}
					{if $dm->visible}
						<li{if $dm->url == $smarty.server.REQUEST_URI} class="selected"{/if}>
							<a href="{$dm->url}">
                            {if $dm->url == 'about'}<i class="i-globe-1"></i>{/if}
                            {if $dm->url == 'contact'}<i class="i-mail-2"></i>{/if}
                            {if $dm->url == 'dealers'}<i class="i-users"></i>{/if}
                            {if $dm->url == 'authenticity'}<i class="i-check-2"></i>{/if}
                            {if $dm->url == 'warranty'}<i class="i-thumbs-up"></i>{/if}
                            {if $dm->url == 'news'}<i class="i-calendar"></i>{/if}
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
			<div class="zenam">INFO</div>
			<div class="zenam mob">INFO</div>
			{get_dmenus var=dmenu5 group_id=5}
			{function name=dmenu_tree5}
				{if $dmenu5}
				<ul class="help">
				{foreach $dmenu5 as $dm}
					{if $dm->visible}
						<li{if $dm->url == $smarty.server.REQUEST_URI} class="selected"{/if}>
							<a href="{$dm->url}">
                            {if $dm->url == 'delivery'}<i class="i-truck"></i>{/if}
                            {if $dm->url == 'shops'}<i class="i-location-outline"></i>{/if}
                            {if $dm->url == 'products'}<i class="i-docs-1"></i>{/if}
                            {if $dm->url == 'sitemap'}<i class="i-sitemap"></i>{/if}
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
       Find your phone protective cases, cables, speakers, headphones, mobile batteries, chargers and more from <strong>hoco.</strong> We create the widest range of premium accessories at affordable prices.
       </span>		
	</div>
	
	<div class="zecontact">
		<span class="tel"><a href="tel:+992488880808">{$settings->zphone1}</a></span>
        <div>{$settings->zphone2}</div>
		<div>{$settings->zrezhim}</div>        
		{if $settings->vkontakte || $settings->twitter || $settings->instagram || $settings->youtube || $settings->facebook || $settings->odnoklassniki}
		<div class="socblock">
        {if $settings->facebook}<a href="{$settings->facebook}" target="_blank"><span class="i-facebook-squared-1"></span></a>{/if}
		{if $settings->instagram}<a href="{$settings->instagram}" target="_blank"><span class="i-instagram"></span></a>{/if}
        {if $settings->odnoklassniki}<a href="{$settings->odnoklassniki}" target="_blank"><img src="design/{$settings->theme}/images/odnoklassniki.png" alt="" /></a>{/if}
        {if $settings->twitter}<a href="{$settings->twitter}" target="_blank"><img src="design/{$settings->theme}/images/twitter.png" alt="" /></a>{/if}
		{if $settings->youtube}<a href="{$settings->youtube}" target="_blank"><img src="design/{$settings->theme}/images/youtube.png" alt="" /></a>{/if}
        {if $settings->vkontakte}<a href="{$settings->vkontakte}" target="_blank"><img src="design/{$settings->theme}/images/vk.png" alt="" /></a>{/if}
        </div>{/if}
     {literal}
     
     {/literal}
	</div>
</div>
<div class="max bot">
    {$settings->zcopy}
  	</div>
<div id="toTop"><span class="i-up-open-big"></span></div>
</div>