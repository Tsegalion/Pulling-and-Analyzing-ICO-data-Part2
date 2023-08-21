# First Step
First stage of this project #Scraping Code# was using scrapy and selenium to scrap ended ICO data from icodrops; an ICO website. I saved the scraped data into a CSV file.

# Second Step
Imported the file using Pandas to perform basic data cleaning to make the data meaningful and easier to read. @Data Cleaning Code

# Third Step
Using the Kimball's model, I modelled and created a database on Postgresql which was my database for this project. @ERD image and @Sql table code

# Fourth Step
Transformed the data on python using the designed model of the database. @Python model code

# Fifth Step
Saved each table on the postgre database where intend to query the data for analysis
