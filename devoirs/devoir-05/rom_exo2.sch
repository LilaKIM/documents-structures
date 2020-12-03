<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="t"/>
    <sch:pattern>
        <sch:rule context="/TEI">
            <sch:assert test="teiHeader and text">
                La racine <sch:name/> doit contenir deux éléments teiHeader et text.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="element-p">
        <sch:rule context="$element">
            <sch:report test="self::$element[count(child::p)=1]">
                L'élément <sch:name/> contient toujours un enfant paragraphe
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="element-p" id="sp">
        <sch:param name="element" value="sp"/>
    </sch:pattern>
    
    <sch:pattern is-a="element-p" id="projectDesc">
        <sch:param name="element" value="projectDesc"/>
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