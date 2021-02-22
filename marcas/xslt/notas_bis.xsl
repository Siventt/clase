<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>LA NOTAS</title>
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
                <xsl:apply-templates select="Centro/Personal/Profesor"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="/Centro/Personal/Profesor">
        <h2>PROFESOR: <xsl:value-of select="Nombre"/></h2>
        <h4>Tutor de: <xsl:value-of select="@tutor"/></h4>

            <xsl:apply-templates select="/Centro/Personal/Alumnos">
                <xsl:with-param name="parametro_curso" select="@tutor"/>
                <xsl:sort select="Apellidos" order="ascending"/>
                <xsl:sort select="Nombre" order="ascending"/>
            </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="/Centro/Personal/Alumnos">
        <xsl:param name="parametro_curso"/>
        <xsl:if test="Curso = $parametro_curso">
            <h1>
                Nombre: <xsl:value-of select="Apellidos"/>, 
                <xsl:value-of select="Nombre"/> 
                - Curso: <xsl:value-of select="Curso"/>
                - DNI: <xsl:value-of select="@DNI"/>
            </h1>
            <xsl:if test="Asignaturas">
                <table>
                    <tr>
                        <th>nombre</th>
                        <th>NOTA</th>
                    </tr>
                    <xsl:apply-templates select="Asignaturas"/>
                    <tr bgcolor="grey">
                        <td>MEDIA</td>
                        <td><xsl:value-of select="sum(Asignaturas) div count(Asignaturas)"/></td>
                    </tr>
                </table>
            </xsl:if>
            <xsl:if test="not(Asignaturas)">
                <h1>NO SE HA PRESENTADO NADA</h1>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/Centro/Personal/Alumnos/Asignaturas">
        <xsl:choose>
            <xsl:when test="text()&lt;3">
                <tr bgcolor="red">
                    <td><xsl:value-of select="@Asignatura"/></td>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:when>
            <xsl:when test="text()&gt;8">
                <tr bgcolor="green">
                    <td><xsl:value-of select="@Asignatura"/></td>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:when>
            <xsl:when test="text()&gt;2 and text()&lt;5">
                <tr bgcolor="yellow">
                    <td><xsl:value-of select="@Asignatura"/></td>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td><xsl:value-of select="@Asignatura"/></td>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>