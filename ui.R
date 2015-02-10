# ui.R

library(shiny)
library(downloader)

shinyUI(pageWithSidebar(
  
  headerPanel("FP-SAV interactions: Water body size & shape"),
  
  sidebarPanel(    
    h3("User Inputs"),
    selectInput("TOTALN", 
                "Total N (mg/L):",
                choices=c(1,2,3,4,5,6,7,8,9),
                selected=5
    ),

    selectInput("initial_perc_FP_cover", 
                "Initial FP cover(%):",
                choices=c(1,5,15,30,45),
                selected=15
    ),
    selectInput("initial_perc_SAV_cover", 
                "Initial SAV cover(%):",
                choices=c(1,5,15,30,45),
                selected=15
    ),
    
    ### DOUBLE CHECK THAT THIS SECTION IS RIGHT ###
    
    selectInput("size", 
                "Water body size:",
                choices=list("0.04 ha"="small",
                             "1 ha"="med1",
                             "2.25 ha"="med2",
                             "6.25 ha"="large",
                             "9 ha"="XL")
    ), 
    selectInput("shape", 
                "Water body shape:",
                choices=list("tee"="tee",
                             "cross"="cross",
                             "eight"="eight",
                             "hook"="hook",
                             "rectangle"="rectangle")
    ), 
    selectInput("wind_direction", 
                "Wind direction:",
                choices=list("Up"="up",
                             "Random"="all")
    ), 
    
    ### DOUBLE CHECK THAT THIS SECTION IS RIGHT ###
    
    hr(),
    strong("Simulation number:"),
    textOutput("simulation")
    
  ),
    
  mainPanel(
    tabsetPanel(type = "tabs",     
        ############## 
        # WELCOME #
        ##############
        tabPanel(title="Welcome",
        h3("Welcome"),
        imageOutput("alt_states",height="50%",width="50%"),
        br(),
        br(),
        h3("Table of Contents:"),
        HTML("<strong> - Initial:</strong> Spatial plot of vegetation, initial."),
        br(),
        HTML("<strong> - Mid-Point:</strong> Spatial plot of vegetation, 1/2 through simulation."),
        br(),
        HTML("<strong> - Final:</strong> Spatial plot of vegetation, end of simulation."),
        br(),
        HTML("<strong> - % Cover:</strong> Plot of % cover by each plant group through time."),
        br(),
        HTML("<strong> - Nutrients:</strong> Plot of nutrient concentrations through time."),
        br(),
        HTML("<strong> - Alt. States:</strong> Plot summarizing multiple simulations from different initial conditions."),
        br(),
        br(),
        h3("Contact:"),
        p("Please direct any comments, questions, or error reports to:"),
        HTML("<strong>Michael J. McCann</strong>"),
        br(),
        HTML("Department of Ecology & Evolution"),
        br(),
        HTML("Stony Brook University"),
        br(),
        HTML("Stony Brook, NY USA"),
        br(),
        HTML("mccann AT life.bio.sunysb.edu"),
        br(),
        HTML("mccannecology.weebly.com"),
        br(),
        br(),
        HTML("<I>Last updated: 4 February 2015.</I>"),
        br(),
        br()
        ),
                
        ############### 
        # INITIAL TAB #
        ###############
        tabPanel(title="Initial", 
        h3("Initial conditions"),
        imageOutput("initial",height="75%",width="75%"),
        br(),
        strong("Notes:"),
        p("Each cell is 1 square meter."),
        p("Units for biomass are g dw/m2."),
        p("Scale bars are unique for each plot."),
        p("The plot 'LAND' shows a value of 0 for water (yellow or white) 
          and a value of 1 (green) for land."),
        strong("Warning:"),
        p("This is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          "),
        strong("Warning:"),
        p("Color scale is not consistent across plots 
          (i.e., equal colors are not equal biomass).")
        ),
        
        ############## 
        # MIDDLE TAB #
        ##############
        tabPanel(title="Mid-Point",
        h3("Mid-point"),
        imageOutput("middle",height="75%",width="75%"),
        br(),
        strong("Notes:"),
        p("Each cell is 1 square meter."),
        p("Units for biomass are g dw/m2."),
        p("Scale bars are unique for each plot."),
        p("The plot 'LAND' shows a value of 0 for water (yellow or white) 
          and a value of 1 (green) for land."),
        strong("Warning:"),
        p("This is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          "),
        strong("Warning:"),
        p("Color scale is not consistent across plots 
          (i.e., equal colors are not equal biomass).")
        ),
        
        ############# 
        # FINAL TAB #
        #############
        tabPanel(title="Final",
        h3("Final conditions"),
        imageOutput("final",height="75%",width="75%"),
        br(),
        strong("Notes:"),
        p("Each cell is 1 square meter."),
        p("Units for biomass are g dw/m2."),
        p("Scale bars are unique for each plot."),
        p("The plot 'LAND' shows a value of 0 for water (yellow or white) 
          and a value of 1 (green) for land."),
        strong("Warning:"),
        p("This is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          "),
        strong("Warning:"),
        p("Color scale is not consistent across plots 
          (i.e., equal colors are not equal biomass).")
        ),
        
        ############# 
        # COVER TAB #
        #############
        tabPanel(title="% Cover", 
        h3("Percent cover through time"),
        imageOutput("cover",height="75%",width="75%"),
        br(),
        strong("Warning:"),
        p("This is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          ")
        ),
        
        ################# 
        # NUTRIENTS TAB #
        #################
        tabPanel(title="Nutrients",
        h3("Nutrients through time"),
        imageOutput("nutrients",height="75%",width="75%"),
        strong("Note:"),
        p("Phosphorus-dependent growth is not included in this model."),
        strong("Warning:"),
        p("This is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          ")
        ),
                
        ################# 
        # ALT STATE TAB #
        #################
        tabPanel(title="Alt. States",
        h3("Alternative State Trajectory"),
        imageOutput("AltStatePlot",height="100%"),
        br(),
        h4("Note:"),
        p("This plot summarizes the result of varying the initial FP and SAV conditions. 
          All other variables are the same."),
        strong("Warning:"),
        p("Each trajectory is the result of a single, stochastic simulation.
          Results may differ if this simulation is re-run.
          ")
        )
                  
    )
  )
)
)
  
