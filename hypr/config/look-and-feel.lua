hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(ff0000ff)"}, angle = 45 },
            -- "rgba(33ccffee)", "rgba(00ff99ee)"
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.85,
        inactive_opacity = 0.65,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- HyprGlass (github.com/hyprnux/hyprglass) — replaces the Dynamic Island's
-- "Liquid Glass" Settings toggle, which used to just flip Hyprland's native
-- decoration.blur above. That native blur block stays as-is (still the
-- on-restart default for ordinary window blur); this only glasses the
-- island's own layer surface. Layer surfaces are opt-in per namespace —
-- without the hg.layer(...) whitelist below, the global enabled toggle
-- alone would do nothing for our surface. Guarded per the plugin's own
-- documented pattern, in case hyprpm's build/enable step hasn't completed.
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    -- Neutral dark glass: the wallpaper is black, and hyprglass's defaults
    -- (dark contrast 0.9 around the midpoint + a blue-grey tint_color)
    -- lift black to grey (~20 luminance). With tint alpha 0 and contrast /
    -- brightness 1.0 black stays black (~11, same as glass off), and the
    -- glass reads through refraction + chromatic fringes at the edges
    -- instead of a grey wash. Measured on an empty kitty window.
    hg.config({
        default_theme = "dark",
        glass_opacity = 1.0,
        tint_color = 0x00000000,
        blur_strength = 1.2,
        refraction_strength = 1.0,
        edge_thickness = 0.12,
        lens_distortion = 0.8,
        chromatic_aberration = 0.6,
        fresnel_strength = 0.35,
        specular_strength = 0.6,
        dark = { brightness = 1.0, contrast = 1.0, saturation = 1.0, adaptive_dim = 0.0 },
        layers = { enabled = true },
    })

    -- Dynamic Island: solid black when Liquid Glass is off (plugin
    -- disabled); when on, the island's fill turns translucent and it gets
    -- dark frosted glass with NO edge glow — fresnel/specular are what drew
    -- the grey rim around it.
    -- No refraction/lens/chromatic either: at the edges those pull in
    -- pixels from OUTSIDE the island, so a bright window dragged under it
    -- (e.g. Brave) drew a light outline around every island piece. Pure
    -- frosted blur only.
    hg.preset("island", {
        glass_opacity = 1.0,
        blur_strength = 2.0,
        refraction_strength = 0.0,
        chromatic_aberration = 0.0,
        fresnel_strength = 0.0,
        specular_strength = 0.0,
        edge_thickness = 0.0,
        lens_distortion = 0.0,
    })
    hg.layer("quickshell:dynamic-island", { preset = "island", mask_threshold = 0.1, mask_mode = "alpha" })
end
