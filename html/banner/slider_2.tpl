{*В ASSIGN УКАЖИТЕ ID НОМЕР ГРУППЫ    {assign var='group' value='IDГРУППЫ'}  *}

{assign var='group' value='2'}{get_banners group=$group}

{if $banners}
<br />
<div class="slider">
<div class="head-slider" id="Slide-{$group}">
	<ul>
    {foreach $banners as $banner}
    <li><a href="{$banner->url}" title="{$banner->name|escape}">
    <img src="{$banner->image}" alt="{$banner->name|escape}"></a></li>
    {/foreach}
    </ul>
</div>
</div>
<div class="clear"></div>
{/if}

{literal}
<script type="text/javascript">
$(document).ready(function(){
    $('#Slide-{/literal}{$group}{literal}').smSlider({
		autoPlay:true,
		delay:5000,
		hoverPause:true,
		transition:'animate',
        pagination : false,
		easing : 'swing'
		});
})		
</script>
{/literal}