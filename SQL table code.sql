BEGIN;

CREATE TABLE IF NOT EXISTS public.platform
(
    PlatformID character varying NOT NULL,
    Platforn_name character varying,
    PRIMARY KEY (PlatformID)
);

CREATE TABLE IF NOT EXISTS public.project
(
    ProjectID character varying NOT NULL,
    Project_name character varying,
    Project_description character varying,
    Project_ticker character varying,
    PRIMARY KEY (ProjectID)
);

CREATE TABLE IF NOT EXISTS public.token_role
(
    Token_roleID character varying NOT NULL,
    Token_Role character varying,
    PRIMARY KEY (Token_roleID)
);

CREATE TABLE IF NOT EXISTS public.category
(
    CategoryID character varying NOT NULL,
    Category_name character varying,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE IF NOT EXISTS public.icos
(
    ID character varying NOT NULL,
    DateID character varying NOT NULL,
    ProjectID character varying NOT NULL,
    PlatformID character varying NOT NULL,
    CategoryID character varying NOT NULL,
    Token_roleID character varying NOT NULL,
    Raised_usd integer,
    ICO_price double precision,
    Fundraise_goal double precision,
    Total_token double precision,
    Sold double precision,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS public.date
(
    DateID character varying NOT NULL,
    Start_date date,
    Start_year integer,
    Start_month integer,
    Start_weekday integer,
    Start_day integer,
    End_date date,
    End_year integer,
    End_month integer,
    End_weekday integer,
    End_day integer,
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