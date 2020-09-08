<!DOCTYPE html>
<html lang="ru"><head>
	<base href="{$config->root_url}/"/>
	<title>{$meta_title|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords"    content="{$meta_keywords|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="yandex-verification" content="d503b49eebb8ac46" />
    
    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

	{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}
	<link href="design/{$settings->theme|escape}/css/style.css?v={filemtime("design/{$settings->theme|escape}/css/style.css")}" rel="stylesheet" type="text/css" media="screen"/>
	<link href="design/{$settings->theme|escape}/css/filter.css" rel="stylesheet" type="text/css" media="screen"/> 
	<link href="design/{$settings->theme|escape}/css/adaptive.css?v={filemtime("design/{$settings->theme|escape}/css/adaptive.css")}" rel="stylesheet" type="text/css" media="screen"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"  type="text/javascript"></script>
    <script src="design/{$settings->theme}/js/smarty.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>	
    
    {* Автозаполнитель поиска *}
{literal}
<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
<style>
.autocomplete-suggestions{
background-color: #ffffff;
overflow: hidden;
border: 1px solid #e0e0e0;
overflow-y: auto;
}
.autocomplete-suggestions .autocomplete-suggestion{cursor: default;}
.autocomplete-suggestions .autocomplete-suggestion:hover{background:#f2f2f2;}
.autocomplete-suggestions .selected { background:#F0F0F0; }
.autocomplete-suggestions div { padding:2px 5px; white-space:nowrap; }
.autocomplete-suggestions strong { font-weight:normal; color:#3399FF; }
</style>	
<script>
$(function() {
//  Автозаполнитель поиска
$(".input_search").autocomplete({
	serviceUrl:'ajax/search_products.php',
	minChars:1,
	noCache: false, 
	onSelect:
		function(suggestion){
			 $(".input_search").closest('form').submit();
		},
	formatResult:
		function(suggestion, currentValue){
			var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
			var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
			return (suggestion.data.image?"<img align=absmiddle src='"+suggestion.data.image+"'> ":'') + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
		}	
});
});
</script>
{/literal}
 </head>
<body>
<div class="master-wrapper">
<div class="blurs">	
	<div id="shapka">
        <div id="header">
		<div class="logo">
			<a href="/"><img src="design/{$settings->theme|escape}/images/logo.png" title="{$settings->site_name|escape}" alt="{$settings->site_name|escape}"/></a>
		</div>
		
        <div id="topSearch">
					<div id="topSearchLine">
						<form action="products" method="GET" autocomplete="off" id="searchForm">
							<a href="#" id="menuTrigger"></a>
							<input type="text" name="keyword" value="{$keyword|escape}" class="input_search field" placeholder="Поиск по каталогу"><a href="#" onclick="$(this).closest('form').submit()" class="btn" id="goTopSearch">
                           <span class="i-search"></span></a>
							<input type="hidden" name="" value="">
						</form>
					</div>
				</div>
                
			
      {*<!--  <!—noindex—><!—googleoff: index—>
		    <!-- Информер логин -->
            <div id="wishlist_informer">
             <div id="compare_informer" class='mylist'>
            {include file='login_informer.tpl'}           
            </div> 
            </div>
			<!-- end -->
            
		<div class="topcart">
			<div id="cart_informer">
				{include file='cart_informer.tpl'}
			</div>
		</div>
        <!—googleon: index—><!—/noindex—>
        -->*}
	</div>
    
    {*<!--Меню-->*}{include file='categories.tpl' categories=$categories level=0}
    </div>

	

	{if $module==MainView}
		{$content}
	{elseif $module==PageView || $module==BlogView || $module==ProductsView || $module==SitemapView || $module==RegisterView || $module==UserView || $module==LoginView || $module=='ProductView'}
		<div class="max pad-t-30 pad-b-50">
			<div class="contable{if $module=='ProductView'} pro{/if}">
          		<div class="content">
					{$content}
				</div>
			</div>
            {*<!--Рекомендуемые-->*}
             {if $module=='ProductView'}{if $related_products}<div class="related">
                <h2 class="pad-t-50 mar-b-30">Similar Products</h2>
                <ul class="catprods">
                {foreach $related_products as $product}
                {include file='product_iteam.tpl'}
                {/foreach}
                </ul></div>
              {/if}{/if}{*<!--End Рекомендуемые-->*}
              
              {*<!--Вы смотрели-->*}
    {if $module=='ProductView' || $module=='ProductsView' || $page->url == 'wishlist' || $page->url == 'compare'}
            		{include file='browsed_product.tpl'}
			{/if}
            {*<!--End Вы смотрели-->*}
                            
          
		</div>
	{elseif $module==ProductsView || $module==PhotoView || $module==CartView || $module==OrderView}
		<div class="max pad-t-30 pad-b-50">
			{$content}
        </div>
	{else}
		{$content}
	{/if}
	
	{*<!--Футер-->*}{include file='footer.tpl'}
	
</div>{*<!--END Blurs-->*}</div>

{if $module=='MainView'}{literal}
<div id="hellopreloader"><div id="hellopreloader_preload"></div></div>
<script type="text/javascript">var hellopreloader = document.getElementById("hellopreloader_preload");function fadeOutnojquery(el){el.style.opacity = 1;var interhellopreloader = setInterval(function(){el.style.opacity = el.style.opacity - 0.05;if (el.style.opacity <=0.05){ clearInterval(interhellopreloader);hellopreloader.style.display = "none";}},16);}window.onload = function(){setTimeout(function(){fadeOutnojquery(hellopreloader);},500);};</script>
{/literal}{/if}

{if $module=='MainView' || $module=='ProductView' || $module=='ProductsView' || $page->url == 'wishlist' || $page->url == 'compare'}{literal}
<script>

$( function()
{
    var targets = $( '[rel~=tooltip]' ),
        target  = false,
        tooltip = false,
        title   = false;

    targets.bind( 'mouseenter', function()
    {
        target  = $( this );
        tip     = target.attr( 'title' );
        tooltip = $( '<div id="tooltip"></div>' );

        if( !tip || tip == '' )
            return false;

        target.removeAttr( 'title' );
        tooltip.css( 'opacity', 0 )
               .html( tip )
               .appendTo( 'body' );

        var init_tooltip = function()
        {
            if( $( window ).width() < tooltip.outerWidth() * 1.5 )
                tooltip.css( 'max-width', $( window ).width() / 2 );
            else
                tooltip.css( 'max-width', 340 );

            var pos_left = target.offset().left + ( target.outerWidth() / 2 ) - ( tooltip.outerWidth() / 2 ),
                pos_top  = target.offset().top - tooltip.outerHeight() - 20;

            if( pos_left < 0 )
            {
                pos_left = target.offset().left + target.outerWidth() / 2 - 20;
                tooltip.addClass( 'left' );
            }
            else
                tooltip.removeClass( 'left' );

            if( pos_left + tooltip.outerWidth() > $( window ).width() )
            {
                pos_left = target.offset().left - tooltip.outerWidth() + target.outerWidth() / 2 + 20;
                tooltip.addClass( 'right' );
            }
            else
                tooltip.removeClass( 'right' );

            if( pos_top < 0 )
            {
                var pos_top  = target.offset().top + target.outerHeight();
                tooltip.addClass( 'top' );
            }
            else
                tooltip.removeClass( 'top' );

            tooltip.css( { left: pos_left, top: pos_top } )
                   .animate( { top: '+=10', opacity: 1 }, 250 );
        };

        init_tooltip();
        $( window ).resize( init_tooltip );

        var remove_tooltip = function()
        {
            tooltip.animate( { top: '-=10', opacity: 0 }, 250, function()
            {
                $( this ).remove();
            });

            target.attr( 'title', tip );
        };
        target.bind( 'mouseleave', remove_tooltip );
        tooltip.bind( 'click', remove_tooltip );
    });
});
</script>
{/literal}{/if}

{*<!--Все, что модальное-->*}{include file='modal.tpl' categories=$categories level=0}

 <link href="design/{$settings->theme|escape}/fontello/css/fontello.css" type="text/css" rel="stylesheet" />
<script src="design/{$settings->theme}/js/slick.min.js" type="text/javascript"></script>

<script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
<script src="design/{$settings->theme}/js/ajax_cart.js"></script>
<script src="design/{$settings->theme}/js/product_to_session.js"></script>
<script src="design/{$settings->theme}/js/readmore.js"></script>
<script src="js/baloon/js/baloon.js" type="text/javascript"></script>
<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
<script src="design/{$settings->theme}/js/jTabs.js"></script>
<script src="design/{$settings->theme}/js/jquery.maskedinput-1.2.2.js"></script>
<link href="js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 
{if $module=='MainView' || $module=='ProductView' || $module=='PageView' || $module=='PhotoView' || $page->url=='reviews' || $module=='BlogView'}
<link href="design/{$settings->theme}/css/jquery.fancybox.min.css" rel="stylesheet">
<script src="design/{$settings->theme}/js/jquery.fancybox.min.js"></script>
{elseif $module=='CartView'}
<script src="design/{$settings->theme}/js/timedropper.min.js"></script>
<script src="design/{$settings->theme}/js/datedropper.min.js"></script>
<link href="design/{$settings->theme}/css/timedropper.min.css" rel="stylesheet" type="text/css" /> 
<link href="design/{$settings->theme}/css/datedropper.min.css" rel="stylesheet" type="text/css" /> 
{/if}

<script src="design/{$settings->theme}/js/jquery-ui-1.9.0.custom.min.js"  type="text/javascript"></script>
<script src="design/{$settings->theme}/js/filter.min.js"  type="text/javascript"></script>
{if $page->url == 'reviews' || $module=='PhotoView' || $module=='ProductView' || $module=='MainView'}
{if $module !=='MainView'}
	<script src="design/{$settings->theme}/js/fileinput.js"></script>
    {/if}
{if $module=='ProductView'}<script src="design/{$settings->theme}/js/product.js"  type="text/javascript"></script>{/if}
<script src="design/{$settings->theme}/js/masonry.pkgd.min.js"></script>
{/if}
<link rel="stylesheet" href="design/{$settings->theme}/css/jquery.mmenu.all.css?v={filemtime("design/{$settings->theme|escape}/css/jquery.mmenu.all.css")}" type="text/css" />
<script src="design/{$settings->theme}/js/jquery.mmenu.all.min.js" type="text/javascript"></script>
{if $module =='MainView'}
 {*Модуль баннеров*}
	<link rel="stylesheet" href="design/{$settings->theme}/js/sm.slider/smslider.css" type="text/css" media="screen" />
	<script src="design/{$settings->theme}/js/sm.slider/jquery.smslider.min.js" type="text/javascript"></script>
{/if}    
 
</body>
</html>