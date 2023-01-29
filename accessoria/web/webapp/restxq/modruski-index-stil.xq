(: index all stylistic annotations :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Index stilisticus in Nicolai Modrusiensis orationem (1474)';
declare variable $content := "Display an index of stylistic annotations to Nicholas of Modruš Oratio in funere Petri Riarii (1474).";
declare variable $keywords := "Neo-Latin literature, style, stylistics, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-stil/index-stilisticus")
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
  function page:modruskiindexstil()
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
<div class="card bd-success">
<div class="header">
<p>Ad Nicolai Modrusiensis orationem in funere Petri Riarii index stilisticus</p>
</div>
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
</div>
</div>
<div class="col">
<div class="card bd-grey">
<div class="header">
<p>Indiculus notarum stilisticarum affertur. Nexus verba annotata ostendent.</p>
</div>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
</div>
<div class="col">
<div class="card bd-grey">
{modruski:infodb('modr-riar-stil')}
</div>
</div>
</div>
<div class="row">
<div class="col">
<table class="striped">
	<thead>
	<tr>
  <td>Notae definitio</td>
	<td>Ostende locos in editione</td>
  <td>Quoties in editione</td>
  </tr>
	</thead>
  <tbody>
	{ modruski:indiculus() }
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
