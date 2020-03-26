SELECT Alias,geometry, Sum("area")/(200*200*PI())AS "LCRATIO" /*:double*/,
CASE 
WHEN LOWER(ITEM2012) LIKE "%continuous%" THEN "urban"
WHEN LOWER(ITEM2012) LIKE "%green%" 
OR LOWER(ITEM2012) LIKE "%pastures%"
OR LOWER(ITEM2012) LIKE "%crops%"
THEN "green"
WHEN LOWER(ITEM2012) LIKE "%roads%" 
THEN "roads"
WHEN LOWER(ITEM2012) LIKE "%industrial%"
OR LOWER(ITEM2012) LIKE "%structures%"
OR LOWER(ITEM2012) LIKE "%without%"
OR LOWER(ITEM2012) LIKE "%mineral%"
OR LOWER(ITEM2012) LIKE "%rail%"
OR LOWER(ITEM2012) LIKE "%sports%"
OR LOWER(ITEM2012) LIKE "%water%"
THEN "other"
END LCTYPE /*:text*/
FROM added_geom_info
GROUP BY Alias,LCTYPE