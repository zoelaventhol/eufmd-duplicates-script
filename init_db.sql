DROP TABLE IF EXISTS countries;

-- create copy of countries table for testing
CREATE TABLE countries (
    id INT NOT NULL AUTO_INCREMENT,
    iso3 VARCHAR(255) DEFAULT NULL,
    code_moodle VARCHAR(255) DEFAULT NULL,
    name_moodle VARCHAR(255) DEFAULT NULL,
    name_un VARCHAR(255) DEFAULT NULL,
    region VARCHAR(255) DEFAULT NULL,
    subregion VARCHAR(255) DEFAULT NULL,
    eufmd_mn DOUBLE DEFAULT NULL,
    eufmd_na DOUBLE DEFAULT NULL,
    eufmd_me DOUBLE DEFAULT NULL,
    eufmd_seen DOUBLE DEFAULT NULL,
    eufmd_nc DOUBLE DEFAULT NULL,
    eufmd_enc DOUBLE DEFAULT NULL,
    lat DECIMAL(10, 0) DEFAULT NULL,
    lon DECIMAL(10, 0) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY (code_moodle)
);


-- insert test data
INSERT INTO countries (id, iso3, code_moodle, name_moodle, name_un, region, subregion, eufmd_mn, eufmd_na, eufmd_me, eufmd_seen, eufmd_nc, eufmd_enc, lat, lon)
VALUES
(1, 'AFG', 'AF', 'Afghanistan', 'Afghanistan', 'Asia', 'Southern Asia', NULL, NULL, NULL, 1, NULL, NULL, 34, 65),
(3, 'ALB', 'AL', 'Albania', 'Albania', 'Europe', 'Southern Europe', 1, NULL, NULL, NULL, NULL, NULL, 41, 20),
(4, 'DZA', 'DZ', 'Algeria', 'Algeria', 'Africa', 'Northern Africa', NULL, NULL, NULL, 1, NULL, NULL, 28, 3),
(6, 'AUS', 'AU', 'Australia', 'Australia', 'Oceania', 'Australia and New Zealand', NULL, NULL, NULL, NULL, NULL, NULL, -25, 133),
(7, 'AUS', 'AU', 'Australia', 'Australia', 'Oceania', 'Australia and New Zealand', NULL, NULL, NULL, NULL, NULL, NULL, -25, 133),
(9, 'EGY', 'EG', 'Egypt', 'Egypt', 'Africa', 'Northern Africa', NULL, NULL, NULL, 1, NULL, NULL, 27, 30),
(10, 'EGY', 'EG', 'Egypt', 'Egypt', 'Africa', 'Northern Africa', NULL, NULL, NULL, 1, NULL, NULL, 27, 30),
(12, 'AND', 'AD', 'Andorra', 'Andorra', 'Europe', 'Southern Europe', 1, NULL, NULL, NULL, NULL, NULL, 42.5, 1.5),
(14, 'AGO', 'AO', 'Angola', 'Angola', 'Africa', 'Middle Africa', NULL, NULL, NULL, 1, NULL, NULL, -12.5, 18.5),
(17, 'ATG', 'AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'Americas', 'Caribbean', NULL, NULL, NULL, 1, NULL, NULL, 17.05, -61.8),
(20, 'ARG', 'AR', 'Argentina', 'Argentina', 'Americas', 'South America', NULL, NULL, NULL, 1, NULL, NULL, -34, -64),
(22, 'ARM', 'AM', 'Armenia', 'Armenia', 'Asia', 'Western Asia', NULL, NULL, NULL, 1, NULL, NULL, 40, 45),
(24, 'AUT', 'AT', 'Austria', 'Austria', 'Europe', 'Western Europe', 1, NULL, NULL, NULL, NULL, NULL, 47.3333, 13.3333),
(27, 'AZE', 'AZ', 'Azerbaijan', 'Azerbaijan', 'Asia', 'Western Asia', NULL, NULL, NULL, 1, NULL, NULL, 40.5, 47.5),
(28, 'BHS', 'BS', 'Bahamas', 'Bahamas', 'Americas', 'Caribbean', NULL, NULL, NULL, 1, NULL, NULL, 24.25, -76),
(29, 'BHR', 'BH', 'Bahrain', 'Bahrain', 'Asia', 'Western Asia', NULL, NULL, NULL, 1, NULL, NULL, 26, 50.55),
(30, 'BGD', 'BD', 'Bangladesh', 'Bangladesh', 'Asia', 'Southern Asia', NULL, NULL, NULL, 1, NULL, NULL, 24, 90),
(31, 'BRB', 'BB', 'Barbados', 'Barbados', 'Americas', 'Caribbean', NULL, NULL, NULL, 1, NULL, NULL, 13.1667, -59.5333),
(32, 'BLR', 'BY', 'Belarus', 'Belarus', 'Europe', 'Eastern Europe', 1, NULL, NULL, NULL, NULL, NULL, 53, 28),
(33, 'BEL', 'BE', 'Belgium', 'Belgium', 'Europe', 'Western Europe', 1, NULL, NULL, NULL, NULL, NULL, 50.8333, 4),
(34, 'BLZ', 'BZ', 'Belize', 'Belize', 'Americas', 'Central America', NULL, NULL, NULL, 1, NULL, NULL, 17.25, -88.75);
