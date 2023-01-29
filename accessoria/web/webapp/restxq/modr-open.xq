(: Modrusiensis open node in db :)
import module namespace nm = "http://croala.ffzg.unizg.hr/nm" at "../../repo/modr.xqm";

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $title := 'Nicolai Modrusiensis oratio (1474): sectio';
declare variable $content := "Display a section from the edition.";
declare variable $keywords := "Renaissance Humanism, Neo-Latin, funeral oration, Pietro Riario, digital critical edition";

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
    %rest:path("nicolausmodrusiensis.oratioriario.croala-ldlt/{$node}")
  %output:method(
  "xhtml"
)
  %output:omit-xml-declaration(
  "no"
)
  %output:doctype-public(
  "-//W3C//DTD XHTML 1.0 Transitional//EN"
)
  %output:doctype-system(
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
)
  %rest:GET
  function page:opennode($node)
{
  (: HTML template starts here :)

<html>
{ nm:htmlheadserver($title, $content, $keywords) }

<body>
<div class="container">
<div class="row">
<div  class="col">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Nicolai Modrusiensis oratio in funere Petri (Riarii, 1474): nodus</h1>
</div>
</div>
<div class="row">
<div  class="col">
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }. </p>
<p>Nodus <span class="text-success">{$node}</span> in collectione {$nm:db}.</p>
</div>
<div class="col">
<p><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> Documentum {nm:filenode(db:path(db:get-id($nm:db,$node)))}</p>
</div>
</div>
<div class="row">
<div  class="col">
    { fn:serialize(db:get-id($nm:db,$node), map{"method":"text"}) }
</div>
</div>
{ nm:footerserver() }
</div>
</body>
</html>
};

return
