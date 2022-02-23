By: Daniel Choi
Date: Feb-18th-2022


Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

                                    Select Count(*)
                                    From table
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

                                    Select Count(Distinct (key)
                                    From table


i. Business = id: 10000
ii. Hours = 
iii. Category = business_id: 1562
iv. Attribute = business_id: 1115
v. Review = id:10000, business_id: 8090, user_id: 9581
vi. Checkin = business_id: 493
vii. Photo = id: 10000, business_id: 6493
viii. Tip = user_id: 537, business_id: 3979
ix. User = id: 10000
x. Friend = user_id: 11
xi. Elite_years = user_id: 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: 
  "no"
	
	
	SQL code used to arrive at answer:
  
      Select Count(*)
      From user
      Where 
      id is null or
      name is null or
      review_count is null or
      yelping_since is null or
      useful is null or
      funny is null or
      cool is null or
      fans is null or
      average_stars is null or
      compliment_hot IS NULL OR 
      compliment_more IS NULL OR 
      compliment_profile IS NULL OR 
      compliment_cute IS NULL OR 
      compliment_list IS NULL OR 
      compliment_note IS NULL OR 
      compliment_plain IS NULL OR 
      compliment_cool IS NULL OR 
      compliment_funny IS NULL OR 
      compliment_writer IS NULL OR 
      compliment_photos IS NULL 

	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

            Select min(column), max(column) , avg (column)
            From table

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1	 max:5	avg:3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg:24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
  Select city, sum(review_count) as reviews
  From business
  Group by city
  Order by reviews desc

	
	Copy and Paste the Result Below:
  +-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

    Select stars, sum(review_count) as stars_dist
    From business
    Where city = 'Avon'
    Group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+------------+
| stars | stars_dist |
+-------+------------+
|   1.5 |         10 |
|   2.5 |          6 |
|   3.5 |         88 |
|   4.0 |         21 |
|   4.5 |         31 |
|   5.0 |          3 |
+-------+------------+


ii. Beachwood

SQL code used to arrive at answer:

    Select stars, sum(review_count) as stars_dist
    From business
    Where city = 'Beachwood'
    Group by stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
+-------+------------+
| stars | stars_dist |
+-------+------------+
|   2.0 |          8 |
|   2.5 |          3 |
|   3.0 |         11 |
|   3.5 |          6 |
|   4.0 |         69 |
|   4.5 |         17 |
|   5.0 |         23 |
+-------+------------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
  
      select name, id, review_count
      from user
      Order by review_count desc
      limit 3 
	
		
	Copy and Paste the Result Below:
		
 +--------+------------------------+--------------+
| name   | id                     | review_count |
+--------+------------------------+--------------+
| Gerald | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |
| Sara   | -3s52C4zL_DHRK0ULG6qtg |         1629 |
| Yuri   | -8lbUNlXVSoXqaRRiHiSNg |         1339 |
+--------+------------------------+--------------+


8. Does posing more reviews correlate with more fans?

Yes, posting more reviews was found to be correlated with having more fans.

	Please explain your findings and interpretation of the results:
  
  Select id, name, review_count, fans
  From user
  order by fans desc

+------------------------+-----------+--------------+------+
| id                     | name      | review_count | fans |
+------------------------+-----------+--------------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 |
| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 |
| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 |
| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 |
| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 |
| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 |
| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 |
| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 |
| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 |
+------------------------+-----------+--------------+------+

  Select id, name, review_count, fans
  From user
  order by fans asc
  
+------------------------+---------+--------------+------+
| id                     | name    | review_count | fans |
+------------------------+---------+--------------+------+
| ---94vtJ_5o_nikEs6hUjg | Joe     |            2 |    0 |
| ---cu1hq55BP9DWVXXKHZg | Jeb     |           57 |    0 |
| ---fhiwiwBYrvqhpXgcWDQ | Jed     |            8 |    0 |
| ---PLwSf5gKdIoVnyRHgBA | Rae     |            2 |    0 |
| --0RtXvcOIE4XbErYca6Rw | Ryan    |            2 |    0 |
| --0sXNBv6IizZXuV-nl0Aw | Joe     |            1 |    0 |
| --0WZ5gklOfbUIodJuKfaQ | Scott   |            7 |    0 |
| --104qdWvE99vaoIsj9ZJQ | John    |            3 |    0 |
| --1av6NdbEbMiuBr7Aup9A | Ron     |            9 |    0 |
| --1mPJZdSY9KluaBYAGboQ | Bryan   |            5 |    0 |
| --26jc8nCJBy4-7r3ZtmiQ | Patti   |            2 |    0 |
| --2bpE5vyR-2hAP7sZZ4lA | Gary    |           23 |    0 |
| --2HUmLkcNHZp0xw6AMBPg | Kristin |           28 |    0 |
| --3B8LdT1NCD-bPkwS5-5g | Cynthia |            4 |    0 |
| --3oMd6gjXpAzhjLBrsVCQ | Mrme    |            2 |    0 |
| --44NNdtngXMzsxyN7ju6Q | Austin  |            2 |    0 |
| --4rAAfZnEIAKJE80aIiYg | Mesut   |           25 |    0 |
| --4ww39MLTS1SBRmCrSmww | Lissa   |            3 |    0 |
| --56y1InAvNoQOD6YYrhVQ | Tara    |            3 |    0 |
| --5BsHjOVLIGoTwjol-V2w | Lyndsey |            1 |    0 |
| --5ihAtBE4kI5Gch9383qA | Annie   |           11 |    0 |
| --5ox2OhSAADcB_uAEOYFw | Daniece |            2 |    0 |
| --5XzJ2pRsVVJiJUfzZlgQ | Alex    |            7 |    0 |
| --6D_IuxyKTN53pHi904ag | Mary    |            2 |    0 |
| --6kLBBsm0GPM9vIB2YBDw | Garen   |            3 |    0 |
+------------------------+---------+--------------+------+

--comparing accounts with the least fans and most fans showed that the difference was the amount of reviews written
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: 
  
          the word "love" appeared 1780 time and "hate" appeared 232 times
  

	
	SQL code used to arrive at answer:

          Select count(*) 
          From review
          Where text Like '%hate%' 
          
          Select count(*) 
          From review
          Where text Like '%love%' 
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
        Select id, name, fans
        From user
        Order by fans desc
        Limit 10
	
	Copy and Paste the Result Below:
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

  While only 4 total businesses were returned, the businesses with 4-5 stars seem to have shorter hours than businesses with 2-3 stars. 
  4 star restaurant "Edulis" only operated 5 days out of the week and seemed to operate for shorter hours than the two 2-3 star restaurants.


ii. Do the two groups you chose to analyze have a different number of reviews?
  
  Yes and no. The 4 star restaurant "Edulis" had 89 reviews but the 4.5 star restaurant "Sushi Osaka" only had 8, which could possibly explain the high stars. 
  "Pizzaiolo", which is a 3 star restaurant, has 34 reviews, while "99 cent sushi", a 2 star restaurant, only has 5. 
  I believe the number of reviews is not a very reliable way to predict the star count of a restaurant.  
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

  No. Each of the 4 restaurants returned were from separate districts of Toronto. 

SQL code used for analysis:


        Select bh.name as name, bh.stars as stars, bh.review_count as review_count, bh.hours as hours, c.category as category, bh.neighborhood as neighborhood,
            Case
                When hours Like 'Monday%' Then 1
                When hours Like '%Tuesday%' Then 2
                When hours Like '%Wednesday%' Then 3
                When hours Like '%Thursday%' Then 4
                When hours Like '%Friday%' Then 5
                When hours Like '%Saturday%' Then 6
                When hours Like '%Sunday%' Then 7
            End as hours_order,
            Case
                When bh.stars Between 2 and 3 Then '2-3 stars'
                When bh.stars Between 4 and 5 Then '4-5 stars'
            End as star_class
        From ((business b Join hours h on b.id = h.business_id) bh Join category c on bh.business_id = c.business_id)
        Where (bh.city = 'Toronto' and c.category = 'Restaurants') 
            and (bh.stars between 2 and 3 or bh.stars between 4 and 5)
        Group by bh.stars, hours_order
        Order by bh.stars desc


		
		
2. Group business based on the ones that are open and the ones that are closed. 
  What differences can you find between the ones that are still open and the ones that are closed? 
  List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

Stores that are open received more reviews on averaged than stores that are closed.
         
         Open:   AVG(review_count) = 31.757
			   Closed: AVG(review_count0 = 23.198
         
ii. Difference 2:
Stores that are open have slightly high stars than stores that are closed
         
         Open:   AVG(stars) = 3.679
			   Closed: AVG(stars) = 3.520
         
         
SQL code used for analysis:

        Select Count(distinct (id)), avg(review_count), avg(stars), is_open
        From business
        Group by is_open

	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

finding the relationship between review count and stars by category (in the province of Ontario).        
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

To help businesses better understand the importance of the category that they operate in, I will need the number of reviews, 
star rating of the business, and full list of categories. The table will compare the number of reviews per category and its average review
to find whether the category's number of reviews have any relationship with the stars. This will help business owners in lower star categories
to identify the problem and work towards receiving higher stars on Yelp.

iii. Output of your finished dataset:

10 lowest reviewed categories on Yelp:
+-----------------------+---------+-----------+
| category              | reviews | avg_stars |
+-----------------------+---------+-----------+
| Banks & Credit Unions |       3 |       1.5 |
| Ethnic Food           |       3 |       3.5 |
| Financial Services    |       3 |       1.5 |
| Home Services         |       3 |       4.5 |
| Hot Dogs              |       3 |       3.0 |
| Imported Food         |       3 |       3.5 |
| Interior Design       |       3 |       4.5 |
| Kosher                |       3 |       3.5 |
| Martial Arts          |       3 |       5.0 |
| Shades & Blinds       |       3 |       4.5 |
+-----------------------+---------+-----------+

10 highest reviewed categories on Yelp:
+---------------------------+---------+-----------+
| category                  | reviews | avg_stars |
+---------------------------+---------+-----------+
| Restaurants               |     557 |       3.4 |
| Japanese                  |     149 |       3.6 |
| Bars                      |     113 |       3.5 |
| Nightlife                 |     113 |       3.5 |
| Spanish                   |      97 |       4.0 |
| French                    |      89 |       4.0 |
| Event Planning & Services |      86 |       4.2 |
| Latin American            |      77 |       4.0 |
| Mexican                   |      77 |       4.0 |
| Caterers                  |      76 |       4.5 |
+---------------------------+---------+-----------+

Categories with the highest review count are shown to have higher stars on average. 
Categories with lower review count are advised to increase efforts to receive more reviews in order to receive higher stars.

iv. Provide the SQL code you used to create your final dataset:

        Select c.category, Sum(review_count) as reviews, Round(avg(b.stars), 1) as avg_stars
        From business b Join category c on b.id = c.business_id
        Where state = 'ON'
        Group by c.category
        Order by reviews desc
        -- remove desc to get the results for the 10 lowest reviewed categories
        Limit 10



