<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html><head><title>Endangered Species</title></head> <body bgcolor="white">
        <xsl:apply-templates select="endangered_species/animal"/>
        </body>
    </html>
</xsl:template>

    <xsl:template match="animal">
    <p align="center">
        <br/><font size="+3"><xsl:apply-templates select="name"/></font></p>
        <table width="100%" border="2">
            <tr><th>Subspecies Names</th><th>Region</th><th>Population</th><th>% of Species</th><th>Year</th></tr>
            <xsl:for-each select="subspecies">
                <xsl:sort select="population" data-type="number"/>
                <xsl:sort select="population/@year" data-type="number"/>
                <tr><td><xsl:apply-templates select="name"/></td>
                    <td><xsl:value-of select="region"/></td>
                    <td><xsl:apply-templates select="population"/></td>
                    <td><xsl:value-of select="percent"/>
                    <td><xsl:value-of select="population/@year"/></td>
                </tr>
            </xsl:for-each>
        </table>
        Total:
        <xsl:value-of select="count(/animal/name)"/>
        <xsl:value-of select="sum(/animal/population)"/>
    </xsl:template>

    <xsl:template match="name[@langauge='English']">
    <nobr><b><xsl:value-of select="."/></b></nobr>
    </xsl:template>
    <xsl:template match="name[@langauge='Latin']">
        <nobr><i><xsl:value-of select="."/></i></nobr>
    </xsl:template>


    <xsl:template match="percent">
        <xsl:choose>
            <xsl:when test=". =0">
                <font title="that means there are no more left">Extinct</font>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/> (<xsl:value-of select="(.div sum(../../subspecies/population)*100)"/>%)
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
