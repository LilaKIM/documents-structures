<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="services"/>
    <xsl:template match="ville">
        <ville taille="{string-length(.)}">
            <xsl:value-of select="."/>
        </ville>
    </xsl:template>
    <xsl:template match="adresse">
        <ADDRESSE>
            <xsl:value-of select="."/>
        </ADDRESSE>
    </xsl:template>
    <xsl:template match="prix/@valeur">
        <xsl:attribute name="valeur"><xsl:value-of select="concat(round(. * 0.001, 2), '€')"/></xsl:attribute>
    </xsl:template>
</xsl:stylesheet>