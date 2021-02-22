<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>LA LIGA</title>
            </head>
            <style>
                table{
                    border: 1px solid black;
                }
                td,th{
                    border: 1px solid black;
                }
            </style>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>gol.favor</th>
                            <th>gol.contra</th>
                            <th>puntos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="equipos/equipo">
                            <xsl:sort select="puntos" data-type="number" order="descending"/>
                            <xsl:sort select="golesafavor" data-type="number" order="descending"/>
                            <xsl:sort select="golescontra" data-type="number" order="ascending"/>
                                <xsl:choose>
                                    <xsl:when test="position()&lt;5">
                                        <tr style="background-color:green;">    
                                            <xsl:apply-templates select="nombre"/>
                                            <xsl:apply-templates select="golesafavor"/>
                                            <xsl:apply-templates select="golescontra"/>
                                            <xsl:apply-templates select="puntos"/>
                                        </tr>
                                    </xsl:when>
                                    <xsl:when test="position()&gt;last()-3">
                                        <tr style="background-color:red;">    
                                            <xsl:apply-templates select="nombre"/>
                                            <xsl:apply-templates select="golesafavor"/>
                                            <xsl:apply-templates select="golescontra"/>
                                            <xsl:apply-templates select="puntos"/>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr>    
                                            <xsl:apply-templates select="nombre"/>
                                            <xsl:apply-templates select="golesafavor"/>
                                            <xsl:apply-templates select="golescontra"/>
                                            <xsl:apply-templates select="puntos"/>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="/equipos/equipo/nombre">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    <xsl:template match="/equipos/equipo/golesafavor">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    <xsl:template match="/equipos/equipo/golescontra">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    <xsl:template match="/equipos/equipo/puntos">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
</xsl:stylesheet>