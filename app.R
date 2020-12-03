library("shiny")
library("dplyr")
library("ggplot2")

# Source UI and server files
source("app_ui.R")
source("app_server.R")

# Start Shiny server
shinyApp(ui = ui, server = server)