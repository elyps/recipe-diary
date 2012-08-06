DROP TABLE recipe;
CREATE TABLE recipe (recipe_id INTEGER PRIMARY KEY AUTOINCREMENT, recipe_name TEXT);
INSERT INTO recipe (recipe_id, recipe_name) VALUES (1, 'Cherry Pie');
INSERT INTO recipe (recipe_id, recipe_name) VALUES (2, 'Cake');
INSERT INTO recipe (recipe_id, recipe_name) VALUES (3, 'Cookie');

DROP TABLE ingredient;
CREATE TABLE ingredient (ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT, recipe_id INTEGER, ingredient_order INTEGER, ingredient_name TEXT);
-- Cherry Pie
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (1, 1, 0, 'Crust');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (2, 1, 1, 'Cherries');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (3, 1, 2, 'Sugar');
-- Cake
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (4, 2, 0, 'Flour');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (5, 2, 1, 'Butter');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (6, 2, 2, 'Sugar');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (7, 2, 3, 'Cocoa');
-- Cookie
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (8, 3, 0, 'Flour');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name) 
		VALUES (9, 3, 1, 'Butter');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (10, 3, 2, 'Sugar');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (11, 3, 3, 'Eggs');
INSERT INTO ingredient (ingredient_id, recipe_id, ingredient_order, ingredient_name)
		VALUES (12, 3, 4, 'Peanut Butter');
