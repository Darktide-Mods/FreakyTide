--[[
    FreakyTide Mod
    This mod allows players to remove upper and lower body gear in Darktide.
]]

local mod = get_mod("FreakyTide")
local MasterItems = require("scripts/backend/master_items")

-- Constants for override slots and items
local OVERRIDE_SLOT_UPPER = "slot_gear_upperbody"
local OVERRIDE_SLOT_LOWER = "slot_gear_lowerbody"

-- Upper body items
local UPPER_BODY_ITEMS = {
    operator = "content/items/characters/player/human/gear_upperbody/empty_upperbody",
    cultist_melee_elite = "content/items/characters/minions/chaos_cultist_melee_elite/attachments_base/upperbody_a",
    traitor_guard = "content/items/characters/minions/chaos_traitor_guard/attachments_base/upperbody_a_01_horde_var_01",
    poxwalker = "content/items/characters/minions/chaos_poxwalker/attachments_gear/upperbody_a",
    newly_infected = "content/items/characters/minions/chaos_traitor_guard/attachments_gear/newly_infected_upperbody_a",
    ogryn = "content/items/characters/minions/chaos_ogryn/attachments_base/torso_a",
    cultist_a = "content/items/characters/minions/chaos_cultists/attachments_base/upperbody_a",
    cultist_d = "content/items/characters/minions/chaos_cultists/attachments_base/upperbody_d_var_01_color_var_03",
    cultist_b = "content/items/characters/minions/chaos_cultists/attachments_base/upperbody_b",
    traitor_guard_berserker =
    "content/items/characters/minions/chaos_traitor_guard/attachments_base/upperbody_a_berserker",
    traitor_guard_elite = "content/items/characters/minions/chaos_traitor_guard/attachments_base/upperbody_a_elite",
    traitor_guard_elite_b = "content/items/characters/minions/chaos_traitor_guard/attachments_base/upperbody_b_elite",
    traitor_guard_sniper = "content/items/characters/minions/chaos_traitor_guard/attachments_base/upperbody_a_sniper"
}

-- Lower body items
local LOWER_BODY_ITEMS = {
    operator = "content/items/characters/player/human/gear_lowerbody/empty_lowerbody",
    cultist_melee_elite = "content/items/characters/minions/chaos_cultist_melee_elite/attachments_base/lowerbody_a",
    traitor_guard = "content/items/characters/minions/chaos_traitor_guard/attachments_base/lowerbody_a_01_horde_var_01",
    poxwalker = "content/items/characters/minions/chaos_poxwalker/attachments_gear/lowerbody_a",
    newly_infected = "content/items/characters/minions/chaos_traitor_guard/attachments_gear/newly_infected_lowerbody_b",
    ogryn = "content/items/characters/minions/chaos_ogryn/attachments_base/lowerbody_a",
    cultist_a = "content/items/characters/minions/chaos_cultists/attachments_base/lowerbody_a",
    cultist_b = "content/items/characters/minions/chaos_cultists/attachments_base/lowerbody_b_color_var_03",
    traitor_guard_berserker =
    "content/items/characters/minions/chaos_traitor_guard/attachments_base/lowerbody_b_berserker",
    traitor_guard_elite = "content/items/characters/minions/chaos_traitor_guard/attachments_base/lowerbody_b_elite",
    traitor_guard_sniper = "content/items/characters/minions/chaos_traitor_guard/attachments_base/lowerbody_a_sniper"
}

-- Function to get the appropriate upper body item based on selection
local function get_upper_body_item()
    local selection = mod:get("upper_body_selection")
    return MasterItems.get_item(UPPER_BODY_ITEMS[selection] or UPPER_BODY_ITEMS.operator)
end

-- Function to get the appropriate lower body item based on selection
local function get_lower_body_item()
    local selection = mod:get("lower_body_selection")
    return MasterItems.get_item(LOWER_BODY_ITEMS[selection] or LOWER_BODY_ITEMS.operator)
end

-- Hook function to modify equipment when items are equipped
mod:hook(CLASS.PlayerUnitVisualLoadoutExtension, "_equip_item_to_slot", function(func, self, item, slot_name, ...)
    if slot_name == OVERRIDE_SLOT_UPPER and mod:get("upper_body_naked") then
        item = get_upper_body_item()
    elseif slot_name == OVERRIDE_SLOT_LOWER and mod:get("lower_body_naked") then
        item = get_lower_body_item()
    end
    func(self, item, slot_name, ...)
end)

-- Hook function to modify equipment in UI profile spawner
mod:hook(CLASS.UIProfileSpawner, "_change_slot_item", function(func, self, slot_id, item)
    local spawn_data = self._loading_profile_data or self._character_spawn_data
    if spawn_data.profile.character_id == Managers.player:local_player(1)._profile.character_id then
        if slot_id == OVERRIDE_SLOT_UPPER and mod:get("upper_body_naked") then
            item = get_upper_body_item()
        elseif slot_id == OVERRIDE_SLOT_LOWER and mod:get("lower_body_naked") then
            item = get_lower_body_item()
        end
    end
    func(self, slot_id, item)
end)
