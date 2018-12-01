library(readr)
us_500 <- read_csv("us-500.csv")

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

