select distinct rideable_type
from ##unclean_data

select distinct ride_length_seconds
from ##unclean_data
order by ride_length_seconds asc

select distinct ride_length
from ##unclean_data
order by ride_length asc

select distinct member_casual
from ##unclean_data