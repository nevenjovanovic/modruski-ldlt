(: use a node-id to open a node :)
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";
import module namespace rest = "http://exquery.org/ns/restxq";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Nodus e textu Orationis in funere Petri cardinalis S. Sixti (1474)';
declare variable $content := "Display a node from stylistically annotated XML DB.";
declare variable $keywords := "Neo-Latin literature, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin";

(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-stil/node/{$urn}")
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
  function page:modruskiurn($urn)
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
<p>Functionis URI: { rest:uri()}.</p>
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
  <td>DB nodus</td>
  <td>Nota stilistica</td>
	<td>Textus</td>
  </tr>
	</thead>
  <tbody>
  
	{modruski:opennode($urn)}
  
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




