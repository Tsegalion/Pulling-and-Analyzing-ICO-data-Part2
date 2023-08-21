# First Step
First stage of this project was to source for the data as this was the major issue. Using scrapy and selenium to scrap ended ICO data from icodrops; an ICO website. I saved the scraped data into a CSV file. @Scraping Code

# Second Step
Imported the file using Pandas to perform basic data cleaning to make the data meaningful and easier to read. @Data Cleaning Code

# Third Step
Using the Kimball's model, I modelled and created a database on Postgresql which was my database for this project. @ERD image and @Sql table code

# Fourth Step
Transformed the data using pandas by creating different tables following the earlier model of the database design. @Python model code

# Fifth Step
Saved each table on the postgre database where I intend to perform some query on the data for analysis @SQL Analysis

# Short term Goal of this Project
To gether insights to guide a future ICO event for a startup.

# Long term Goal of this Project
To add extra sources of ICO data and automate this process.
