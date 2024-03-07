<?xml version="1.0" encoding="UTF-8"?>

<!--
Autor: Rubén Gómez Nolberto
Asignatura: LMSGI
Unidad: 4
Tarea: Tarea Evaluativa 2
Publicado en: wwww
-->

<!-- Espacio de nombres -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-system="about:legacy-compat" />

    <!-- Plantilla principal -->
    <xsl:template match="/club_voleibol">

        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="./tienda.xml">Tienda</a>
                    <a href="./equipos.xml">Equipos</a>
                    <a href="./partidos.xml">Partidos</a>
                </header>
                
                <main>
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>

                        <!-- El XLT para los partidos, muestra en azul los resultados 
                         cuando el visitante gana -->
                        <!-- Datos de partidos: Mostrará todos los partidos 
                        que se juegan en Lima, ordenados por fecha desde el más reciente.
                        Visualizará los equipos, la fecha y el resultado
                        Además, si gana el visitante lo mostrará en azul. -->

                        <xsl:for-each select="partido[lugar/@ciudad='Lima']">
                        <xsl:sort select="fecha" order="descending" data-type="data"/>
                        
                        <tr>
                            <td><xsl:value-of select="equipos/local" /> - <xsl:value-of select="equipos/visitante" /></td>
                            <td><xsl:value-of select="fecha" /></td>

                            <xsl:choose>
                                <xsl:when test="number(equipos/local/@puntuacion)  &lt; number(equipos/visitante/@puntuacion)"> 
                                    <td class="azul"><xsl:value-of select="equipos/local/@puntuacion" /> - <xsl:value-of select="equipos/visitante/@puntuacion" /></td>
                                </xsl:when>

                                <xsl:otherwise> 
                                    <td ><xsl:value-of select="equipos/local/@puntuacion" /> - <xsl:value-of select="equipos/visitante/@puntuacion" /></td>
                                </xsl:otherwise>
                            </xsl:choose>   

                        </tr>            
                        </xsl:for-each>                
                        
                    </table>	

                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>