# Note this is continuation from the transform code so variable or tables names are the same****
# import libraries
from sqlalchemy import create_engine

# Connect to postgres DB
engine = create_engine("postgresql+psycopg2://Tsega:*******@localhost:5432/DataProjects")

# Load each DataFrame into the PostgreSQL database
date.to_sql('date', engine, if_exists='append', index=False)
project.to_sql('project', engine, if_exists='append', index=False)
category.to_sql('category', engine, if_exists='append', index=False)
platform.to_sql('platform', engine, if_exists='append', index=False)
token_role.to_sql('token_role', engine, if_exists='append', index=False)
icos.to_sql('icos', engine, if_exists='append', index=False)

# close connection
engine.close()
