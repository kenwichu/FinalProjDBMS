CREATE DATABASE FeatherQuest;

USE FeatherQuest;

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    sightings_count INT DEFAULT 0
);

CREATE TABLE Birds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    color VARCHAR(50),
    size VARCHAR(50),
    rarity VARCHAR(50)
);

CREATE TABLE Sightings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bird_id INT NOT NULL,
    location VARCHAR(100),
    sighting_date DATE,
    sighting_time TIME,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (bird_id) REFERENCES Birds(id) ON DELETE CASCADE
);

INSERT INTO Birds (name, color, size, rarity) VALUES
('Mallard', 'Green head (male), brownish (female)', 'Medium, about 50 to 65 cm', 'Common globally'),
('Common Raven', 'Black, large size', 'Large, 55 to 69 cm', 'Common'),
('Wandering Whistling Duck', 'Brown with lighter underparts', 'Medium, about 40 to 50 cm', 'Common in wetlands'),
('Common Pochard', 'Rusty red head, black breast, gray body', 'Medium, around 42 to 49 cm', 'Uncommon in Asia'),
('Tufted Duck', 'Black with white flanks, yellow eyes', 'Medium, about 40 to 47 cm', 'Common'),
('Northern Shoveler', 'Green head, white chest, brown sides', 'Medium, around 45 to 50 cm', 'Common'),
('Philippine Duck', 'Brownish with a gray head and bluish wing patch', 'Medium, 48 to 58 cm', 'Endangered, native to the Philippines'),
('Northern Pintail', 'Gray body, white underparts, long tail', 'Large, around 50 to 65 cm', 'Common'),
('Asian Pygmy Goose', 'Greenish body, white face, dark wings', 'Small, around 27 to 30 cm', 'Uncommon'),
('Philippine Megapode', 'Blackish-brown', 'Medium, 30 to 35 cm', 'Vulnerable, restricted to the Philippines'),
('Blue-breasted Quail', 'Blue breast with brown body', 'Small, around 16 to 18 cm', 'Uncommon'),
('Red Junglefowl', 'Red, orange, and black with metallic sheen (males)', 'Medium, 43 to 78 cm', 'Common, ancestor of domestic chickens'),
('Daurian Partridge', 'Gray with brown and rufous patches', 'Medium, about 28 to 32 cm', 'Uncommon'),
('Little Grebe', 'Brown and chestnut with a blackish neck', 'Small, around 25 to 29 cm', 'Common in freshwater habitats'),
('Rock Dove', 'Gray with iridescent neck', 'Medium, 29 to 37 cm', 'Very common globally'),
('White-throated Pigeon', 'Greenish body with white throat', 'Medium, around 33 to 36 cm', 'Uncommon in forested areas'),
('Island Collared Dove', 'Grayish with a white collar', 'Medium, 30 to 34 cm', 'Fairly common in Southeast Asia'),
('Red Collared Dove', 'Reddish with a black collar', 'Medium, around 20 to 25 cm', 'Common in Asia'),
('Spotted-necked Dove', 'Gray with spotted neck patches', 'Medium, about 28 to 32 cm', 'Common in open woodlands'),
('Philippine Cuckoo Dove', 'Reddish-brown with iridescent green', 'Medium, around 27 to 33 cm', 'Fairly common in the Philippines'),
('Zebra Dove', 'Grayish-brown with zebra-like markings', 'Small, around 20 to 23 cm', 'Common in Southeast Asia'),
('Luzon Bleeding-heart', 'Gray with red "blood spot" on chest', 'Medium, around 25 to 29 cm', 'Endangered, native to the Philippines'),
('Pink-necked Green Pigeon', 'Green with pinkish neck (male)', 'Medium, around 26 to 30 cm', 'Common in Southeast Asia'),
('Pompadour Green Pigeon', 'Green body with maroon back', 'Medium, 28 to 30 cm', 'Fairly common in tropical forests'),
('Emerald Dove', 'Bright green wings, reddish-brown body', 'Medium, around 23 to 28 cm', 'Common in forests of Southeast Asia'),
('White-eared Brown Dove', 'Brown with a white ear patch', 'Medium, about 25 to 30 cm', 'Common in the Philippines'),
('Amethyst Brown Dove', 'Brown with a purplish sheen', 'Medium, around 28 to 33 cm', 'Endemic to the Philippines, uncommon'),
('Pink-bellied Imperial Pigeon', 'Greenish body with pinkish belly', 'Large, around 42 to 48 cm', 'Rare, forest habitats in the Philippines'),
('Spotted Imperial Pigeon', 'White with black spots on wings', 'Large, around 40 to 45 cm', 'Uncommon in tropical forests'),
('Green Imperial Pigeon', 'Greenish-gray body', 'Large, around 40 to 45 cm', 'Common in Southeast Asia'),
('Pied Imperial Pigeon', 'White with black on wings and tail', 'Large, around 37 to 44 cm', 'Common in coastal regions'),
('Flame-breasted Fruit Dove', 'Bright orange breast, green body', 'Medium, about 27 to 29 cm', 'Rare, found in the Philippines'),
('Cream-bellied Fruit Dove', 'Creamy belly, green body', 'Medium, around 29 to 31 cm', 'Rare in tropical forests'),
('Yellow-breasted Fruit Dove', 'Yellow breast, green body', 'Medium, around 23 to 26 cm', 'Uncommon in Southeast Asia'),
('Black-chinned Fruit Dove', 'Green body, black chin', 'Medium, about 22 to 25 cm', 'Rare, island species'),
('Red-tailed Tropicbird', 'White with red tail feathers', 'Medium-large, about 90 to 105 cm wingspan', 'Rare'),
('Philippine Frogmouth', 'Brown with mottled pattern, large mouth', 'Medium, around 25 to 30 cm', 'Rare, endemic to the Philippines'),
('Great Eared Nightjar', 'Dark brown with ear tufts', 'Large, about 31 to 38 cm', 'Common in forests'),
('Grey Nightjar', 'Grayish with streaked pattern', 'Medium, around 24 to 28 cm', 'Fairly common in Asia'),
('Philippine Nightjar', 'Brown and gray with intricate patterns', 'Medium, around 24 to 27 cm', 'Endemic and uncommon in the Philippines'),
('Savanna Nightjar', 'Brown with barred patterns', 'Small-medium, 22 to 26 cm', 'Common in grasslands'),
('Whiskered Treeswift', 'Dark blue with white whiskers', 'Small, around 16 to 18 cm', 'Uncommon in forests'),
('Purple Needletail', 'Dark purplish-black with glossy sheen', 'Medium, 18 to 20 cm', 'Rare, fast flyer'),
('Pygmy Swiftlet', 'Brownish-gray', 'Very small, around 9 to 10 cm', 'Common in caves and forests'),
('Glossy Swiftlet', 'Shiny black-blue', 'Small, around 10 to 11 cm', 'Common in Southeast Asia'),
('Ameline Swiftlet', 'Dull brownish-gray', 'Small, around 9 to 10 cm', 'Uncommon'),
('Philippine Swiftlet', 'Brownish-gray', 'Small, around 10 to 11 cm', 'Endemic to the Philippines, fairly common'),
('Asian Palm Swift', 'Light brown', 'Small, about 12 to 13 cm', 'Common near palms'),
('Fork-tailed Swift', 'Blackish with a white rump', 'Medium, 16 to 18 cm', 'Common'),
('House Swift', 'Blackish with a white throat', 'Small, around 13 to 14 cm', 'Common in urban areas'),
('Rufous Coucal', 'Reddish-brown', 'Medium-large, around 40 to 45 cm', 'Uncommon in Southeast Asia'),
('Philippine Coucal', 'Brown with black head and body', 'Large, about 41 to 46 cm', 'Endemic, common in the Philippines'),
('Lesser Coucal', 'Black with brown wings', 'Medium, around 35 to 38 cm', 'Fairly common in grasslands'),
('Rough-crested Malkoha', 'Green with red eye patch', 'Medium, around 36 to 38 cm', 'Rare, forest habitat'),
('Scale-feathered Malkoha', 'Gray with scaled feather pattern', 'Medium, around 39 to 41 cm', 'Rare, endemic to the Philippines'),
('Chestnut-winged Cuckoo', 'Chestnut wings, black and white head', 'Medium, around 42 to 44 cm', 'Uncommon'),
('Common Koel', 'Black (male), brown spotted (female)', 'Medium-large, about 39 to 46 cm', 'Common'),
('Violet Cuckoo', 'Iridescent violet body, white belly', 'Small, around 18 to 20 cm', 'Uncommon'),
('Plaintive Cuckoo', 'Gray with rufous underparts', 'Small, about 22 to 24 cm', 'Fairly common'),
('Rusty-breasted Cuckoo', 'Brownish-gray with rusty breast', 'Small, around 21 to 23 cm', 'Uncommon'),
('Drongo Cuckoo', 'Black with iridescent blue', 'Medium, about 24 to 26 cm', 'Uncommon in forests');

