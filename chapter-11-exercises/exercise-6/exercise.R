# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
flig = na.omit(flights) #data cleaning
dest_arrDelay = flig %>% group_by(dest) %>% summarise(mArrDelay = mean(arr_delay))
joinAirport = left_join(dest_arrDelay, airports, by = c("dest" = "faa"))
joinAirport %>% filter(mArrDelay == max(mArrDelay)) %>% select(name)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
line_mArrDelay = flig %>% group_by(carrier) %>% summarise(mArrDelay = mean(arr_delay))
joinLine = line_mArrDelay %>% left_join(airlines)
joinLine %>% filter(mArrDelay == min(mArrDelay)) %>% select(name)
