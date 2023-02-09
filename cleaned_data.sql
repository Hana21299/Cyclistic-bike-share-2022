SELECT * 
INTO ##cleaned_data
FROM ##unclean_data
WHERE ride_length_seconds > 0
AND ride_length >0