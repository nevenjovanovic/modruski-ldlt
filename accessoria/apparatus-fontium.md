# Refer to specific passages in the paragraph from the apparatus of parallel passages 

The [DLL Guidelines](https://digitallatin.github.io/guidelines/LDLT-Guidelines.html) say:

> A register of parallel passages differs from an apparatus fontium in that it reflects the editor's judgment about passages that might be of interest to readers, whereas an apparatus fontium provides information on passages quoted or cited by the author(s). For this reason, entries in the apparatus fontium are encoded within the edition text, but parallel passages are encoded as notes, similar to the way that an editor's textual notes are handled... <note> contains a list of parallel passages related to the text. Each <note> must have an xml:id and target pointing to the xml:id related to the section of text referred to by the <note>. Each <note> must also have type="parallel" to distinguish it from other uses of <note>.

If the smallest section of text I can refer to is a paragraph, how do I point to a specific segment of the paragraph? (Do I do it at all?)

The [EVT project](http://evt.labcd.unipi.it/) uses `seg` or `ref` to encode such passages:

> analogueDef​ . Analogues: element(s) used within the XML file to encode passages for the analogues apparatus. (f.i. ​ <seg> or ​ <ref[type=parallelPassage]>​ ). Please divide values using commas.
