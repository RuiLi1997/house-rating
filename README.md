# house-rating
This is a house rating project based on Sydney government data and Domain 2021 Sold data.


# Ask
The Sydney real estate market suffered a drop-down in 2020, because of the pandemic. However, with the warm-up of Australia economy, the house market becomes active again this year.
We would like to figure out the house price distribition by different suburbs and different house types and make it easier for people who want to buy a new house or apartment.

# Preapre 
We use Trello as our agile tools and did brainstorms about where to find data, how to build the timeline and how many features should be included.

# Process
We process the data by cleaning it to make sure it is complete, correct, relevant, and free of errors and outliers. The raw data is crawled from Domain which includes a lot of null values and useless
information. We clean it by pandas and store the clean data into Microsoft Excel and AWS RDS.

# Analyse
We join the house data and the Sydney Suburb Geodata to group them by the location, and remove some extreme data points like the house with incredibly high price or the house type is too rare in the data set.
We also use some machine learning tools to predict the price of an unknown house.

# Share
Tableau is used to make a dashboard, everyone can find the price of their ideal house by selecting the suburb, room number and price.


