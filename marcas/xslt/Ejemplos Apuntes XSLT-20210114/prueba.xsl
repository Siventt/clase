<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <body>
            <h2>CIUDADES DE ESPAÑA</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Ciudades</th>
                    <th>Habitantes</th>
                    <th>Otros</th>
                    <th>Números</th>
                </tr>
                <xsl:for-each select="ciudades/ciudad"> 
                <xsl:sort select="nombre" order="descending"/>
                <tr>
                    <xsl:choose>
                        <xsl:when test="nombre = 'Madrid'">
                            <td bgcolor="green">
                                <xsl:value-of select="nombre"/>
                            </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td>
                                <xsl:value-of select="nombre"/>
                            </td>
                        </xsl:otherwise>
                    </xsl:choose>
                    <td>
                        <xsl:value-of select="habitantes"/>
                    </td>
                    <td>
                        <xsl:value-of select="otros/@tipo"/>
                    </td>
                    <td>
                        <xsl:value-of select="otros"/>
                    </td>
                </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>