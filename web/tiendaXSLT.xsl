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

                <!-- Listado de los productos de la tienda: mostrará la imagen, 
                el precio y los comentarios de todos los artículos. 
                Además, indicará el número de comentarios que hay. -->
                
                <main class="principal">
                    <xsl:for-each select="tienda/articulo">
                        <article>
                                <section>
                                    <img class="articulo" src="../img/{@foto}" alt="{nombre}"/>			
                                </section>
                                <section>
                                    <h2><xsl:value-of select="precio" /></h2>
                                    <h3>Comentarios: <xsl:value-of select="count(comentarios)" /></h3>
                                    <ul>
                                        <xsl:for-each select="comentarios">
                                        <li><xsl:value-of select="@fecha" /> - <xsl:value-of select="." /></li>
                                        </xsl:for-each>
                                    </ul>
                                </section>
                            </article>         
                    </xsl:for-each>                   

                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>