--[[
    Nakedtide Mod Definition
    Defines how the mod should be loaded and initialized.
]]

return {
    run = function()
        -- Ensure the Darktide Mod Framework is available
        fassert(rawget(_G, "new_mod"), "`Nakedtide` encountered an error loading the Darktide Mod Framework.")

        -- Initialize the mod with its scripts and data
        new_mod("Nakedtide", {
            mod_script       = "Nakedtide/scripts/mods/Nakedtide/Nakedtide",
            mod_data         = "Nakedtide/scripts/mods/Nakedtide/Nakedtide_data",
            mod_localization = "Nakedtide/scripts/mods/Nakedtide/Nakedtide_localization",
        })
    end,
    packages = {},
}
