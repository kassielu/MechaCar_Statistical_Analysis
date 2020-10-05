######################## CHALLENGE 1 STARTS HERE ###############################

# Use the library() function to load the dplyr package
library(dplyr)

# Read in a CSV file
MechaCar_table <- read.csv(file='MechaCar_mpg.csv')

head(MechaCar_table)
#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + 
     AWD,data=MechaCar_table) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + 
             AWD,data=MechaCar_table)) 


######################## CHALLENGE 2 STARTS HERE ###############################

# Read in a CSV file
Suspension_Coil_table <- read.csv(file='Suspension_Coil.csv')

#create a total_summary dataframe using the summarize() function to get the mean
#, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- Suspension_Coil_table %>% summarize(Mean=mean(PSI),Median=median(PSI)
                                                     ,Variance=var(PSI),SD=sd(PSI)) 

#creates a lot_summary dataframe using the group_by() and the summarize() functions 
#to group each manufacturing lot by the mean, median, variance, and standard deviation
#of the suspension coil's PSI column
lot_summary <- Suspension_Coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI)
                                                                                   ,Variance=var(PSI),SD=sd(PSI)) 

######################## CHALLENGE 3 STARTS HERE ###############################

#write an RScript using the t.test() function to determine if the PSI across all 
#manufacturing lots is statistically different from the population mean of 1,500 
#pounds per square inch

?t.test()
boxplot(Suspension_Coil_table$PSI)

# to determine if the PSI across all manufacturing lots is statistically different 
# from the population mean of 1,500 pounds per square inch
t.test(Suspension_Coil_table$PSI, mu=1500)


# write three more RScripts in your MechaCarChallenge.RScript using the t.test() 
#function and its subset() argument to determine if the PSI for each manufacturing 
#lot is statistically different from the population mean of 1,500 pounds per square 
#inch
t.test(subset(Suspension_Coil_table, Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(Suspension_Coil_table, Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(Suspension_Coil_table, Manufacturing_Lot == "Lot3")$PSI, mu=1500)