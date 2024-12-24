# view dataset
SELECT * FROM dataset;

# drop unwanted columns
ALTER TABLE dataset 
DROP COLUMN `Freedom To Make Life Choices`,
DROP COLUMN `Positive Affect`,
DROP COLUMN `Negative Affect`,
DROP COLUMN `Social Support`,
DROP COLUMN `Perceptions Of Corruption`,
DROP COLUMN `Generosity`,
DROP COLUMN `Regional Indicator`,
DROP COLUMN `Confidence In National Government`;

# common countries with top highest gdp per capita and life ladder scores
SELECT a.`Country Name`
FROM (
    SELECT `Country Name`, `Log GDP Per Capita`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Log GDP Per Capita` DESC
    LIMIT 10
) a
JOIN (
    SELECT `Country Name`, `Life Ladder`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Life Ladder` DESC
    LIMIT 10
) b
ON a.`Country Name` = b.`Country Name`;

# common countries with top highest gdp per capita and healthy life expectancy at birth
SELECT a.`Country Name`
FROM (
    SELECT `Country Name`, `Healthy Life Expectancy At Birth`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Healthy Life Expectancy At Birth` DESC
    LIMIT 10
) a
JOIN (
    SELECT `Country Name`, `Log GDP Per Capita`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Log GDP Per Capita` DESC
    LIMIT 10
) b
ON a.`Country Name` = b.`Country Name`;

# average life ladder score
SELECT AVG(`Life Ladder`)
FROM dataset; # output - 5.8

# average log gdp per capita
SELECT AVG(`Log GDP Per Capita`)
FROM dataset; # output - 9.3

# top countires with lowest log gdp per capita and highest life ladder
SELECT `Country Name`, `Log GDP Per Capita`, `Life Ladder`
FROM dataset
WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
AND `Log GDP Per Capita` < 9.3 
AND `Life Ladder` > 5.8;

# top countires with highest log gdp per capita and lowest life ladder
SELECT `Country Name`, `Log GDP Per Capita`, `Life Ladder`
FROM dataset
WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
AND `Log GDP Per Capita` > 9.3 
AND `Life Ladder` < 5.8;

# common countries with top lowest gdp per capita and life ladder
SELECT a.`Country Name`
FROM (
    SELECT `Country Name`, `Life Ladder`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Life Ladder` ASC
    LIMIT 10
) a
JOIN (
    SELECT `Country Name`, `Log GDP Per Capita`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Log GDP Per Capita` ASC
    LIMIT 10
) b
ON a.`Country Name` = b.`Country Name`;

# common countries with top lowest gdp per capita and healthy life expectancy at birth
SELECT a.`Country Name`
FROM (
    SELECT `Country Name`, `Healthy Life Expectancy At Birth`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Healthy Life Expectancy At Birth` ASC
    LIMIT 10
) a
JOIN (
    SELECT `Country Name`, `Log GDP Per Capita`
    FROM dataset
    WHERE `Year` = (SELECT MAX(`YEAR`) FROM dataset)
    ORDER BY `Log GDP Per Capita` ASC
    LIMIT 10
) b
ON a.`Country Name` = b.`Country Name`;