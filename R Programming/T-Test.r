# T-TEST

# 1 - A fertilizer mixing machine is set to give 12 kg of nitrate for every 100 kg of fertilizer. Ten
# bags of 100 kg each are examined. The percentage of nitrate so obtained is: 11, 14, 13, 12, 13,
# 12, 13, 14, 11, and 12. Is there reason to believe that the machine is defective?
  
data <- c(11, 14, 13, 12, 13, 12, 13, 14, 11, 12)
res <- t.test(data, mu = 12)
print(res)

# we accept H0

# 2 - The electric bulbs of 10 random samples from a large consignment gave the following data:
# Item  | Life in ’000 hours
# 1 | 4.2
# 2 | 4.6
# 3 | 3.9
# 4 | 4.1
# 5 | 5.2
# 6 | 3.8
# 7 | 3.9
# 8 | 4.3
# 9 | 4.4
# 10 | 5.6
# Can we accept the hypothesis that the average life time of the bulbs is 4000 hours.

data <- c(4200, 4600, 3900, 4100, 5200, 3800, 3900, 4300, 4400, 5600)
res <- t.test(data, mu = 4000)
print(res)

# we accept H0

# 3 - Two independent groups of 10 children were tested to find how many digits they could
# repeat from memory after hearing them. The results are as follows:
# Group - A 8 6 5 7 6 8 7 4 5 6
# Group - B 10 6 7 8 6 9 7 6 7 7
# Is the difference between the mean scores of the two groups significant at 5% level of significant?
  
data_a <- c(8, 6, 5, 7, 6, 8, 7, 4, 5, 6)
data_b <- c(10, 6, 7, 8, 6, 9, 7, 6, 7, 7)

res <- t.test(data_a, data_b)
print(res)

# we accept H0

# 4 - In a test given to two groups of students, the marks obtained are as follows:
# First group : 18 20 36 50 49 36 34 49 41
# Second group : 29 28 26 35 30 44 46
# Examine the significance of the difference between the arithmetic mean of the marks
# secured by the students of the above two groups

data_a <- c(18, 20, 36, 50, 49, 36, 34, 49, 41)
data_b <- c(29, 28, 26, 35, 30, 44, 46)

res <- t.test(data_a, data_b)
print(res)

# we accept H0

# 5 - 12 students were given intensive coaching and 5 tests were conducted in a month. The
# scores of tests 1 and 5 are given below.
# No. of students: 1 2 3 4 5 6 7 8 9 10 11 12
# Marks in 1st test: 50 42 51 26 35 42 60 41 70 55 62 38
# Marks in 5th test: 62 40 61 35 30 52 68 51 84 63 72 50
# Do the data indicate any improvement in the scores obtained in tests 1 and 5.

data_a <- c(50, 42, 51, 26, 35, 42, 60, 41, 70, 55, 62, 38)
data_b <- c(62, 40, 61, 35, 30, 52, 68, 51, 84, 63, 72, 50)
res <- t.test(data_a, data_b, paired = T)
print(res)

# we fail to accept H0