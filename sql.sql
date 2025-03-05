Project Description
Consider an online video-sharing platform like YouTube which hosts tens of thousands of channels and crores of users.

You have to analyse the data and provide meaningful insights on the type of content that drives engagement, users growth, and many more to all the stakeholders. Let’s roll our sleeves up for an insightful analysis!

Database
The sample database consists of tables that store the information of users, channels, videos, genres and likes/dislikes. 

"channel_user table"

channel_usertable stores the data of the channel_ids and their subscribers' user_ids.

First row in the table represents that the user with user_id = 1 is subscribed to the channel with channel_id = 100 at2020-12-10 10:30:45


"user_likes table"
Similarly, user_likestable stores the data of video_id and the user_ids who reacted to the video. A user can either like or dislike a video. He cannot like or dislike a video multiple times (similar to how youtube works)

"video_genre table"
Similarly,video_genretable stores the data of video_id and the ids of the genres that the corresponding video belongs to. A single video can belong to multiple genres

Let’s dive in to analyze the in and outs of each part of the data. Here we go!

QUESTIONS 
"
Get all the videos with more than 1 lakh views.

Note:
Output must be in the alphabetical order of videoname

SELECT
  video_id,
  name,
  duration_in_secs,
  published_datetime,
  no_of_views,
  channel_id
FROM
  VIDEO
WHERE
  no_of_views > 100000
ORDER BY
  name;
"

"2

Get videos from TEDx channel (id=353) with more than 50 thousand views.

Note:
Sort the output in the descending order ofno_of_viewsand in the ascending order of videoname

SELECT
  video_id,
  name,
  duration_in_secs,
  no_of_views
FROM
  VIDEO
WHERE
  channel_id = 353
  AND no_of_views > 50000
ORDER BY
  no_of_views DESC,
  name;
"

"3
Get the top 10 most viewed videos till date.

Note:
Sort the videos by no_of_views from highest to lowest. For videos with the same number of views, order them by published_datetime, with the most recent video first.

SELECT
  name,
  channel_id,
  no_of_views
FROM
  VIDEO
ORDER BY
  no_of_views DESC,
  published_datetime DESC
LIMIT
  10;
"


"4
Get all the recent movie trailers that have more than 1 lakh views.

Note:
Consider the videos that have "trailer" in theirnameas trailers.
Sort the output in the descending order ofno_of_viewsandpublished_datetime

SELECT
  name,
  channel_id,
  no_of_views,
  published_datetime
FROM
  VIDEO
WHERE
  name LIKE "%trailer%"
  AND no_of_views > 100000
ORDER BY
  no_of_views DESC,
  published_datetime DESC;    
"

"
5

Get all the videos that are released in the year 2018. 

Note:
Sort the output in the descending order ofpublished_datetimeand then in the alphabetical order ofname

SELECT
  video_id,
  name,
  duration_in_secs,
  no_of_views
FROM
  VIDEO
WHERE
  strftime("%Y", published_datetime) = "2018"
ORDER BY
  published_datetime DESC,
  name;
"

"6 
Get the distinct ids of videos that belong to the following genres.

genre_id	genre
201	        Comedy
202	        Action
203	        Thriller
211	        Scifi

SELECT
  DISTINCT video_id
FROM
  VIDEO_GENRE
WHERE
  genre_id IN (201, 202, 203, 211)
ORDER BY
  video_id DESC;
"


"
7


Get all the esport videos that crossed one lakh views and were released between 2018 and 2020.

SELECT
  name,
  published_datetime,
  no_of_views
FROM
  VIDEO
WHERE
  no_of_views > 100000
  AND (
    CAST(strftime("%Y", published_datetime) AS INTEGER) BETWEEN 2018
    AND 2020
  )
  AND name LIKE "%esport%"
ORDER BY
  no_of_views DESC,
  published_datetime DESC;
  
  "
"
8.
Get the total number of channels in the database aschannels_count
SELECT
  count(channel_id) AS channels_count
FROM
  CHANNEL;
"

"
9.
Get the highest and least number of views for the videos in the database.

Expected Output Format
highest_number_of_views	    least_number_of_views
    ...	                            ...         
    
SELECT
  max(no_of_views) AS highest_number_of_views,
  min(no_of_views) AS least_number_of_views
FROM
  VIDEO;

"

"10.

Get the average number of views for the videos released by the "Single Shot" Channel (id = 373)

Expected Output Format
    avg_views
    ...

SELECT
  avg(no_of_views) AS avg_views
FROM
  VIDEO
WHERE
  channel_id = 373;
"

"11.
Get the total count of premium users on the platform as premium_users_count.

Note - Consider those users as premium which has 1 in premium_membership column.

Expected Output Format

premium_users_count
    ....

SELECT
  count(user_id) AS premium_users_count
FROM
  USER
WHERE
  premium_membership = 1;

"

"12.

Get the number of male and female premium users in the platform.

Expected Output Format
gender	    total_users
 F	           ...
 M	           ...

SELECT
  gender,
  count() AS total_users
FROM
  USER
WHERE
  premium_membership = 1
GROUP BY
  gender;
"


"11.


Fetch the top 10 videos having more number of views.

SELECT
  name,
  no_of_views
FROM
  video
ORDER BY
  no_of_views DESC,
  name
LIMIT
  10;
  
"

"12.
Get all the review videos i.e., videos which contain "review" in their name.

Note:
Output must contain rows with the highest no_of_views first.

SELECT
  name,
  no_of_views
FROM
  video
WHERE
  name LIKE "%review%"
ORDER BY
  no_of_views DESC;
  
  "

"13.
3.
Get the total number of channels in the database.

Expected Output Format
    no_of_channels
       ...

SELECT
  count(channel_id) AS no_of_channels
FROM
  channel;
       
"

"14.
4.
Get all the music videos released before the year 2016.

Note:
You can consider the videos which contain "music" in name as music videos.
Get the year in the integer format
Sort the output in the descending order of year, and then in the ascending order of name.
Expected Output Format:
name	no_of_views 	year
...	     ...	         ...


SELECT
  name,
  no_of_views,
  CAST(strftime("%Y", published_datetime) AS INT) AS year
FROM
  video
WHERE
  CAST(strftime("%Y", published_datetime) AS INT) < 2016
  AND name LIKE "%music%"
ORDER BY
  year DESC,
  name;
  
"

"15.
Get the total number of countries where the users of the platform are present.

Expected Output Format
country_count
...

SELECT
  count(DISTINCT country) AS country_count
FROM
  user;
  
"

"16
Find the number of videos published between the years 2010 & 2016.

Note:
Sort the output in the ascending order of the year
Keep the year in the integer format
Expected Output Format:
year	no_of_videos
...	        ...

SELECT
  CAST(strftime("%Y", published_datetime) AS INT) AS year,
  COUNT() AS no_of_videos
FROM
  video
WHERE
  CAST(strftime("%Y", published_datetime) AS INT) BETWEEN 2010
  AND 2016
GROUP BY
  year
ORDER BY
  year;


"

"17


Fetch the top 10 videos having more number of views, along with the channel details.

Note:
Sort the output in the descending order of no_of_views, and then in the ascending order of channel_name.

Expected Output Format:
video_name	no_of_views	channel_nam
...            ...         ...

SELECT
  video.name AS video_name,
  video.no_of_views AS no_of_views,
  channel.name AS channel_name
FROM
  video
  INNER JOIN channel ON video.channel_id = channel.channel_id
ORDER BY
  no_of_views DESC,
  channel_name
LIMIT
  10;
  
"

"18


Get all the unique channels that published review videos.

Note:
You can consider the videos which contain "review" in name as review videos.
Sort the output in the ascending order of channel_name.
Expected Output Format:
channel_id	channel_name
...	            ... 

SELECT
  DISTINCT c.channel_id AS channel_id,
  c.name AS channel_name
FROM
  video AS v
  INNER JOIN channel AS c ON v.channel_id = c.channel_id
WHERE
  v.name LIKE "%review%"
ORDER BY
  channel_name;

"

"19
.
Get all the videos that belong to "Action" genre (genre_id = 201) and have more than 1 lakh views.

Note:
Sort the output in the ascending order of video_id.

SELECT
  v.video_id,
  v.name,
  vg.genre_id
FROM
  video AS v
  INNER JOIN video_genre AS vg ON v.video_id = vg.video_id
WHERE
  vg.genre_id = 201
  AND v.no_of_views > 100000
ORDER BY
  v.video_id;

"


"20.
Get the total number of users subscribed for the channel "Tyler Oakley" (channel_id = 376) in the year 2018.

Expected Output Format
no_of_subscribers
   ...

SELECT
  count() AS no_of_subscribers
FROM
  channel_user
WHERE
  channel_id = 376
  AND CAST(strftime("%Y", subscribed_datetime) AS INT) = 2018;
  
  "


"21.

11.
Insights about users:
Get the geographic distribution of Taylor Swift channel (channel_id = 399) subscribers.

Note:
Geographic distribution: Number of Taylor Swift subscribers present in each country. Ignore the countries whereno_of_subscribersis 0.
Order the result in the ascending order of the country name.
Expected Output Format
country	no_of_subscribers
 ...	            ...     

SELECT
  u.country,
  count() AS no_of_subscribers
FROM
  user AS u
  INNER JOIN channel_user AS cu ON u.user_id = cu.user_id
WHERE
  cu.channel_id = 399
GROUP BY
  u.country
ORDER BY
  u.country;
  
"

"22.

Between 2010 & 2020, find the number of videos released in each of the below genres.

Note:
genre_ids : 201, 202, 204, 205, 206, 207
Sort the output in the descending order of no_of_videos, and then in the ascending order of genre_id.
Expected Output Format:
genre_id	no_of_videos
 ...	            ...

SELECT
  vg.genre_id,
  COUNT() AS no_of_videos
FROM
  video AS v
  INNER JOIN video_genre AS vg ON v.video_id = vg.video_id
WHERE
  (
    CAST(strftime("%Y", published_datetime) AS INT) BETWEEN 2010
    AND 2020
  )
  AND vg.genre_id IN (201, 202, 204, 205, 206, 207)
GROUP BY
  vg.genre_id
ORDER BY
  no_of_videos DESC,
  vg.genre_id;

"

"23.

Get all the Indian users details whose age is below 30 years and liked the video (video_id = 1011) in the year 2020.

Note:
Consider the name of the country as "INDIA"
Consider reaction_type LIKE as liked.
Sort the output in the ascending order of name.

SELECT
  DISTINCT u.name,
  u.gender,
  u.age,
  u.country,
  u.premium_membership
FROM
  user AS u
  INNER JOIN user_likes AS ul ON u.user_id = ul.user_id
WHERE
  u.country LIKE "INDIA"
  AND u.age < 30
  AND ul.video_id = 1011
  AND CAST(strftime("%Y", ul.reacted_at) AS INT) = 2020
  AND ul.reaction_type LIKE "LIKE"
ORDER BY
  u.name;
  
  "

"24.
Get the total number of countries where the subscribers of the Taylor Swift channel (channel_id = 399) are present.

Expected Output Format

SELECT
  count(DISTINCT u.country) AS country_count
FROM
  user AS u
  INNER JOIN channel_user AS cu ON u.user_id = cu.user_id
WHERE
  cu.channel_id = 399;
"

"25.
.
Get all distinct channels which published music videos before 2016.

Note:
You can consider the videos which contain "music" in name as music videos.
Sort the output in the ascending order of chanel_name.

SELECT
  DISTINCT c.channel_id AS channel_id,
  c.name AS channel_name
FROM
  video AS v
  INNER JOIN channel AS c ON v.channel_id = c.channel_id
WHERE
  CAST(strftime("%Y", v.published_datetime) AS INT) < 2016
  AND v.name LIKE "%music%"
ORDER BY
  channel_name;
  
"