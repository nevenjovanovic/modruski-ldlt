(: index all lemmata in the NM Oratio, link to index of occurrences :)
(: import module namespace rest = "http://exquery.org/ns/restxq"; :)
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Index verborum in Nicolai Modrusiensis oratione (1474)';
declare variable $content := "Display an index of words appearing in Nicholas of Modruš Oratio in funere Petri Riarii (1474).";
declare variable $keywords := "Neo-Latin literature, digital edition, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin, words, lemmata, index";

(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-verba/index-verborum")
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
  function page:modruskiindexverborum()
{
  (: HTML template starts here :)

<html lang="la">
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
<div class="card">
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
<p>Indiculus verborum affertur. Nexus verborum formas et locos ostendent.</p>
</div>
</div>
<div class="col">
<div class="card">
<table>
<tr><td>Verba</td> <td>{ modruski:verbanumerare()}</td> </tr>
<tr><td>Lemmata</td> <td>{ modruski:lemmatanumerare() }</td> </tr>
</table>
</div>
</div>
<div class="col">
<div class="card">
{modruski:infodb('modr-riar-ldlt')}
</div>
</div>
</div>
<div class="row">
<div class="col">
<table class="striped">
	<thead>
	<tr>
  <td>LiLa nexus</td>
  <td>Logeion nexus</td>
  <td>Verbum</td>
	<td>Quoties in editione (formae omnes)</td>
  </tr>
	</thead>
  <tbody>
	{ modruski:indiculusverborum() }
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
