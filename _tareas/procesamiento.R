library(tidyverse)
ci_tarea2 <- sort(list.files('tareas/tarea_2/'))%>%
  str_to_lower()%>%
  str_remove_all('tareas_2_|tarea_2_|\\.r|\\.R')%>%
  as.numeric()



ci_tarea2
datapasta::vector_paste_vertical(ci_tarea)
# 26260451
#   27222651
#   27487707
#   27531901
#   27600050
#   27660553
#   27669710
#   27988203
#   28210812
#   28306246
#   29521323
#   29658512
#   29686193
#   29756414
#   29765256
#   30037872
#   30138648
#   27995146
  
############# tarea 3
ci_tarea3 <- sort(list.files('tareas/tarea_3/'))%>%
  str_to_lower()%>%
  str_remove_all('tarea_3_|tarea_3_|\\.r')%>%
  as.numeric()

datapasta::vector_paste_vertical(ci_tarea3)
# 27222651
# 27487707
# 27531901
# 27600050
# 27660553
# 27669710
# 27988203
# 27995146
# 28210812
# 28306246
# 29521323
# 29658512
# 29686193
# 29756414
# 30037872
# 30138648


