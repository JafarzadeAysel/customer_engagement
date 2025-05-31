SELECT  ci.course_id, ci.course_title, 
    SUM(sl.minutes_watched) AS total_minutes_watched,  
    SUM(sl.minutes_watched) / COUNT(sl.student_id) AS average_minutes,
    COUNT(DISTINCT cr.course_rating) AS number_of_ratings,
    AVG(cr.course_rating) AS average_rating
FROM 365_course_info ci
JOIN 365_student_learning sl 
    ON ci.course_id = sl.course_id
JOIN 365_course_ratings cr 
    ON ci.course_id = cr.course_id
GROUP BY ci.course_id, ci.course_title;