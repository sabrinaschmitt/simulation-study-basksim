#####################################################
# Create illustration code to display in the thesis #
#####################################################

# load package
library(basksim)

# create design object
design_app <- setup_app(k = 3, p0 = 0.15, shape1 = 1,
                        shape2 = 2)

# illustrate get_details()
set.seed(15062024)
get_details(design = design_app, n = c(15, 20, 25),
            p1 = c(0.15, 0.5, 0.5), lambda = 0.95, iter = 100)

# illustrate get_results()
set.seed(15062024)
get_results(design = design_app, n = c(15, 20, 25),
            p1 = c(0.15, 0.5, 0.5), lambda = 0.95, iter = 100)

# illustrate get_data()
set.seed(15062024)
get_data(k = 3, n = c(15, 20, 25), p = c(0.15, 0.15, 0.3),
         iter = 100, type = "matrix")

# illustrate opt_design() using Fujikawa's design and get_scenarios()
set.seed(15062024)
design_fujikawa <- setup_fujikawa(k = 3, p0 = 0.15)
scenarios <- get_scenarios(design = design_fujikawa, p1 = 0.5)
opt_design(design = design_fujikawa, n = c(15, 20, 25),
           alpha = 0.05, design_params = list(epsilon = c(1,2),
                                              tau = c(0,0.5)),
           scenarios = scenarios, prec_digits = 3)
