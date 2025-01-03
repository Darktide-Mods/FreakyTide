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
            },
            {
                setting_id = "upper_body_selection",
                type = "dropdown",
                default_value = "operator",
                options = {
                    { text = "upper_body_operator",                value = "operator" },
                    { text = "upper_body_cultist_melee_elite",     value = "cultist_melee_elite" },
                    { text = "upper_body_traitor_guard",           value = "traitor_guard" },
                    { text = "upper_body_poxwalker",               value = "poxwalker" },
                    { text = "upper_body_newly_infected",          value = "newly_infected" },
                    { text = "upper_body_ogryn",                   value = "ogryn" },
                    { text = "upper_body_cultist_a",               value = "cultist_a" },
                    { text = "upper_body_cultist_d",               value = "cultist_d" },
                    { text = "upper_body_cultist_b",               value = "cultist_b" },
                    { text = "upper_body_traitor_guard_berserker", value = "traitor_guard_berserker" },
                    { text = "upper_body_traitor_guard_elite",     value = "traitor_guard_elite" },
                    { text = "upper_body_traitor_guard_elite_b",   value = "traitor_guard_elite_b" },
                    { text = "upper_body_traitor_guard_sniper",    value = "traitor_guard_sniper" }
                },
                tooltip = "mod_upper_body_selection_tooltip"
            },
            {
                setting_id = "lower_body_selection",
                type = "dropdown",
                default_value = "operator",
                options = {
                    { text = "lower_body_operator",                value = "operator" },
                    { text = "lower_body_cultist_melee_elite",     value = "cultist_melee_elite" },
                    { text = "lower_body_traitor_guard",           value = "traitor_guard" },
                    { text = "lower_body_poxwalker",               value = "poxwalker" },
                    { text = "lower_body_newly_infected",          value = "newly_infected" },
                    { text = "lower_body_ogryn",                   value = "ogryn" },
                    { text = "lower_body_cultist_a",               value = "cultist_a" },
                    { text = "lower_body_cultist_b",               value = "cultist_b" },
                    { text = "lower_body_traitor_guard_berserker", value = "traitor_guard_berserker" },
                    { text = "lower_body_traitor_guard_elite",     value = "traitor_guard_elite" },
                    { text = "lower_body_traitor_guard_sniper",    value = "traitor_guard_sniper" }
                },
                tooltip = "mod_lower_body_selection_tooltip"
            }
        }
    }
}
