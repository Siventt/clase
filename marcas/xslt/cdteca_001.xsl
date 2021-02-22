<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>CDTeca</title>
            </head>
            <body>
                <h1>MI CDTECA VERSIÓN 1</h1>
                <xsl:for-each select="cdteca/cd">
                    <xsl:apply-templates select="titulo"/>
                    <xsl:apply-templates select="artista"/>
                    <ul>
                        <xsl:for-each select="cancion">
                            <xsl:sort select="@tiempo"/>
                            <xsl:if test="@tiempo &gt; 200">
                                <xsl:apply-templates select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="/cdteca/cd/titulo">
        <h1>Album: <xsl:value-of select="."/> </h1>
    </xsl:template>
    <xsl:template match="/cdteca/cd/artista">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@wiki"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@foto"/>
            </xsl:attribute>
            <xsl:attribute name="width">
                100px
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    <xsl:template match="/cdteca/cd/cancion">
        <li>
            <xsl:value-of select="."/> - 
            <xsl:value-of select="floor(@tiempo div 60)"/>m 
            <xsl:value-of select="@tiempo mod 60"/>s
        </li>
    </xsl:template>
</xsl:stylesheet>