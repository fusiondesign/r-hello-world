library(readr)
library(plotly)
packageVersion('plotly')

Sys.setenv("plotly_username"="brianroyer")
Sys.setenv("plotly_api_key"="aqzGuf2JwgHuDys3wack")

us_500 <- read_csv("us-500.csv")

p <- plot_ly(
  x = c("giraffes", "orangutans", "monkeys"),
  y = c(20, 14, 23),
  name = "SF Zoo",
  type = "bar"
)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
htmlwidgets::saveWidget(as_widget(p), "graph.html")

# Returns user name from row
get <- function(type, person) {
  value <- us_500[person, type]
  return(value)
}

# Void return function
say_hello <- function(person) {
  name <- get('first_name', person)
  city <- get('city', person)
  print(paste("Hello,", name, "from", city))
}

# Loop over rows and pass 
for (person in 1:nrow(us_500)) {
  say_hello(person)
}

