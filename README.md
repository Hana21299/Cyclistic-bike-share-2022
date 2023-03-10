# Cyclistic-bike-share-2022
## Table of Contents

1. [Introduction](README.md#introduction)
2. [Business Task](README.md#business-task)
3. [Data](README.md#data)
4. [Processing and Cleaning](README.md#processing-and-cleaning)
5. [Analysis and Viz](README.md#analysis-and-viz)
6. [Conclusion and Recommendations](README.md#conclusions)

## Introduction

The project is a part of **Google Data Analytics Certification course capstone**. The scenario involves analysis of the trip data of Cyclistic bike share company.

The company has two models for availing service: individual passes which are called "casual" riders and annual subscriptions called "member" riders.
The company operates in Chicago with around 6000 bicycles at 700 stations.

Maximizing the number of annual members will be key to future growth as it ensures financial sustainability and customer retention. The insights can help devise effective marketing strategies aimed to convert more casual riders into annual members.

### Business Task

How do annual members and casual riders use Cyclistic bikes differently ?

> **Objective** : To clean, analyze and visualize the data to observe how casual riders use the bike rentals differently from annual member riders. 

### Deliverebles:
By analyzing the [previous 12 months of Cyclistic trip data](https://divvy-tripdata.s3.amazonaws.com/index.html), I intend to produce a detailed presentation that includes the following deliverables:
1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top three recommendations based on your analysis

## Data

* **Data source** : Public data from Motivate International Inc. (Divvy Bicycle Sharing Service from Chicago) under this [license](https://www.divvybikes.com/data-license-agreement).
* [Cyclistic’s historical trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) (2013 onwards) available in `.csv` format. 
* **Our date range** : Jan 2022 to Dec 2022
* The dataset has individual ride records consisting of ride start-end date & time, station information, bike type, rider type (casual/member).
* Data imported into **Microsoft SQL Server Management Studio**

## Processing and Cleaning

* Data imported into **Microsoft SQL Server Management Studio** for manipulation and analysis using SQL.
* Visualizations to be developed in **Microsoft Power BI**.
* Datatypes made consistent and then consolidated into one view using [this query](uncleaned_data.sql).
* To assist in analysis, 4 new columns were added (ride length in meters, ride start day name and ride duration in seconds).
* `5,563,947` rows were returned but required cleaning.
* **Cleaning process** :
  * Check eachs columns in ##uncleaned_data to find probems using [this query](check_data.sql).
  * After checking, there are few problems needed to be fixed:
     1. Negative and zero ride duration values found
     2. Zero ride distance value found
  * Remove negative and zero values using [this query](cleaned_data.sql).
> Following the cleaning and consolidating data in one table, `5,252,085` rows were returned for proceeding to analysis. `JOIN`, `WITH`, `UNION ALL`, `WHERE`, _subqueries_ and many other SQL functions were used.
## Analysis and Viz

The final dataset containing trip data of roughly 5.2 million ride records was analyzed. 
Visualizations were developed in Google Data Studio to observe differential trends between the usage by casual riders and annual members.  


### Total ride share
![piechart](Visualization/Total ride share.png)
#### **Insights**
* 59.46% of total rides (3.4M) were taken by annual members.
* 40.54% of total rides were taken by casual riders.
* Annual members form the majority of business for the company and maximizing on this number should be the focus in the long run.


### Weekly distribution of number of rides
![line_chart_1](Visualization/TNumber of ride in weekday.png)
#### **Insights**
* Clearly, the rides taken by casual riders __peak__ throughout the __weekend__ as compared to that of annual members which remains relatively flat. 
* About __50% less__ casual riders use the rentals during weekdays as compared to weekends.  
* This indicates that casual riders use the bike rentals for leisure purposes and not for commuting.     


### Weekly distribution of average ride duration
![line_chart_2](Visualization/Average ride duration.png)
#### **Insights**
* The average ride duration of casual members is  about __3 times__ that of annual members.
* The average ride duration both type of riders increase on weekends.
* Again, this indicates that casual riders use the bike rentals for leisure purposes.  


### Ride duration vs Ride distance
![bars](Visualization/ride duration vs distance.png)

## Conclusion and Recommendations

* A common observation is that __casual riders__ are using the bike rentals for __leisure and tourism__ purposes while __annual members__ use it predominantly for __commuting__ purposes.
* Targetted on-ground marketing strategies should be devised at places of leisure like parks, theatres, restaurants and cafes.  
* Discounting campaigns for casual riders on weekdays can motivate them to use the service for commuting. 
* Tools like push notifications can be used to attract casual riders during the lean periods of the day.
* A campaign for the winter months, maybe clubbed with holidays or Christmas can help pick up the numbers during those months. 
