// Activity 1

SELECT
    emps.Last_Name,
    emps.Hire_Date
FROM
    emps
WHERE
    emps.Hire_Date LIKE "1994-__-__"

// Activity 2

SELECT
    emps.Last_Name,
    emps.Salary,
    emps.Commission_pct
FROM
    emps
WHERE
    emps.Commission_pct IS NOT NULL
ORDER BY
    emps.Salary
DESC

// Activity 3

SELECT
    emps.Last_Name
FROM
    emps
WHERE
    emps.Last_Name LIKE "%a%" AND emps.Last_Name LIKE "%e%"

// Activity 4

SELECT
    emps.Last_Name,
    emps.Department_Id,
    depts.Department_Name
FROM
    emps
JOIN depts ON(
        emps.Department_Id = depts.Department_id
    )

// Activity 5

SELECT
    emps.Last_Name,
    depts.Department_Name,
    depts.Location_id,
    locs.City
FROM
    emps
JOIN depts ON emps.Department_Id = depts.Department_id
JOIN locs ON depts.Location_id = locs.Location_id
WHERE
    emps.Commission_pct IS NOT NULL

// Activity 6

SELECT
    emps.Last_Name,
    emps.Job_Id,
    emps.Department_Id,
    depts.Department_Name
FROM
    emps
JOIN depts ON
    (
        emps.Department_Id = depts.Department_id
    )
JOIN locs ON(
        depts.Location_id = locs.Location_id
    ) AND locs.City = "Toronto"

// Activity 7

SELECT
    emps.Last_Name,
    emps.Salary,
    emps.Commission_pct
FROM
    emps
WHERE
    emps.Commission_pct IS NOT NULL
ORDER BY
    emps.Salary
DESC

// Activity 8

SELECT
    e.Last_Name "Employee",
    e.Employee_Id "EMP#",
    m.Last_Name "Manager",
    m.Employee_Id "Mgr#"
FROM
    emps e,
    emps m
WHERE
    e.Manager_id = m.Employee_Id

// Activity 9

SELECT
    ROUND(MAX(emps.Salary)) AS "Maximum",
    ROUND(MIN(emps.Salary)) AS "Minimum",
    ROUND(SUM(emps.Salary)) AS "Sum",
    ROUND(AVG(emps.Salary)) AS "Average"
FROM
    emps

// Activity 10

SELECT
    emps.Job_Id,
    MIN(emps.Salary),
    MAX(emps.Salary),
    SUM(emps.Salary),
    AVG(emps.Salary)
FROM
    emps
GROUP BY
    emps.Job_Id

// Activity 11

SELECT
    emps.Job_Id,
    COUNT(emps.Employee_Id)
FROM
    emps
GROUP BY
    emps.Job_Id

// Activity 12

FROM
    emps
WHERE
    emps.Manager_id IS NOT NULL
GROUP BY
    emps.Manager_id
HAVING
    MIN(emps.Salary) >= 6000
ORDER BY
    MIN(emps.Salary)
DESC

// Home Work

SELECT
    depts.Department_Name "Name",
    locs.City "Location",
    COUNT(emps.Employee_Id) "Number of People",
    ROUND(AVG(emps.Salary),
    2) "Salary"
FROM
    emps
JOIN depts ON emps.Department_Id = depts.Department_id
JOIN locs ON depts.Location_id = locs.Location_id
GROUP BY
    depts.Department_Name