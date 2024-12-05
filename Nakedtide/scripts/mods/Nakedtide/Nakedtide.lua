--[[
    Nakedtide Mod
    This mod allows players to remove upper and lower body gear in Darktide.
]]

local mod = get_mod("Nakedtide")
local MasterItems = require("scripts/backend/master_items")

-- Constants for override slots and items
local OVERRIDE_SLOT_UPPER = "slot_gear_upperbody"
local OVERRIDE_ITEM_UPPER = "content/items/characters/player/human/gear_upperbody/empty_upperbody"
local OVERRIDE_SLOT_LOWER = "slot_gear_lowerbody"
local OVERRIDE_ITEM_LOWER = "content/items/characters/player/human/gear_lowerbody/empty_lowerbody"

-- Hook function to modify equipment when items are equipped
mod:hook(CLASS.PlayerUnitVisualLoadoutExtension, "_equip_item_to_slot", function(func, self, item, slot_name, ...)
    -- Check if upper body should be naked
    if slot_name == OVERRIDE_SLOT_UPPER and mod:get("upper_body_naked") then
        item = MasterItems.get_item(OVERRIDE_ITEM_UPPER)
    -- Check if lower body should be naked
    elseif slot_name == OVERRIDE_SLOT_LOWER and mod:get("lower_body_naked") then
        item = MasterItems.get_item(OVERRIDE_ITEM_LOWER)
    end
    -- Call the original function with potentially modified item
    func(self, item, slot_name, ...)
end)

-- Hook function to modify equipment in UI profile spawner
mod:hook(CLASS.UIProfileSpawner, "_change_slot_item", function(func, self, slot_id, item)
    local spawn_data = self._loading_profile_data or self._character_spawn_data
    -- Check if the character is the local player's character
    if spawn_data.profile.character_id == Managers.player:local_player(1)._profile.character_id then
        -- Apply naked upper body if enabled
        if slot_id == OVERRIDE_SLOT_UPPER and mod:get("upper_body_naked") then
            item = MasterItems.get_item(OVERRIDE_ITEM_UPPER)
        -- Apply naked lower body if enabled
        elseif slot_id == OVERRIDE_SLOT_LOWER and mod:get("lower_body_naked") then
            item = MasterItems.get_item(OVERRIDE_ITEM_LOWER)
        end
    end
    -- Call the original function with potentially modified item
    func(self, slot_id, item)
end)
