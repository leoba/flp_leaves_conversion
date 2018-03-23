<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- This spreadsheet imports the full notes from FLP_full_notes.html into FLP-Lewis-Master-Spreadsheet.html -->
    <!-- Process this file against FLP-Lewis-Master-Spreadsheet.html with FLP_full_notes.html in the same folder -->
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="notes_doc" select="document('FLP_full_notes.html')"/>
    
    <xsl:template match="/">
                    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tr/td[8]">
        <xsl:variable name="id" select="../td[3]"/>
        <xsl:variable name="notes-td" select="$notes_doc//tr[td[1][text()=$id]]/td[2]"/>
        <!--<xsl:variable name="notes" select="td[2]/text()"/>-->
        <td><xsl:value-of select="$notes-td"/></td>
    </xsl:template>
    
    
</xsl:stylesheet>