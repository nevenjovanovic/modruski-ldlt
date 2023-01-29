<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- remove-elements-w-pc: copy everything, remove w and pc in phr -->
    <!-- note -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:text//tei:w[not(@ana='compositum')]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:text//tei:w[@ana='compositum']">
        <xsl:value-of select="tei:w/string()"/>
    </xsl:template>
    <xsl:template match="//tei:text//tei:pc">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:text//tei:phr">
        <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="phr">
            <xsl:attribute name="rendition">#hang</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:text//tei:interp">
        <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="interp">
            <xsl:attribute name="rendition">#block</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    </xsl:stylesheet>

