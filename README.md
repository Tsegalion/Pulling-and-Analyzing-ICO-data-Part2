# Extraction
First stage of this project was to source for the data as this was the major issue. Using scrapy and selenium to scrap ended ICO data from icodrops; an ICO website. I saved the scraped data into a CSV file.

# Transformation(Data Cleaning & Modelling)
I imported the file using Pandas to perform basic data cleaning to making sure the data is meaningful and easy to read. Also, using the Kimball's model db design , I transformed the data using pandas to create different dimensional and fact tables (@data model image)

# Load
I designed the database on PostgreSQL according to the model, and then loaded the data into the database where I intend to perform some queries for analysis. (@SQL Analysis)

# Analysis
I also tried communicating with PostgreSQL using the SQLAlchemy API to directly query the database and show the results of my analysis (@data extraction queries).

# Short term Goal of this Project
To gather insights that could guide a future ICO event for a startup.

# Long term Goal of this Project
To add extra sources of ICO data and automate this process.
