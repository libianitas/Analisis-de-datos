# ANÁLISIS DE LA EDAD DE LOS JUGADORES DE TENIS
## Introducción
El presente trabajo muestra un storytelling, del análisis de datos del tenis regulado por la ATP Asociación de Tenistas Profesionales (hombres) y WTA Asociación de Tenis Femenino (mujeres). 
Se analizarán estadísticas de rankings, jugadores y partidos de la ATP y la WTA. Este análisis se realizará por separado distinguiendo el género ya que la información se almacena en dataframes diferentes según la organización que los regula.
Con este análisis se pretende respaldar la afirmación de la importancia de la edad con la que se inicia en el entrenamiento del tenis, en especial si se tiene aspiraciones de llegar a competir en torneos oficiales internacionales. 
## Caso concreto a analizar
Se busca analizar la importancia de la edad de inicio en el entrenamiento del tenis mediante el estudio de los datos de la ATP y la WTA. El análisis se centra en los 50 mejores jugadores del ranking ATP del último torneo registrado en 2023, determinando la edad promedio en la que jugaron su primer partido y comparándola con la edad promedio de todos los jugadores que ganan partidos. También se analizará si estos jugadores ganan más partidos antes o después de esa edad promedio.
De manera similar, se aplicará el mismo análisis para las jugadoras de la WTA, utilizando dataframes separados y siguiendo la guía del archivo tennisATP.R. Este estudio busca proporcionar información útil para entrenadores, academias y familias, destacando los factores clave para alcanzar posiciones en los rankings profesionales.
## ¿Lenguaje de programación a utilizar? 
Se propone utilizar el lenguaje de programación R de modalidad abierta, libre y gratis que es especializado en proporcionar técnicas estadísticas y gráficas. Está disponible con licencia GNU, por lo que cualquier usuario tiene derecho a estudiar, usar modificar y compartir el software. R es muy utilizado en investigación científica, manipulación de datos, análisis estadístico entre otras áreas.
Links de descarga [R](https://cran.r-project.org/bin/windows/base/) y [RStudio](https://posit.co/download/rstudio-desktop/)
##¿Librería a utilizar para el tratamiento de los datos del TENIS?
La librería que mejor responde a las necesidades del análisis que se requiere realizar es DEUCE.
Fue desarrollada por Stephanie Kovalchik, una australiana científica de datos Senior y es compartida en la plataforma GitHub [Deuce](https://github.com/skoval/deuce) 
Instalamos e importamos la librería skoval/deuce. Esta libreria nos permite acceder a los datos del repositorio [atp_rankings](https://github.com/JeffSackmann/tennis_atp). La fuente de datos del tenis a utilizar es creada por Jeff Sackmann, quien ha recopilado información desde 1985.

Para iniciar con su implementación es necesaria su instalación e importación en un archivo nuevo de R.
## Solución 
+ Se crea un archivo R llamado tennisATP.R el cual puede descargar del siguiente enlace [tennisATP.R](analisis_deportivo/tennisATP.R).
+ Se cargan los datos.
+ Se visualiza los datos de ranking
+ Se obtiene un resumen del dataframe y se verifica el tipo de dato
+ Se eliminan datos redundantes y valores faltantes.
+ Se transforman datos a formatos requeridos.
+ Se ejeuta un análisis EDA.
+ Se seleccionan variables que aportan valor al análisis
+ Se crean gráficos de dispersión, diagrama de barras, gráfico de densidad.
+ Se obtiene la edad promedio de todos los jugadores que ganan los partidos en un torneo.
+ Se obtiene un subset de los partidos ganados de los jugadores mejor rankeados 2023 cuando su edad es menor igual a la edad promedio con la que los jugadores suelen ganar los partidos.
+ Se cuenta cuantos partidos por jugador han ganado, agrupando por jugador.
+ Se obtiene un subset de los partidos ganados de los jugadores mejor rankeados 2023 cuando su edad es mayor a la edad promedio con la que los jugadores suelen ganar los partidos.
+ Se cuenta cuantos partidos por jugado han ganado.
+ Se obtiene los datos de todos los partidos ganados por los jugadores mejor rankeados 2023
+ Se combinan dataframes.
+ Se crea un gráfico de barras agrupadas con los resultados finales.
## Storytelling completo

[Analisis_deportivo_R](analisis_deportivo/Analisis_deportivo_tenis_con_R.pdf) 






