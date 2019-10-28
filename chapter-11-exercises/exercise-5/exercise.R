# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
#flig = na.omit(flights) #data cleaning
dep_delay_by_month = flig %>% group_by(month) %>% summarize(mDelay = mean(dep_delay, na.rm = T))


# Which month had the greatest average departure delay?
dep_delay_by_month %>% filter(mDelay == max(mDelay)) %>% select(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arr_delay_by_dest = flights %>% group_by(dest) %>% summarise(mArrDelay = mean(arr_delay, na.rm = T))
arr_delay_by_dest %>% filter(mArrDelay == max(mArrDelay)) %>% select(dest)
head(arr_delay_by_dest)

# You can look up these airports in the `airports` data frame!
View(airports)

# Which city was flown to with the highest average speed?
dest_time = flights %>% group_by(dest) %>% 
  mutate(speed = distance/air_time) %>%
  summarise(avg_speed = mean(speed, na.rm = T))
dest_time %>% filter(avg_speed==min(avg_speed, na.rm = T)) %>% select(dest)
