<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output media-type="text/plain" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:result-document href="test.csv">"Call Number/ID","image files","image labels","Repository Country","Repository City","Repository Name","Source Collection","Date (narrative)","Date (range) start","Date (range) end","Page dimensions","Note(s)","Support Material","Language","Place of origin","Script","Creator","Creator Role","Former Owner","FO Ref","Manuscript Name"
        <xsl:for-each select="//tr">
            <xsl:variable name="CallNumber" select="normalize-space(td[1])"/>
            
            <xsl:choose>
                <!-- Choose only the first row - ignor any rows that have the same call number following and preceding, or just preceding -->
                <xsl:when test="following-sibling::tr/td[1]/text() = $CallNumber and preceding-sibling::tr/td[1]/text() = $CallNumber"/>
                <xsl:when test="preceding-sibling::tr/td[1]/text() = $CallNumber"/>
                <xsl:when test="th"/>
                <xsl:otherwise>
                    <!-- I need to make a bunch of variables that pulls in stuff from the other tables with the same call number -->
                    <xsl:variable name="imageFiles">
                        <xsl:for-each select="//tr[td[1]/text() = $CallNumber]"><xsl:value-of select="td[3]/text()"/>.tif|</xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="imageLabels">
                        <xsl:for-each select="//tr[td[1]/text() = $CallNumber]"><xsl:value-of select="td[2]/text()"/>|</xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="date_narrative" select="td[4]/text()"/>
                    <xsl:variable name="date_start" select="td[5]/text()"/>
                    <xsl:variable name="date_end" select="td[6]/text()"/>
                    <xsl:variable name="page_dimensions" select="td[7]/text()"/>
                    <xsl:variable name="notes">
                        <xsl:for-each select="//tr[td[1]/text() = $CallNumber]"><xsl:value-of select="normalize-space(td[8]/text())"/>|</xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="language" select="td[10]/text()"/>
                    <xsl:variable name="place_of_origin" select="td[11]/text()"/>
                    <xsl:variable name="script" select="td[12]/text()"/>
                    <xsl:variable name="creator" select="td[13]/text()"/>
                    <xsl:variable name="creator_role" select="td[14]/text()"/>
                    <xsl:variable name="manuscript_name" select="td[25]/text()"/>"<xsl:value-of select="$CallNumber"/>","<xsl:value-of select="$imageFiles"/>","<xsl:value-of select="$imageLabels"/>","United States","Philadelphia","Free Library of Philadelphia","John Frederick Lewis Collection of European Manuscripts","<xsl:value-of select="$date_narrative"/>","<xsl:value-of select="$date_start"/>","<xsl:value-of select="$date_end"/>","<xsl:value-of select="$page_dimensions"/>","<xsl:value-of select="$notes"/>","Parchment","<xsl:value-of select="$language"/>","<xsl:value-of select="$place_of_origin"/>","<xsl:value-of select="$script"/>","<xsl:value-of select="$creator"/>","<xsl:value-of select="$creator_role"/>","Lewis, John Frederick, 1860-1932","http://viaf.org/viaf/63874811","<xsl:value-of select="$manuscript_name"/>"<xsl:text>
                </xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
        
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>