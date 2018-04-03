<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match= "/">
        <html><head><title>Endangered Species</title></head>
            <body bgcolor="white">
                <xsl:apply-template select="endangered_species/animal"/>
            </body></html>
    </xsl:template>

    <xsl:template match="animal">
        <xsl:apply-templates select="name[@language='Latin']"/>
        <xsl:for-each select="threats/threat">
            <li> <xsl:value-of select="."></xsl:value-of></li>
        </xsl:for-each>
        <img src="{picture/@filename}" width="{picture/@x}" height="{picture/@y}" />
    </xsl:template>

</xsl:stylesheet>
