-- look_clean.lua drawing engine configuration file for Notion.

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    shadow_colour = "grey",
    highlight_colour = "grey",
    background_colour = "#fbfbf1",
    foreground_colour = "#00454f",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    font = "-*-*-*-*-*-*-7-*-*-*-*-*-*-*",
    text_align = "center",
})

de.defstyle("tab", {
    font = "-*-*-*-*-*-*-7-*-*-*-*-*-*-*",
    de.substyle("active-selected", {
        shadow_colour = "white",
        highlight_colour = "white",
        background_colour = "#b0b0a0",
        foreground_colour = "white",
    }),
    de.substyle("active-unselected", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#ebebe1",
        foreground_colour = "#00454f",
    }),
    de.substyle("inactive-selected", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#dbdbd1",
        foreground_colour = "#00454f",
    }),
    de.substyle("inactive-unselected", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#fbfbf1",
        foreground_colour = "#00454f",
    }),
    text_align = "center",
})

de.defstyle("input", {
    foreground_colour = "black",
    de.substyle("*-cursor", {
        background_colour = "white",
        foreground_colour = "#fbfbf1",
    }),
    de.substyle("*-selection", {
        background_colour = "#aaaaaa",
        foreground_colour = "black",
    }),
    font = "-misc-fixed-medium-r-*-*-18-*-*-*-*-*-*-*",
})

de.defstyle("frame", {
    background_colour = "#f4f4ed",
    de.substyle("quasiactive", {
        -- Something detached from the frame is active
        padding_colour = "#fbfbf1",
    }),
    de.substyle("userattr1", {
        -- For user scripts
        padding_colour = "#009010",
    }),
    padding_pixels = 0,
})

de.defstyle("frame-tiled", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    spacing = 0,
})

--de.defstyle("frame-tiled-alt", {
--    bar = "none",
--})

de.defstyle("frame-floating", {
    --bar = "shaped",
    padding_pixels = 0,
})

de.defstyle("frame-transient", {
    --bar = "none",
    padding_pixels = 0,
})


de.defstyle("actnotify", {
    shadow_colour = "#c04040",
    highlight_colour = "#c04040",
    background_colour = "#901010",
    foreground_colour = "#eeeeee",
})

-- de.defstyle("tab-frame", {
--     de.substyle("*-*-*-unselected-activity", {
--         shadow_colour = "#c04040",
--         highlight_colour = "#c04040",
--         background_colour = "#901010",
--         foreground_colour = "#eeeeee",
--     }),
--     
--     de.substyle("*-*-*-selected-activity", {
--         shadow_colour = "#c04040",
--         highlight_colour = "#c04040",
--         background_colour = "#b03030",
--         foreground_colour = "#ffffff",
--     }),
--     
--     de.substyle("*-*-*-tabnumber", {
--         background_colour = "#fbfbf1",
--         foreground_colour = "green",
--     }),
-- })

de.defstyle("tab-frame", {
    spacing = 1,
})

de.defstyle("tab-frame-floating", {
    spacing = 0,
})

de.defstyle("tab-menuentry", {
    text_align = "left",
})

de.defstyle("tab-menuentry-big", {
    font = "-*-helvetica-medium-r-normal-*-17-*-*-*-*-*-*-*",
    padding_pixels = 7,
})


de.defstyle("stdisp", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    text_align = "left",
    background_colour = "#fbfbf1",
    foreground_colour = "#00454f",
    font="-misc-fixed-medium-r-*-*-13-*-*-*-*-60-*-*",
    
    de.substyle("important", {
        foreground_colour = "green",
    }),

    de.substyle("critical", {
        foreground_colour = "red",
    }),
})

de.defstyle("tab-menuentry-big", {
    padding_pixels = 7,
    font = "-misc-fixed-medium-r-*-*-18-*-*-*-*-*-*-*",
})

gr.refresh()

