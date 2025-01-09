--[[
    FreakyTide Mod Definition
    Defines how the mod should be loaded and initialized.
]]

return {
    run = function()
        -- Ensure the Darktide Mod Framework is available
        fassert(rawget(_G, "new_mod"), "`FreakyTide` encountered an error loading the Darktide Mod Framework.")

        -- Initialize the mod with its scripts and data
        new_mod("FreakyTide", {
            mod_script       = "FreakyTide/scripts/mods/FreakyTide/FreakyTide",
            mod_data         = "FreakyTide/scripts/mods/FreakyTide/FreakyTide_data",
            mod_localization = "FreakyTide/scripts/mods/FreakyTide/FreakyTide_localization",
        })
    end,
    packages = {},
}
