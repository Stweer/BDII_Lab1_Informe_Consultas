SELECT salman.minimo,
salman.manager id
FROM (SELECT MIN(salary) AS 'minimo',
manager id
FROM employees
WHERE salary>6000
GROUP BY manager_id) AS salman
ORDER BY salman.minimo;