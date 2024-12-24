# CHI-SQUARE TEST
# no assumption of normality
# syntax - chisq.test(x = observed frequency, p = probability)
# what is required for this test - actual frequency and expected frequency
# chi square dist is squared of std normal variate

# QUESTION 1 - the following figures show the distribution of digits in numbers chosen at random
# from a telephone directory:
# digits - 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
# frequency - 1026, 1107, 997, 966, 1075, 933, 1107, 972, 853 (total - 10,000)

obs <- c(1026, 1107, 997, 966, 1075, 933, 1107, 972, 964, 853)
prob <- c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)

chisq_test <- chisq.test(x = obs, p = prob)
print(chisq_test)

# so the p value is probability and if it is less than default alpha value (0.05), we 
# fail to accept null hypothesis. Here it is, therefore we fail to accept H0.

# QUESTION 2 - the theory predicts the proportion of beans in the four groups A, B, C and D
# should be 9:3:3:1. In an experiment among 1600 beans, the number in four groups were 882,
# 313, 287 and 118. does the experimental result support the theory?

obs <- c(882, 313, 287, 118)
prob <- c(9/16, 3/16, 3/16, 1/16)

chisq_test <- chisq.test(x = obs, p = prob)
print(chisq_test)

# we accept null hypothesis as it is larger than 0.05

# QUESTION 3
# two sample polls of votes for two candidates A and B for a public office are taken, one
# from among the residents of rural areas. The results are given in the table. Examine
# whether the nature of the area is related to voting preference in this election
# Rural | 620 - 380
# Urban | 550 - 450

data <- matrix(c(620, 550, 380, 450), nrow = 2, dimnames = list(c("Rural", "Urban"), c("A", "B")))
data

chisq.test(data)
# 0.0017 < 0.05. therefore we reject null hypothesis