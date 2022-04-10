(: XQuery module for Modruski :)
module namespace modruski = 'http://croala.ffzg.unizg.hr/modruski';

(: helper function for header, with meta :)
declare function modruski:htmlheadserver($title, $content, $keywords) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)

<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="{ $keywords }"/>
<meta name="description" content="{$content}"/>
<meta name="revised" content="{ current-date()}"/>
<meta name="author" content="Neven Jovanović, CroALa" />
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/modruski.css"/>
<script type="text/javascript" src="/basex/static/dist/js/clipboard.min.js"></script>
</head>

};

(: formatting - footer :)
declare function modruski:footerserver () {
let $f := <footer class="footer">
<div class="container">
<h3> </h3>
<h1 class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> <a href="http://croala.ffzg.hr/">Croatiae auctores Latini</a></h1>
<div class="row">
<div  class="col-md-3"></div> 
<div  class="col-md-6">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="/basex/static/gfx/ffzghrlogo.png"/> Filozofski fakultet</a> Sveučilišta u Zagrebu</p></div>
<div  class="col-md-3"></div></div>
</div>
</footer>
return $f
};


declare function modruski:substring-before-last
  ( $arg ,
    $delim ) {

   if (matches($arg, $delim))
   then replace($arg,
            concat('^(.*)', $delim,'.*'),
            '$1')
   else ''
 } ;
declare function modruski:substring-after-last
  ( $arg ,
    $delim ) {

   replace ($arg,concat('^.*',$delim),'')
 } ;
 declare function modruski:getpassage ($urn){
   let $cts := collection("modruskicitconfig")//*:online
   for $t in $urn
let $urn1 := modruski:substring-before-last($t, ":") || ":"
let $xpath := modruski:substring-after-last($t, ":")
let $xpathphr := "//*[@n='" || replace($xpath, "\.", "']/*[@n='") || "']"
let $xpathphr2 := modruski:substring-before-last($xpathphr, "/")
let $passage := xquery:eval($xpathphr2, map { '': db:open('modruskiriario', data($cts[@urn=$urn1]/@docname)) })
return element tr { 
element td { $t } , 
element td {
normalize-space(data($passage)) }
}
 };
 
declare variable $modruski:urn := "https://croala.ffzg.unizg.hr/basex/nm-stil/node/";
declare variable $modruski:dbrhet := "modr-riar-stil";

declare function modruski:index-stilisticus() {
(: get all phr elements annotated with style, as table :)

let $base := db:open($modruski:dbrhet)//*:fileDesc/@xml:id
for $p in db:open($modruski:dbrhet)//*:text//*:phr
let $ana := $p/@ana
let $ananode := db:node-id($p)
let $a := path($p)
let $a2 := replace($a, "Q\{http://www.tei-c.org/ns/1.0\}", "")
return element tr { 
element td { $ananode },
element td { $ana/string() } ,
element td { 
element a {
  attribute href { $modruski:urn || $ananode } ,
   $base || $a2 } }
}
};

declare function modruski:opennode($node){
  for $i in $node
for $phr in db:open-id($modruski:dbrhet, $i)
return element tr {
  element td { $i }, 
  element td { $phr/@ana/string() }, 
  element td { normalize-space($phr) }
}
};

declare function modruski:getallnodes($term){
  (: for term, retrieve all nodes :)
  for $t in $term
let $phr := db:open($modruski:dbrhet)//*:phr[matches(@ana, $t)]
return modruski:opennode(db:node-id($phr))
};

declare function modruski:indiculus(){
(: get all phr elements annotated with style, as table :)
(: index phr/@ana, separate values, tokenize to get individual values (@ana may carry more than one) :)
(: count occurrences of individual values :)
let $rows := element tbody {
let $stylevalues :=
for $p in db:open($modruski:dbrhet)//*:text//*:phr
let $ana := $p/@ana/string()
return tokenize($ana, " ")
for $dv in distinct-values($stylevalues)
return element tr {
  element td { $dv } ,
  element td { count($stylevalues[. eq $dv]) }
}
}
for $r in $rows/tr
  let $term := substring-after($r/td[1]/string(), "#")
  let $url := "https://croala.ffzg.hr/basex/nm-stil/terminus/"
  order by xs:integer($r/td[2]/string()) descending
  return element tr {   
  element td { db:open($modruski:dbrhet)//*:interp[@xml:id=$term]/string()}, 
  element td { 
  element a { attribute href { $url || $term} , $term } } ,
  $r/td[2] }
};