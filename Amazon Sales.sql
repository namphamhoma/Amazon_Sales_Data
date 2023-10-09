

-- Remove first 3 characters in discounted_price column

SELECT discounted_price
FROM Portfolio_project..amazon

SELECT discounted_price, STUFF(discounted_price, 1, 3, '') AS discounted_price_converted
FROM Portfolio_project..amazon

UPDATE Portfolio_project..amazon
SET discounted_price = STUFF(discounted_price, 1, 3, '')




--Remove first 3 characters in actual_price column

SELECT actual_price
FROM Portfolio_project..amazon

SELECT actual_price, STUFF(actual_price, 1, 3, '') AS actual_price_converted
FROM Portfolio_project..amazon

UPDATE Portfolio_project..amazon
SET actual_price = STUFF(actual_price, 1, 3, '')

--check NULL and replace it in rating column
SELECT COUNT(*) AS null_count
FROM Portfolio_project..amazon
WHERE rating IS NULL;

SELECT COALESCE(rating, '4.0')
FROM Portfolio_project..amazon

UPDATE Portfolio_project..amazon
SET rating = COALESCE(rating, '4.0')



--check rating_count column
SELECT product_id, rating_count
FROM Portfolio_project..amazon
WHERE rating_count IS NULL;



--split category column into 2 columns main_catergory and sub_catergory
SELECT category, LEFT(category, CHARINDEX('|', category) - 1) AS main_catergory
FROM Portfolio_project..amazon

ALTER TABLE Portfolio_project..amazon
ADD main_category nvarchar(255)

UPDATE Portfolio_project..amazon
SET main_category = LEFT(category, CHARINDEX('|', category) - 1)




SELECT category, SUBSTRING(category, CHARINDEX('|', category) + 1, LEN(category))
FROM Portfolio_project..amazon

ALTER TABLE Portfolio_project..amazon
ADD sub_category nvarchar(255)

UPDATE Portfolio_project..amazon
SET sub_category = SUBSTRING(category, CHARINDEX('|', category) + 1, LEN(category))




--delete unused columns
ALTER TABLE Portfolio_project..amazon
DROP COLUMN category, main_catergory



