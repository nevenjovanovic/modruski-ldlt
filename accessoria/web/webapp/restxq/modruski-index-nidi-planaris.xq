(: index all stylistic annotations :)
(: display levels of nesting :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/croala" at "../../repo/croala.xqm";
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Index nidorum planaris in Nicolai Modrusiensis orationem (1474)';
declare variable $content := "Display an index of nested elements and levels of nesting in Nicholas of Modruš Oratio in funere Petri Riarii (1474).";
declare variable $keywords := "Neo-Latin literature, style, stylistics, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin, XML nesting, nesting levels";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-stil/index-nidorum-planaris/{$min}")
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
  function page:modruskiindexnidorumplan($min)
{
  (: HTML template starts here :)

<html>
{ modruski:htmlheadserver($title, $content, $keywords) }
<body text="#000000">

<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
<div class="container-fluid">
<div class="row">
<div class="col">
<p>Ad Nicolai Modrusiensis orationem in funere Petri Riarii index nidorum planaris; planos elige <b>0-8</b>. <a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
<p>Indiculus nidificii (notarum stilisticarum in aliis notis contentarum) planaris affertur. Nexus verba annotata ostendent. Colores numerum elementorum in nidis indicant.</p>
<p>Functio nominatur: {rest:uri()}. In exitu inventum est: <b>{ count(modruski:nestlist($min)) }</b> numero.</p>
</div>
<div class="col">
{croala:infodb('modr-riar-stil')}
</div>
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	<div class="table-responsive">
<table class="table-striped  table-hover table-centered">
	<thead>
	<tr>
  <td>Notae ID</td>
	<td>Nota</td>
  <td>Quot nidi</td>
  <td>Quot liberi</td>
  <td>Notae liberorum</td>
  <td>Quot progenies</td>
  <td>Notae progeniei</td>
  </tr>
	</thead>
  <tbody>
	{ modruski:nestlistlevel($min) }
  </tbody>
  </table>
  
     </div>
</blockquote>
     <p/>
     </div>
<hr/>
{ modruski:footerserver() }

</body>
</html>
};

return
