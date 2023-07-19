#  Test app for leaflet widget in estuary-explorer

library(shiny)
#library(terra)
library(sf)
library(leaflet)

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Leaflet test"),

    # Sidebar with a slider input for coords 
    sidebarLayout(
        sidebarPanel(
            sliderInput("lat",
                        "Latitude:",
                        min = 50.1,
                        max = 51.1,
                        value = 50.35),
            sliderInput("lon",
                        "Longitude:",
                        min = -5.225,
                        max = -2,
                        value = -4.153)
        ),
        
       # Show map with point at selected coords
        mainPanel(
          leafletOutput("map")
          )
    )
)

# Define server logic
server <- function(input, output) {
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(lng = input$lon,
                 lat = input$lat)
  })

}

# Run 
shinyApp(ui = ui, server = server)
