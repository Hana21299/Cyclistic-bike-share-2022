--create a global temporary table ##unclean_data which contains all data from Jan 2022 to Dec 2022. Add 3 new columns: ride_length_seconds, start_day and ride_length to assist in analysis. 

WITH
  -- union all data into one table
  temp_all AS( 
    SELECT
      *
    FROM
      [dbo].[202201-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202202-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202203-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202204-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202205-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202206-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202207-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202208-divvy-tripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202208-divvy-tripdata-2]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202209-divvy-publictripdata]
    UNION ALL
    SELECT
      *
    FROM
      [dbo].[202210-divvy-tripdata]
    UNION ALL
    SELECT
    *
    FROM [dbo].[202211-divvy-tripdata]
	UNION ALL
    SELECT
    *
    FROM [dbo].[202212-divvy-tripdata]
    ),
  --create metrics
  temp_metrics as(
    SELECT
      ride_id,
      datediff(SECOND,started_at,ended_at) as ride_length_seconds,
	  isnull(start_lat,' ') as start_lat_notnull,
	  isnull(start_lng,' ') as start_lng_notnull,
	  isnull(end_lat,' ') as end_lat_notnull,
	  isnull(end_lng,' ') as end_lng_notnull,
      CASE
        when DATEPART(weekday,started_at) = 1 then 'Sunday'
        when DATEPART(weekday,started_at) = 2 then 'Monday'
        when DATEPART(weekday,started_at) = 3 then 'Tuesday'
        when DATEPART(weekday,started_at) = 4 then 'Wednesday'
        when DATEPART(weekday,started_at) = 5 then 'Thursday'
        when DATEPART(weekday,started_at) = 6 then 'Friday'
        when DATEPART(weekday,started_at) = 7 then 'Saturday'
      END as start_day
    from temp_all
  )
  --Join metrics with all data
  Select
    temp_all.ride_id,
    temp_all.rideable_type,
    temp_metrics.start_day,
    temp_all.started_at,
    temp_all.ended_at,
    temp_metrics.ride_length_seconds,
    temp_all.start_station_name,
    temp_all.start_station_id,
    temp_all.end_station_name,
    temp_all.end_station_id,
    geography::Point(start_lat_notnull,start_lng_notnull,4326).STDistance(geography::Point(end_lat_notnull,end_lng_notnull,4326)) as ride_length,
	temp_all.member_casual
  INTO
	##unclean_data --temporary table
  FROM
   temp_all
  JOIN
   temp_metrics
  ON
   temp_all.ride_id = temp_metrics.ride_id






