<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    
    <sch:pattern abstract="true" id="structure-minimale">
        <sch:rule context="$element">
            <sch:assert test="self::*[child::title and child::p]">L'élément <sch:name/> doit avoir deux enfants : title et p.</sch:assert>
            <sch:assert test="count($attrib) > 1">L'élément <sch:name/> doit contenir au moins deux attributs.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="structure-minimale" id="livre">
        <sch:param name="element" value="livre"/>
        <sch:param name="attrib" value="@*"/>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="element-p">
        <sch:rule context="$element">
            <sch:report test="self::$element[not(count(child::p)=1)]">
                L'élément <sch:name/> contient toujours un enfant paragraphe
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="element-p" id="livres">
        <sch:param name="element" value="livres"/>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="acte-head_scenes">
        <sch:rule context="$element-acte">
            <sch:report test="self::div[@type='act'][not(count(child::head)=1 and count(child::div[@type='scene'])>1)]">
                Chaque div qui sont des actes doivent contenir un élément head et plusieurs scènes.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="acte-head_scenes">
        <sch:param name="element-acte" value="div"/>
    </sch:pattern>
</sch:schema>