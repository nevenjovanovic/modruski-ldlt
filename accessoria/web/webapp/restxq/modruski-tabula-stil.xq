(: list all stylistic annotations as they occur in document :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Tabula stilistica in Nicolai Modrusiensis orationem (1474)';
declare variable $content := "Display a list of stylistic annotations to Nicholas of Modruš Oratio in funere Petri Riarii (1474) as they occur in the edition.";
declare variable $keywords := "Neo-Latin literature, style, stylistics, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-stil/tabula-stilistica")
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
<p>Ad Nicolai Modrusiensis orationem in funere Petri Riarii tabula stilistica</p>
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
</div>
<div class="col">
<p>Notae stilisticae in oratione occurrentes enumerantur.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col">
{modruski:infodb('modr-riar-stil')}
</div>
</div>
<div class="row">
<div class="col">
<table class="striped">
	<thead>
	<tr>
  <td>ID in DB</td>
	<td>Nota stilistica</td>
<td>URN</td>
  </tr>
	</thead>
  <tbody>
	{modruski:index-stilisticus()}
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




