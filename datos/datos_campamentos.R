library(dplyr)
library(sf)

datos <- sf::read_sf("datos/catastro_campamentos_2024.geojson")

datos2 <- datos |> 
  janitor::clean_names() |> 
  sf::st_drop_geometry() |> 
  select(nombre, region, provincia, comuna, starts_with("cut"), 
         hogares = n_hog,
         hectareas,
         area = shape_area,
         observaciones = obs, año = an_cat)

write.csv2(datos2, "datos/campamentos_chile_2024.csv")
writexl::write_xlsx(datos2, "datos/campamentos_chile_2024.xlsx")
