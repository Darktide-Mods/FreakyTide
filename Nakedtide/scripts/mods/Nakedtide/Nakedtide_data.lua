--[[
    Nakedtide Mod Data
    Defines the mod's metadata and user-configurable options.
]]

local mod = get_mod("Nakedtide")

return {
    name = "Nakedtide",
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "upper_body_naked",
                type = "checkbox",
                default_value = true,
                tooltip = "mod_upper_body_naked_tooltip"
            },
            {
                setting_id = "lower_body_naked",
                type = "checkbox",
                default_value = false,
                tooltip = "mod_lower_body_naked_tooltip"
            }
        }
    }
}
