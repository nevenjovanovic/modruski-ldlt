(: get all phr elements annotated with style, as table :)
declare variable $urn := "http://localhost:8984/";
declare variable $dbrhet := "modr-riar-rhet";
let $base := db:open($dbrhet)//*:fileDesc/@xml:id
for $p in db:open($dbrhet)//*:text//*:phr
let $ana := $p/@ana
let $ananode := db:node-id($p)
let $a := path($p)
let $a2 := replace($a, "Q\{http://www.tei-c.org/ns/1.0\}", "")
return element tr { 
element td { $ananode },
element td { $ana/string() } ,
element td { 
element a {
  attribute href { $urn || $dbrhet || "/" || $ananode } ,
   $base || $a2 } }
}