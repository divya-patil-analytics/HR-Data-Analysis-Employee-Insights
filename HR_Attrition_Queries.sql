CREATE TABLE hr_data (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    AttritionFlag INT,
    Tenure INT,
    AgeGroup VARCHAR(20)
);
SELECT COUNT(*) AS TotalEmployees FROM batch.`hr-employee-attrition`;

SELECT Department, COUNT(*) AS TotalEmployees
FROM batch.`hr-employee-attrition`
GROUP BY Department;

SELECT Department, COUNT(*) AS AttritionCount
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY Department;

SELECT Gender, COUNT(*) AS AttritionCount
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY Gender;

SELECT Age, COUNT(*) AS AttritionCount
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY Age;

SELECT WorkLifeBalance, COUNT(*) AS EmployeesLeft
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY WorkLifeBalance;

SELECT JobRole, AVG(MonthlyIncome) AS AvgSalary
FROM batch.`hr-employee-attrition`
GROUP BY JobRole
ORDER BY AvgSalary DESC;

SELECT EmployeeNumber, JobSatisfaction, PerformanceRating
FROM  batch.`hr-employee-attrition`
WHERE PerformanceRating >= 3 AND JobSatisfaction <= 2;

SELECT OverTime, COUNT(*) AS AttritionCount
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY OverTime;

SELECT PercentSalaryHike, COUNT(*) AS EmployeesLeft
FROM batch.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY PercentSalaryHike;

SELECT EducationField, COUNT(*) AS AttritionCount
FROM batch.`hr-employee-attrition`
WHERE Attrition='Yes'
GROUP BY EducationField;

SELECT JobRole, AVG(MonthlyIncome) AS AvgSalary
FROM batch.`hr-employee-attrition`
GROUP BY JobRole;

SELECT COUNT(*) AS TotalEmployees FROM batch.`hr-employee-attrition`;
SELECT COUNT(*) AS TotalAttrition FROM batch.`hr-employee-attrition` WHERE Attrition='Yes';
SELECT 
    (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) /
    COUNT(*) AS AttritionRate
FROM  batch.`hr-employee-attrition`;

SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY Department
ORDER BY AttritionRate DESC;

SELECT 
    Gender,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY Gender
ORDER BY AttritionRate DESC;

SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY JobRole
ORDER BY AttritionRate DESC;

SELECT
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

SELECT
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low (<3000)'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium (3000-6000)'
        WHEN MonthlyIncome BETWEEN 6001 AND 12000 THEN 'High (6001-12000)'
        ELSE 'Very High (>12000)'
    END AS SalarySlab,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY SalarySlab
ORDER BY AttritionRate DESC;

SHOW COLUMNS FROM batch.`hr-employee-attrition`;

SELECT
    CASE 
        WHEN `ï»¿Age` BETWEEN 18 AND 25 THEN '18-25'
        WHEN `ï»¿Age` BETWEEN 26 AND 35 THEN '26-35'
        WHEN `ï»¿Age` BETWEEN 36 AND 45 THEN '36-45'
        WHEN `ï»¿Age` BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS AgeGroup,
    
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate

FROM batch.`hr-employee-attrition`
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

SELECT
    CASE 
        WHEN `ï»¿Age` BETWEEN 18 AND 25 THEN '18-25'
        WHEN `ï»¿Age` BETWEEN 26 AND 35 THEN '26-35'
        WHEN `ï»¿Age` BETWEEN 36 AND 45 THEN '36-45'
        WHEN `ï»¿Age` BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS AgeGroup,
    
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate

FROM batch.`hr-employee-attrition`
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

SELECT
    WorkLifeBalance,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY WorkLifeBalance
ORDER BY AttritionRate DESC;

SELECT
    OverTime,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRate
FROM batch.`hr-employee-attrition`
GROUP BY OverTime
ORDER BY AttritionRate DESC;



















