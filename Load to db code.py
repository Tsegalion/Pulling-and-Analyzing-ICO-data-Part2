# import libraries
import pandas as pd
from sqlalchemy import create_engine

# Connect to postgres DB
engine = create_engine("postgresql+psycopg2://Tsega:*******@localhost:5432/DataProjects")


# Read each CSV file into a pandas DataFrame
icos = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\icos(Fact Table).csv")
category = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\category(DimT).csv")
platform = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\platform(DimT).csv")
project = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\project(DimT).csv")
token_role = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\token_role(DimT).csv")
date = pd.read_csv(r"C:\Users\Tsega\ICO Project\data\date(DimT).csv")


# Load each DataFrame into the PostgreSQL database
date.to_sql('date', engine, if_exists='append', index=False)
project.to_sql('project', engine, if_exists='append', index=False)
category.to_sql('category', engine, if_exists='append', index=False)
platform.to_sql('platform', engine, if_exists='append', index=False)
token_role.to_sql('token_role', engine, if_exists='append', index=False)
icos.to_sql('icos', engine, if_exists='append', index=False)

# close connection
engine.close()