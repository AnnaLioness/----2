<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Eatable plants table</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    table, th, td {
                        border: 1px solid black;
                    }
                    th, td {
                        padding: 10px;
                        text-align: right;
                    }
                    th {
                        background-color: #66ff66;
                    }
                </style>
            </head>
            <body>
                <h2>Eatable plants table</h2>
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Name</th>
                        <th>Color</th>
                        <th>Calories per 100g.</th>
                    </tr>
                    <xsl:for-each select="plants/plant">
                        <tr>
                            <td><xsl:value-of select="type"></xsl:value-of></td>
                            <td><xsl:value-of select="name"></xsl:value-of></td>
                            <td><xsl:value-of select="color"></xsl:value-of></td>
                            <td><xsl:value-of select="calories"></xsl:value-of></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
    