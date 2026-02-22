DROP TABLE IF EXISTS customers_raw_text;

CREATE TABLE customers_raw_text (
  customer_id   INTEGER,
  first_name    TEXT,
  last_name     TEXT,
  raw_phone     TEXT,
  category_raw  TEXT,
  birth_date    DATE
);

INSERT INTO customers_raw_text (
  customer_id,
  first_name,
  last_name,
  raw_phone,
  category_raw,
  birth_date
) VALUES
  (1, 'joHN',     'doE',        '   077600945  ',   'Accessories (Promo)', DATE '1994-03-12'),
  (2, 'MARY',     'sMiTh',      '077-600-045',      'Electronics (Old)',   DATE '1988-11-05'),
  (3, 'aLEx',     'johnSON',    '(374)-77-600-945', 'Accessories',         DATE '2001-07-23'),
  (4, 'anna',     'VAN DYKE',   '37477600945',      'Electronics (Promo)', DATE '1999-01-30'),
  (5, NULL,       'brOwn',      '77600945',         'Accessories (Test)',  DATE '1994-03-12');

   SELECT
   *
   FROM customers_raw_text;

   SELECT
    	raw_phone,
		REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g') AS digits_only
	FROM customers_raw_text;

	SELECT
    category_raw,
    TRIM(
      REGEXP_REPLACE(category_raw, '\([^)]*\)', '', 'g')
    ) AS category_clean2
FROM customers_raw_text;

SELECT
    category_raw,
    REGEXP_REPLACE(category_raw, '\s*\(.*?\)', '', 'g')
      AS category_clean3
FROM customers_raw_text;	

SELECT
  raw_phone,
  SUBSTRING(raw_phone FROM LENGTH(raw_phone) - 7 FOR 8) AS phone_core
FROM customers_raw_text;