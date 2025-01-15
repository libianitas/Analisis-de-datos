#Instalamos e importamos la librería skoval/deuce
#Esta librerpia nos permite acceder a los datos del repositorio
#https://github.com/JeffSackmann/tennis_wta y https://github.com/JeffSackmann/tennis_atp
install_github("skoval/deuce")

library(deuce)
library(devtools)
#Importo librería para gráficas
library(ggplot2)
library(tidyr)
#Para iniciar con la exploración de la librería se recomienda ver su documentación 
help(package = "deuce")
#Existen repositorios de ATP(Hombres) y WTA(mujeres) 

####################################
########## ATP(Hombres) ############
####################################

###########################################################################
# A qué edad promedio jugaron su primer partido los tenistas que tuvieron # 
# una posición de 1 a  100 en el ranking de la ATP del año 2023           #
###########################################################################
#Con la función data cargamos los datos 
data(atp_rankings) # ranking
#Se visualiza los datos de ranking
print(atp_rankings)
#Se obtiene un resumen del dataframe y se verifica el tipo de dato
summary(atp_rankings)
#Es importante obtener un resumen de los datos para observar por ejemplo hasta
#que fecha tenemos los datos de ranking
#Se omiten datos NA
atp_rankings <- na.omit(atp_rankings)
#Se transforma el tipo de dato de ranking a numérico
atp_rankings$ranking <- as.numeric(atp_rankings$ranking)
#Se obtiene los jugadores con una posición entre 1 y 50 
# del ranking de la última semana de torneo jugada y registrada en el 2023
#Se asigna un año de análisis, el usuario lo puede modificar
year_analisys <- 2023
max_ranking_date <- max(atp_rankings$date )
print(max_ranking_date)
ranking_best <- atp_rankings[(year(atp_rankings$date) == year_analisys) &
                            (atp_rankings$date == max_ranking_date) & 
                            (atp_rankings$ranking >=1 & atp_rankings$ranking <=50), ] 

print(ranking_best)
#Se selecciona la variable player_id de los jugadores del ranking con valores únicos
#Para tenerlos en una colección para su posterior uso
unique_player_ids <- (ranking_best$player_id)
#Una vez obtenidos los jugadores se requiere sus datos mas detallados
#como ejemplo la fecha de nacimiento, nombres y apellidos
#Se carga la información de los jugadores
data(atp_players)
#Se visualiza los datos de los jugadores
print(atp_players)
#Se omite los datos NA
atp_players <- na.omit(atp_players)
#Se obtiene los datos más detallados de los jugadores seleccionados
#combinando ranking_best con atp_players y ordenando por ranking transfromado a número
ranking_best_detail <- merge(ranking_best, atp_players,  by = 'player_id')
ranking_best_detail <- ranking_best_detail[order(ranking_best_detail$ranking), ]
ranking_best_detail$ranking <- as.numeric(ranking_best_detail$ranking)
ranking_best_detail$name <- paste(ranking_best_detail$name , "(" , ranking_best_detail$country_code,")")
#Se visualiza el listado de jugadores 
print(ranking_best_detail)

#Se grafica utilizando puntos que representan los jugadores en coordenas donde:
#x representa el nombre del jugador ordenado por ranking descendentemente
#y y representa el ranking del jugador.
#Utilizamos la función coord_flip() para girar el gráfico 90 grados y visualizar 
#de mejor manera el nombre de los jugadores.

ggplot(ranking_best_detail, aes(x = reorder(name  , -ranking), y = ranking)) +
  geom_point(size = 2, color = "green") +
  geom_segment(aes(x = name, xend = name, y = 0, yend = ranking), color = "blue") +
  coord_flip() +
  labs(x = "Jugador", y = "Puntos de Ranking del último torneo jugado (exitente en la base de datos en el 2023)", 
  title = "Puntos de Ranking de los Jugadores") +
  scale_y_continuous(breaks = seq(1, 50, by = 1))

#Se calcula cuantos años cumplió cada jugador en el año 2023 a la fecha máxima de torneo del año
# max_ranking_date y se asigna a una nueva variable llamada age_2023
ranking_best_detail$age_2023 <- interval(ranking_best_detail$dob, as.Date(max_ranking_date)) %/% years(1)
#Se ordena por edad de forma descendente
ranking_best_detail <- ranking_best_detail[order(ranking_best_detail$age_2023, decreasing = TRUE ) , ]
#Se visualiza la información de los jugadores mejor ranqueados con edad al 2023
print(ranking_best_detail)

#Se grafica los jugadores ordenados por edad descendente 
# Crear el gráfico de dispersión

ggplot(ranking_best_detail, aes(x = reorder(name, -age_2023), y = age_2023)) +
  geom_point(size = 2, color = "black") +
  geom_segment(aes(x = name, xend = name, y = 0, yend = age_2023), color = "#D2691E") +
  coord_flip() +
  labs(x = "Jugador", y = "Edad en años cumplidos a la fecha del último torneo registrado (2023-02-13)", 
       title = "Jugadores y edad en años cumplidos a la fecha del último torneo registrado (2023-02-13)") +
  scale_y_continuous(breaks = seq(1, 50, by = 1))


# Se grafica con un diagrama de barras de las edades y sus frecuencias
barplot(table(ranking_best_detail$age_2023), col = "skyblue", xlab = "Edades, años cumplidos a la fecha de torneo", ylab = "Frecuencia", main = "Distribución de Edades de los jugadores")


#Se requiere verificar a que edad tienen registrado su primer partido oficial en la ATP
#Se carga datos de partidos de la ATP
data(atp_matches)
#Se visualiza los datos de los partidos para familiarizarse
print(atp_matches)
#Se selecciona los datos del primer partido oficial en la ATP 
#que han tenido todos los jugadores para luego obtenr solo los datos de los jugadores seleccionados
#Se verifica que la fecha de torneo sea las más antigua (mínima) sin considerar si el jugador 
#ganó o perdió y se considera solo los años cumplidos.
fecha_min_por_jugador <- atp_matches %>%
  group_by(winner_id) %>%
  summarize(date_min_match = min(tourney_start_date),
            age_match = floor(min(winner_age))) %>%
  bind_rows(
    atp_matches %>%
      group_by(loser_id) %>%
      summarize(date_min_match = min(tourney_start_date),
            age_match = floor(min(loser_age)))
  ) %>%
  rename(player_id = winner_id)

#Se selecciona la variable player_id,date_min_match,age_match  
fecha_min_por_jugador <- fecha_min_por_jugador[, c(1,2,3)]
#Se combina los datos de los mejore 50 jugadores antes selecionados con los datos 
#de los partidos con fechas mínimas (mas antiguas) y se ordena por fecha de partido por jugador 
fecha_min_por_jugador_filtrado <- merge(ranking_best_detail,fecha_min_por_jugador, by = 'player_id')
fecha_min_por_jugador_filtrado <- fecha_min_por_jugador_filtrado[order(fecha_min_por_jugador_filtrado$age_match), ]
#Se visualiza los jugadores mejor rankeados 2023 con la fecha de su primer partido en la ATP
print(fecha_min_por_jugador_filtrado)

# Crear el gráfico de dispersión
ggplot(fecha_min_por_jugador_filtrado, aes(x = reorder(name, -age_match), y = age_match)) +
  geom_point(size = 2, color = "red") +
  geom_segment(aes(x = name, xend = name, y = 0, yend = age_match), color = "orange") +
  coord_flip() +
  labs(x = "Jugador", y = "Edad en años cumplidos a la fecha del primer partido oficila jugado en la ATP", 
       title = "Edad en años cumplidos de los jugadores seleccionados para el análisis") +
  scale_y_continuous(breaks = seq(1, 50, by = 1))


# Crear el gráfico de densidad con ggplot2
ggplot(fecha_min_por_jugador_filtrado, aes(x = age_match)) +
  geom_density(color = "blue", fill = "skyblue", alpha = 0.5) +
  labs(x = "Edad", y = "Densidad", title = "Distribución de Edades con Curva de Densidad")


###################################################################
### Edad promedio de todos los jugadores que  ganan los partidos ##
###################################################################
#Se obtiene la edad promedio de todos los jugadores que ganan los partidos en un torneo
mean_age_winner <- summary(atp_matches$winner_age)[4]
#Se visualiza la media de la edad de los jugadores que ganan los partidos 
print(paste("Edad promedio de todo los jugadores que ganan un partido: ",round(mean_age_winner,2), " años")) 

###################################################################
### Al obtener la edad promedio, contar cuantos partidos        ### 
### ganados tienen antes y después, los jugadores seleccionados ###
### anteriormente                                               ### 
###################################################################

#Se obtiene un subset de los partidos ganados de los jugadores mejor rankeados 2023 cuando su edad
#es menor igual a la edad promedio con la que los jugadores suelen ganar los partidos
subset_match_menor <- subset(atp_matches, atp_matches$winner_id %in% unique_player_ids & atp_matches$winner_age <= mean_age_winner)
#Se cuenta cuantos partidos por jugador han ganado, agrupando por jugador
match_menor <- subset_match_menor %>% group_by(winner_id) %>%  summarize(match_before_equal = n())
print(match_menor)


#Se obtiene un subset de los partidos ganados de los jugadores mejor rankeados 2023 cuando su edad
#es mayor a la edad promedio con la que los jugadores suelen ganar los partidos
subset_match_mayor <- subset(atp_matches, atp_matches$winner_id %in% unique_player_ids & atp_matches$winner_age > mean_age_winner)
#Se cuenta cuantos partidos por jugador (antes seleccionados) 
#han ganado agrupando por jugador
match_mayor <- subset_match_mayor %>%   group_by(winner_id) %>%  summarize(match_after = n())
print(match_mayor)

#Se obtiene los datos de todos los partidos ganados por los jugadores mejor rankeados 2023
subset_match_total <- subset(atp_matches, atp_matches$winner_id %in% unique_player_ids)
match_total <- subset_match_total %>%   group_by(winner_id) %>%  summarize(match_total = n())
print(match_total)

#Combino los dos dataframes con los partidos ganados antes y después de la edad promedio
players_before_after <- merge(match_menor, match_mayor,by = "winner_id")
#Combino el dataframe obtenido con el dataframe con los partidos totales ganados por jugador 
players_total_before_after <- merge(players_before_after, match_total,by = "winner_id")
#Renombro la variable winner_id
players_total_before_after <- players_total_before_after %>% rename(player_id = winner_id)
only_name_player <- ranking_best_detail[, c('name','player_id' )]
#Combino el dataframe obtenido con el dataframe de los jugadores para obtener el nombre del jugador
players_total_before_after <- merge(players_total_before_after, only_name_player,by = "player_id")
print(players_total_before_after)


# Reorganizar los datos en formato largo
datos_largo <- pivot_longer(players_total_before_after, cols = c(match_before_equal, match_after), names_to = "tipo_partido", values_to = "partidos")

# Crear el gráfico de barras agrupadas
ggplot(datos_largo, aes(x = factor(name), y = partidos, fill = tipo_partido)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Jugador", y = "Número de Partidos", fill = "Tipo de Partido") +
  scale_fill_manual(values = c("skyblue", "salmon"), labels = c("Antes edad promedio", "Después edad promedio")) +
  theme_minimal() +
  coord_flip() +
  ggtitle("Partidos ganados antes y después de la edad promedio donde los jugadores ganan los partidos")
