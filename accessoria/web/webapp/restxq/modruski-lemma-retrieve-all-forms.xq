(: retrieve all forms for a given lemma :)
import module namespace modruski = "http://croala.ffzg.unizg.hr/modruski" at "../../repo/modruski.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'Ubi occurrit lemma in Oratione in funere Petri cardinalis S. Sixti (1474)';
declare variable $content := "Retrieve all occurrences of forms of a lemma.";
declare variable $keywords := "Neo-Latin literature, Nikola Modruški, Nicholas of Modruš, Early Modern Italy, Renaissance Latin, lemma, forms, occurrences";

(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("nm-verba/lemma/{$term}")
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
  function page:modruskilemmaforma($term)
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
<div class="container">
<div class="row">
<div class="col">
<p>Formae lemmatis in Oratione in funere Petri (1474)</p>
<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
</div>
<div class="col">
<p>Quae formae lemmatis <span class="text-error">{$term}</span> in quibus locis occurrunt in oratione Nicolai Modrussiensis in funere Petri, cardinalis S. Sixti (a. 1474).</p>
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
  <td>Citatio</td>
  <td>Lemma</td>
  <td>Forma</td>
	<td>Textus</td>
  </tr>
	</thead>
  <tbody>
  
	{ modruski:getallformsforlemma($term) }
  
  </tbody>
  </table>
  
     </div>
</div>
{ modruski:footerserver() }

</div>
</div>
</body>
</html>
};

return




