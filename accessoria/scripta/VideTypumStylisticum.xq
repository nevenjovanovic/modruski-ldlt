(: basic info on stylistic annotation under phr :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $v := "#dicolon";
(: how many phr segments? :)
declare function local:phr($value){
for $s in db:open($dbrhet)//*:text//*:phr[matches(@ana, $value)]
return element phr { $s/@ana , for $t in $s return normalize-space($t) }
};
local:phr($v)