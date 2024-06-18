##################################################################################
# Visualization of the estimation accuracy using the absolute value of the bias. #
# A separate graphic is created for each scenario, comparing the results of the  #
# designs per pattern.                                                           #
##################################################################################

# required packages
library(basksim)
library(ggplot2)
library(dplyr)
library(tidyr)
library(RColorBrewer)
library(gridExtra)



# path changes depending on the operating system
if (Sys.info()[["sysname"]]=="Linux") {
  path <- "~/Home/Thesis/R/"
} else {
  path <- "U:/Thesis/R/"
}


# color selection
blues <- c("darkblue", "mediumblue", "royalblue1", "steelblue1", "skyblue")


# ----- preparation -----
names <- c("linear", "grouped", "high_variance")

pattern <- c("Null","Alternative","Ascending","Descending","Big Good Nugget",
             "Small Good Nugget")
pattern_short <- c("Null","Alternative","Ascending","Descending","BGN", "SGN")

designs <- c("Fujikawa", "CPP", "APP", "LCPP", "BMA", "BHM", "EXNEX")


global_labeller <- labeller(
  Pattern = c('Null' = "Null: p = c(0.15, 0.15, 0.15, 0.15, 0.15)",
              'Alternative' = "Alternative: p = (0.35, 0.35, 0.35, 0.35, 0.35)",
              'Ascending' = "Ascending: p = (0.15, 0.15, 0.25, 0.35, 0.35)",
              'Descending' = "Descending: p = (0.35, 0.35, 0.25, 0.15, 0.15)",
              'BGN' = "BGN: p = (0.15, 0.15, 0.15, 0.15, 0.40)",
              'SGN' = "SGN: p = (0.40, 0.15, 0.15, 0.15, 0.15)")
)



# ----- Create data frames -----
# The information from one selected scenario is listed.

# select scenario
scenario <- names[1]  # Linear (Change to 2 for Grouped and 3 for High Variance)

bias_table <- data.frame()

for(p in 1:length(pattern)){
  load(paste0(path, "Results/", scenario, "/bias/bias_", pattern[p], "_", scenario,".Rdata"))

  bias <- unname(as.matrix(bias))

  for(d in 1:length(designs)){
    df <- data.frame(Value = bias[d,], Basket = as.factor(c(1:5)),
                     Design = as.factor(designs[d]),
                     Pattern = as.factor(pattern_short[p]))

    bias_table <- rbind(bias_table, df)
  }

}



# Plot
ggplot(data = bias_table, mapping = aes(x = Design, y = Value, group = Basket, fill = Basket)) +
  geom_bar(position="dodge", stat="identity") + scale_fill_manual(values = blues) + theme_bw() +
  facet_wrap(Pattern ~ ., labeller = global_labeller, scales = 'free', ncol =2) + theme(text=element_text(size=18))
