<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="pdv_liste/pdv/services"/>
    <xsl:template match="pdv_liste/pdv/ville">
        <ville taille="{string-length(.)}">.</ville>
    </xsl:template>
    
</xsl:stylesheet>