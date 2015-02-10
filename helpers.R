require(prodlim)

# read in csv of parameters   
data <- read.csv("data/LOOKUP_TABLE.csv")

# remove all columns from "data" that are not user-inputs 
data <- data[,c("TOTALN",
              "initial_perc_FP_cover",
              "initial_perc_SAV_cover",
              "size",
              "shape",
              "wind_direction")]
  
  
