(: index all stylistic annotations :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Index lectionum variantium in Nicolai Modrusiensis oratione (1474)';
declare variable $content := "Display an index of variant readings to Nicholas of Modruš Oratio in funere Petri Riarii (1474).";
declare variable $keywords := "Neo-Latin literature, digital edition, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin";

(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-lectiones/index-lectionum")
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
  function page:modruskiindexlect()
{
  (: HTML template starts here :)

<html>
{ modruski:htmlheadserver($title, $content, $keywords) }
<body>
<div class="container">
<div class="row">
<div class="col">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
</div>
</div>
<div class="row">
<div class="col">
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
<p>Indiculus lectionum affertur. Nexus locos annotatos ostendent.</p>
<p>Functionis URI: {rest:uri()}.</p>
</div>
<div class="col">
{modruski:infodb('modr-riar-ldlt')}
</div>
</div>
<div class="row">
<div class="col">
<table class="striped">
	<thead>
	<tr>
  <td>Variationis typus</td>
	<td>Quot loci in editione</td>
  </tr>
	</thead>
  <tbody>
	{ modruski:indiculuslectionum() }
  </tbody>
  </table>
     </div>
</div>
{ modruski:footerserver() }
</div>
</body>
</html>
};

return




