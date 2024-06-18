#########################
# Choose Response Rates #
#########################
library(basksim)

design_cpp <- setup_cpp(k = 5, p0 = 0.15)

# ----- pattern 1 - 4 -----
# Linear
set.seed(23112023)
get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
            p1 = c(rep(0.3,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
            p1 = c(rep(0.35,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
            p1 = c(rep(0.4,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

# Grouped
get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
            p1 = c(rep(0.3,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
            p1 = c(rep(0.35,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
            p1 = c(rep(0.4,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

# High Variance
get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
            p1 = c(rep(0.3,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
            p1 = c(rep(0.35,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
            p1 = c(rep(0.4,5)),
            lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities

# ----- BGN -----

matrix_BGN <- matrix(data = NA, nrow = 3, ncol = 2)

# Linear
set.seed(23112023)
matrix_BGN[1,1] <- get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.35),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]

matrix_BGN[1,2] <- get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.4),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]

# Grouped
matrix_BGN[2,1] <- get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.35),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]

matrix_BGN[2,2] <- get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.4),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]

# High Variance
matrix_BGN[3,1] <- get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.35),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]

matrix_BGN[3,2] <- get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
                               p1 = c(0.15, 0.15, 0.15, 0.15, 0.4),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[5]


# ----- SGN -----

matrix_SGN <- matrix(data = NA, nrow = 3, ncol = 2)

# Linear
set.seed(23112023)
matrix_SGN[1,1] <- get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
                               p1 = c(0.35, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]

matrix_SGN[1,2] <- get_details(design = design_cpp, n = c(10, 15, 20, 25, 30),
                               p1 = c(0.4, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]

# Grouped
matrix_SGN[2,1] <- get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
                               p1 = c(0.35, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]

matrix_SGN[2,2] <- get_details(design = design_cpp, n = c(10, 10, 25, 25, 30),
                               p1 = c(0.4, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]

# High Variance
matrix_SGN[3,1] <- get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
                               p1 = c(0.35, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]

matrix_SGN[3,2] <- get_details(design = design_cpp, n = c(10, 10, 10, 20, 30),
                               p1 = c(0.4, 0.15, 0.15, 0.15, 0.15),
                               lambda = 0.95, tune_a = 1, tune_b = 1, iter = 10000)$Rejection_Probabilities[1]



# ----- rename matrices -----

colnames(matrix_BGN) <- c("0.35", "0.4")
colnames(matrix_SGN) <- c("0.35", "0.4")
