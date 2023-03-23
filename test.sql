SELECT *
FROM users
LIMIT 30;

SELECT *
FROM progress
LIMIT 30;

/* What are the top 25 schools (.edu domains)  */
SELECT email_domain, COUNT(email_domain)
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;

/* How many .edu learners are located in New York */
SELECT email_domain, city, COUNT(city)
FROM users
WHERE email_domain LIKE '%.edu'
	AND city LIKE 'New York'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 25;

/* How many of Codecademy learners are using the mobile app */
SELECT mobile_app, COUNT(mobile_app)
FROM users
GROUP BY 1;
   
      

/* Using strftime to see do different schools prefer different courser? */
SELECT sign_up_at,
   strftime('%H', sign_up_at)
FROM users
GROUP BY 1
LIMIT 20;

/* What courses are the New York students taking */
SELECT *
FROM users
INNER JOIN progress
	ON users.user_id = progress.user_id
WHERE city LIKE 'New York'
GROUP BY email_domain
LIMIT 100;


/* What courses are the Chicago students taking */
SELECT *
FROM users
INNER JOIN progress
	ON users.user_id = progress.user_id
WHERE city LIKE 'Chicago'
GROUP BY email_domain
LIMIT 100;

