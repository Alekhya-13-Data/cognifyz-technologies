
# Analyze the distribution of aggregate ratings and determine the most common rating range
SELECT 
    FLOOR('Aggregate rating') AS rating_range, 
    COUNT(*) AS num_restaurants
FROM 
    new_schema.Data
GROUP BY 
    rating_range
ORDER BY 
    num_restaurants DESC;

#  Calculate the average number of votes received by restaurant
SELECT 
    'Restaurant Name', 
    AVG('Aggregate rating') AS 'Average Rating', 
    COUNT(*) AS 'Number of Locations'
FROM 
    data
GROUP BY 
    'Restaurant Name'
ORDER BY 
    'Average Rating' DESC, 
    'Number of Locations' DESC;
    
# Identify the most common combinations of cuisines in the dataset

SELECT 
    Cuisines,
    COUNT(*) AS combination_count
FROM 
    data
GROUP BY 
    Cuisines
ORDER BY 
    combination_count DESC
LIMIT 4;
# Determine if certain cuisine combinations tend to have higher ratings
SELECT 
    Cuisines,
    COUNT(*) AS combination_count,
    AVG(`Aggregate rating`) AS avg_rating
FROM 
    data
GROUP BY 
    Cuisines
ORDER BY 
    avg_rating DESC, combination_count DESC
LIMIT 4;

#Identify if there are any restaurant chains present in the dataset
SELECT 
    `Restaurant Name`,
    COUNT(*) AS occurrence_count
FROM 
    data
GROUP BY 
    `Restaurant Name`
HAVING 
    COUNT(*) > 1
ORDER BY 
    occurrence_count DESC
LIMIT 10;
    
    
#Analyze the ratings and popularity of different restaurant chains
SELECT 
    `Restaurant Name`, 
    AVG(`Aggregate rating`) AS avg_rating,  
    SUM(`Votes`) AS total_votes,            
    COUNT(*) AS number_of_locations         
FROM 
    data
GROUP BY 
    `Restaurant Name`
ORDER BY 
    avg_rating DESC,  
    total_votes DESC
LIMIT 5;





    