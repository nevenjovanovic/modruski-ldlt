(: basic info on stylistic annotation under phr :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $v := ("#incrementum") ;
(: how many phr segments? :)
declare function local:phr($value){
for $v in $value
for $s in db:open($dbrhet)//*:text//*:phr[matches(@ana, $v)]
return element phr { $s/@ana , for $t in $s return normalize-space($t) }
};
local:phr($v)