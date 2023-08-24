BEGIN;

CREATE TABLE IF NOT EXISTS public.platform
(
    platform_id VARCHAR(50) NOT NULL,
    platform VARCHAR(50),
    PRIMARY KEY (platform_id)
);

CREATE TABLE IF NOT EXISTS public.project
(
    project_id VARCHAR(50) NOT NULL,
    project VARCHAR(50),
    description VARCHAR(500),
    ticker VARCHAR(20),
    PRIMARY KEY (project_id)
);

CREATE TABLE IF NOT EXISTS public.token_role
(
    token_role_id VARCHAR(50) NOT NULL,
    token_role VARCHAR(20),
    PRIMARY KEY (token_role_id)
);

CREATE TABLE IF NOT EXISTS public.category
(
    category_id VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS public.icos
(
    ico_id VARCHAR(50) NOT NULL,
    date_id VARCHAR(50) NOT NULL,
    project_id VARCHAR(50) NOT NULL,
    platform_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    token_role_id VARCHAR(50) NOT NULL,
    raised_usd FLOAT,
    ico_price FLOAT,
    fundraise_goal FLOAT,
    total_token FLOAT,
    sold FLOAT,
    PRIMARY KEY (ico_id)
);

CREATE TABLE IF NOT EXISTS public.date
(
    date_id VARCHAR(50) NOT NULL,
    start_date date,
    start_year INT,
    start_month INT,
    start_weekday INT,
    start_day INT,
    end_date date,
    end_year INT,
    end_month INT,
    end_weekday INT,
    end_day INT,
    PRIMARY KEY (date_id)
);

ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id)
    REFERENCES public.platform (platform_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT project_id FOREIGN KEY (project_id)
    REFERENCES public.project (project_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT category_id FOREIGN KEY (category_id)
    REFERENCES public.category (category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT token_role_id FOREIGN KEY (token_role_id)
    REFERENCES public.token_role (token_role_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.icos
    ADD CONSTRAINT date_id FOREIGN KEY (date_id)
    REFERENCES public.date (date_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
