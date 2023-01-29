(: Modrusiensis rhetorical index :)
(: List locations of all phr elements :)
import module namespace nm = "http://croala.ffzg.unizg.hr/nm" at "../../repo/modr.xqm";
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Nicolai Modrusiensis oratio (1474): tabula contentorum';
declare variable $content := "Display table of contents.";
declare variable $keywords := "Renaissance Humanism, Neo-Latin, funeral oration, Pietro Riario, rhetoric, rhetorical analysis";

(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("modr-tabula")
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


  function page:nicmodrtabula()
{
  (: HTML template starts here :)

<html>
{ nm:htmlheadserver($title, $content, $keywords) }
<body>
<div class="container">
<div  class="row">
<div  class="col">
<h1>{ $title }</h1>
</div>
</div>
<div class="row">
<div  class="col">
  <!-- function here -->
{ nm:table(("Argumentum", "Paragraphus", "URN indiculus"), nm:tabulaorationis()) }
</div>
</div>
{ modruski:footerserver() }
</div>
</body>
</html>
};

return


