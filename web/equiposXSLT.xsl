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
                <!-- El XSLT del equipo solo utilizará plantillas y no elementos for-each -->
                <xsl:apply-templates select="equipo" />              

                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>

        </html>
    </xsl:template>

    <!-- Datos de un equipo: Mostrará el equipo entrenado por Julio Velasco.
    Se visualizará el nombre del entrenador, el nombre del equipo 
    y los jugadores y jugadoras titulares con su número de camiseta.

    Al pulsar sobre el nombre del entrenador se abrirá un la página 
    con su biografía. La URL también se obtendrá del XML

    Se deberá guardar el nombre del entrenador en una variable. 

    De esta manera, si se modifica su nombre el resto de datos también 
    se modificarán de forma automática en la página. -->

    <!-- El XLT para el equipo, hará uso de una variable para cargar el 
    dato del nombre del entrenador -->
    
    <xsl:template match="equipo">
        
        <xsl:variable name="nombre_entrenador" select="equipo[entrenador/nombre='Julio Velasco']/nombre" />

        <xsl:apply-templates select="equipo[entrenador/nombre=$nombre_entrenador]" /> 

    </xsl:template>


    <!-- Aquí quería meterlo con la variable nombre_entrenador pero no me funciona por lo que dejo sin variable
    <xsl:template match="equipo[entrenador/nombre=$nombre_entrenador]"  >-->
    <xsl:template match="equipo[entrenador/nombre='Julio Velasco']" > 

        <xsl:variable name="url" select="entrenador/url" />

        <h1><a href="{$url}"><xsl:value-of select="entrenador/nombre"/></a></h1>
		<article class="equipos">
			<h4><xsl:value-of select="nombre"/></h4>                
            <xsl:apply-templates select="jugadores/jugador[@titular='si']" /> 
		</article>    

    </xsl:template>

    <xsl:template match="jugadores/jugador[@titular='si']">

        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>  

    </xsl:template>
    

</xsl:stylesheet>