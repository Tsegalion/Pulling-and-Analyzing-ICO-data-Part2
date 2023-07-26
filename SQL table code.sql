BEGIN;

CREATE TABLE IF NOT EXISTS public.platform
(
    PlatformID VARCHAR(50) NOT NULL,
    Platforn_name VARCHAR(50),
    PRIMARY KEY (PlatformID)
);

CREATE TABLE IF NOT EXISTS public.project
(
    ProjectID VARCHAR(50) NOT NULL,
    Project_name VARCHAR(50),
    Project_description VARCHAR(500),
    Project_ticker VARCHAR(20),
    PRIMARY KEY (ProjectID)
);

CREATE TABLE IF NOT EXISTS public.token_role
(
    Token_roleID VARCHAR(50) NOT NULL,
    Token_Role VARCHAR(20),
    PRIMARY KEY (Token_roleID)
);

CREATE TABLE IF NOT EXISTS public.category
(
    CategoryID VARCHAR(50) NOT NULL,
    Category_name VARCHAR(50),
    PRIMARY KEY (CategoryID)
);

CREATE TABLE IF NOT EXISTS public.icos
(
    ID VARCHAR(50) NOT NULL,
    DateID VARCHAR(50) NOT NULL,
    ProjectID VARCHAR(50) NOT NULL,
    PlatformID VARCHAR(50) NOT NULL,
    CategoryID VARCHAR(50) NOT NULL,
    Token_roleID VARCHAR(50) NOT NULL,
    Raised_usd INT,
    ICO_price FLOAT,
    Fundraise_goal FLOAT,
    Total_token FLOAT,
    Sold FLOAT,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS public.date
(
    DateID VARCHAR(50) NOT NULL,
    Start_date date,
    Start_year INT,
    Start_month INT,
    Start_weekday INT,
    Start_day INT,
    End_date date,
    End_year INT,
    End_month INT,
    End_weekday INT,
    End_day INT,
    PRIMARY KEY (DateID)
);

ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT PlatformID FOREIGN KEY (PlatformID)
    REFERENCES public.platform (PlatformID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT ProjectID FOREIGN KEY (ProjectID)
    REFERENCES public.project (ProjectID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT CategoryID FOREIGN KEY (CategoryID)
    REFERENCES public.category (CategoryID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT Token_roleID FOREIGN KEY (Token_roleID)
    REFERENCES public.token_role (Token_roleID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT DateID FOREIGN KEY (DateID)
    REFERENCES public.date (DateID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
