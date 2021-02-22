<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

        <head>
            <title>Ejemplo XSLT</title>
        </head>

        <body>
            <h1> CIUDADES DE ESPAÑA </h1>
            <xsl:apply-templates select="//nombre">
                <xsl:sort select="ciudad" order="descending"/>
            </xsl:apply-templates>
        </body>

        </html>
    </xsl:template>
    <xsl:template match="nombre">
        <h3>
            <xsl:value-of select="." />
        </h3>
    </xsl:template>
</xsl:stylesheet>