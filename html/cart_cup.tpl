{if $cart->coupon_discount>0}{$cart->coupon_discount|convert} {$currency->sign}{else}0 {$currency->sign}{/if}