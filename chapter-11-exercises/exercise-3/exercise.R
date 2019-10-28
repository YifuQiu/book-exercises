# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
car15 = filter(vehicles, year == 2015, make == "Acura")
besthwy = filter(car15, hwy == max(hwy))
besthwy2015model = select(besthwy, model)


# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
b2015model = select(
  filter(
    filter(
        vehicles, year == 2015, make == "Acura"
    ), hwy == max(hwy)
  ), model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
b2015_model = vehicles %>% filter(year == 2015,make == "Acura") %>% 
  filter(hwy == max(hwy)) %>% select(model)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times





