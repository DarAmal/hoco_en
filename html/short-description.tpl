 {if $product->features}
   {foreach $product->features as $f}
   		
         {if $f->feature_id==160 && !empty($f->value)}
           &bull; <span>опер.система:</span> {$f->value}
        {/if}
        
        {if $f->feature_id==163 && !empty($f->value)}
           <br>&bull; <span>количество SIM-карт:</span> {$f->value}
        {/if}
              
        {if $f->feature_id==169 && !empty($f->value)}
           <br>&bull; <span>экран:</span> {$f->value}
        {/if}
        
        {if $f->feature_id==170 && !empty($f->value)}
           <br>&bull; <span>разрешение:</span> {$f->value}
        {/if}
                
         {if $f->feature_id==174 && !empty($f->value)}
           <br>&bull; <span>камера:</span> {$f->value}
        {/if}
        	
         {if $f->feature_id==179 && !empty($f->value)}
           <br>&bull; <span>фронтальная:</span> {$f->value}
        {/if}
             
          {if $f->feature_id==189 && !empty($f->value)}
           <br>&bull; <span>память:</span> {$f->value} 
        {/if}
          
          {if $f->feature_id==190 && !empty($f->value)}
           <br>&bull; <span>оперативная память:</span> {$f->value} 
        {/if}
        
        {if $f->feature_id==182 && !empty($f->value)}
           <br>&bull; {$f->value}
        {/if} 
        
   		{if $f->feature_id==192 && !empty($f->value)}
           <br>&bull; <span>аккумулятор:</span> {$f->value}
        {/if}
        
        {if $f->feature_id==165 && !empty($f->value)}
           <br>&bull; <span>вес:</span> {$f->value}
        {/if} 
        
        {if $f->feature_id==166 && !empty($f->value)}
         <br> &bull; <span>ШxВxТ:</span> {$f->value}
        {/if}
        
    {/foreach}
{/if}