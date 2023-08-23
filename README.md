# Extraction
First stage of this project was to source for the data as this was the major issue. Using scrapy and selenium to scrap ended ICO data from icodrops; an ICO website. I saved the scraped data into a CSV file. @Scraping Code

# Transformation(Data Cleaning & Modelling)
I imported the file using Pandas to perform basic data cleaning to making sure the data is meaningful and easy to read (@Data Cleaning Code). 

Also, using the Kimball's model, I modelled and created a database on Postgre which was my database for this project (@data model image and @Sql table code)

Transformed the data using pandas by creating different tables following the earlier model of the database design (@Python model code) after which I saved each table on postgre db where I intend to perform some queries on the data for analysis (@SQL Analysis)

# Analysis
I also tried communicating with PostgreSQL using the SQLAlchemy API to directly query the database and show the results of my analysis (@data extraction queries).

# Short term Goal of this Project
To gather insights that could guide a future ICO event for a startup.

# Long term Goal of this Project
To add extra sources of ICO data and automate this process.
