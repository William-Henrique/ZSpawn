require "ISUI/ISPanel"

zSpawnClothingAndFood = ISPanel:derive("zSpawnClothingAndFood");
zSpawnClothingAndFood.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnClothingAndFood:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnClothingAndFood:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnClothingAndFood:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Vest");
    self:CreateItemButton(1, 0, "Sweater");
    self:CreateItemButton(2, 0, "Blouse");
    self:CreateItemButton(3, 0, "Trousers");

    self:CreateItemButton(0, 1, "Skirt");
    self:CreateItemButton(1, 1, "Socks");
    self:CreateItemButton(2, 1, "Socks2");
    self:CreateItemButton(3, 1, "Shoes");

    self:CreateItemButton(0, 2, "PopBottle");
    self:CreateItemButton(1, 2, "Pop1");
    self:CreateItemButton(2, 2, "Pop2");
    self:CreateItemButton(3, 2, "Pop3");

    self:CreateItemButton(0, 3, "Ramen");
    self:CreateItemButton(1, 3, "Crisps");
    self:CreateItemButton(2, 3, "Crisps3");
    self:CreateItemButton(3, 3, "Crisps4");

    self:CreateItemButton(0, 4, "PeanutButter");
    self:CreateItemButton(1, 4, "PeanutButterSandwich");
    self:CreateItemButton(2, 4, "WaterBowl");
    self:CreateItemButton(3, 4, "WaterPopBottle");

    self:CreateItemButton(0, 5, "PotOfSoup");
    self:CreateItemButton(1, 5, "BoringSoup");
    self:CreateItemButton(2, 5, "SimpleSoup");
    self:CreateItemButton(3, 5, "TastySoup");

    self:CreateItemButton(0, 6, "HeartySoup");
    self:CreateItemButton(1, 6, "ComplexSoup");
    self:CreateItemButton(2, 6, "Popcorn");
    self:CreateItemButton(3, 6, "Lollipop");

    self:CreateItemButton(0, 7, "MushroomGeneric4");
    self:CreateItemButton(1, 7, "MushroomGeneric5");
    self:CreateItemButton(2, 7, "MushroomGeneric6");
    self:CreateItemButton(3, 7, "MushroomGeneric7");

    self:CreateItemButton(0, 8, "BerryGeneric1");
    self:CreateItemButton(1, 8, "BerryGeneric2");
    self:CreateItemButton(2, 8, "BerryGeneric3");
    self:CreateItemButton(3, 8, "BerryGeneric4");

    -- Loop through our buttons table to initialize our buttons and give them their parent.
    for k,v in ipairs(self.buttons) do
		v:initialise();
		self:addChild(v);
	end

	-- Credits, because, y'know, I love my fame. :~)
	streetCred = ISLabel:new(327, 361, 0, "Mod by Spyder638, Dylan1313 & ExcentriCreation", 1, 1, 1, 1, UIFont.Small);
    streetCred:initialise();
    self:addChild(streetCred);

end

---------------------------------------------------------------------------------------------------------------------------------
-- Function to create buttons in a grid layout and add to a table. :: Input = Grid x coord, Grid y coord, string of items name --
---------------------------------------------------------------------------------------------------------------------------------

function zSpawnClothingAndFood:CreateItemButton(x, y, item)
	local new_x = 45 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnClothingAndFood.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnClothingAndFood:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end