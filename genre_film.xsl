<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html>
      <head>
        <title>Жанры и фильма</title>
        <style>
          body { font-family: Arial, sans-serif; }
          h2 { color: #333; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 30px; }
          table, th, td { border: 1px solid black; }
          th, td { padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Жанры</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Название</th>
          </tr>
          <xsl:for-each select="genre_film/genres/genre">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="name"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Фильмы</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Название</th>
            <th>Дата релиза</th>
            <th>Возрастное ограничение</th>
            <th>ID жанра</th>
            <th>Жанр</th>
          </tr>
          <xsl:for-each select="genre_film/films/film">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="release_date"/></td>
              <td><xsl:value-of select="age_limit"/></td>
              <td><xsl:value-of select="genre_id"/></td>
              <td>
                <xsl:value-of select="/genre_film/genres/genre[id=current()/genre_id]/name"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>