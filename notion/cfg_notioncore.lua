--
-- Notion core configuration file
--


-- 
-- Bindings. This includes global bindings and bindings common to
-- screens and all types of frames only. See modules' configuration 
-- files for other bindings.
--


-- WScreen context bindings
--
-- The bindings in this context are available all the time.
--
-- The variable META should contain a string of the form 'Mod1+'
-- where Mod1 maybe replaced with the modifier you want to use for most
-- of the bindings. Similarly ALTMETA may be redefined to add a 
-- modifier to some of the F-key bindings.

defbindings("WScreen", {
    bdoc("Switch to next/previous object within current screen."),
    kpress(META.."Shift+Tab", "WScreen.switch_next(_)"),

    submap(META.."K", {
        bdoc("Go to region demanding attention or previously active one."),
        kpress("K", "mod_menu.grabmenu(_, _sub, 'focuslist')"),
        bdoc("Clear all tags."),
        kpress("T", "ioncore.tagged_clear()"),
    }),
   
    --Configure when there are multiple screens 
    bdoc("Go to next/previous screen on multihead setup."),
    kpress(META.."Tab", "ioncore.goto_next_screen()"),

    bdoc("Create a new workspace of chosen default type."),
    kpress("F9", "ioncore.create_ws(_)"),
    
    bdoc("Display the main menu."),
    kpress(META.."F12", "mod_query.query_menu(_, _sub, 'mainmenu', 'Main menu:')"),

    mpress("Button3", "mod_menu.pmenu(_, _sub, 'mainmenu')"),

    bdoc("Display the window list menu."),
    mpress("Button2", "mod_menu.pmenu(_, _sub, 'windowlist')"),

    submap(META.."K", { 
        bdoc("Raise focused object, if possible."),
        kpress("AnyModifier+R", "WRegion.rqorder(_chld, 'front')",
               "_chld:non-nil"),
    }),

    kpress(META.."J", "ioncore.goto_next(_chld, 'below')", "_chld:non-nil"),
    kpress(META.."H", "ioncore.goto_next(_chld, 'left')", "_chld:non-nil"),
    kpress(META.."L", "ioncore.goto_next(_chld, 'right')", "_chld:non-nil"),
    kpress(META.."Z", "ioncore.exec_on(_, 'slock')"),
})


-- Client window bindings
--
-- These bindings affect client windows directly.

defbindings("WClientWin", {
    submap(META.."K", {
       bdoc("Kill client owning the client window."),
       kpress("C", "WClientWin.kill(_)"),
       
       bdoc("Send next key press to the client window. "..
            "Some programs may not allow this by default."),
       kpress("Q", "WClientWin.quote_next(_)"),
    }),
})


-- Client window group bindings

defbindings("WGroupCW", {
    bdoc("Toggle client window group full-screen mode"),
    kpress_wait(META.."Return", "WGroup.set_fullscreen(_, 'toggle')"),
})


-- WMPlex context bindings
--
-- These bindings work in frames and on screens. The innermost of such
-- contexts/objects always gets to handle the key press. 

defbindings("WMPlex", {
    bdoc("Close current object."),
    kpress_wait(META.."C", "WRegion.rqclose_propagate(_, _sub)"),
})


-- Frames for transient windows ignore this bindmap
defbindings("WMPlex.toplevel", {
    bdoc("Toggle tag of current object."),
    kpress(META.."T", "WRegion.set_tagged(_sub, 'toggle')", "_sub:non-nil"),

    bdoc("Make a terminal with a large 12-pixel font"),
    kpress(META.."F1", "ioncore.exec_on(_, 'urxvt -fn \\'xft:Bitstream Vera Sans Mono:pixelsize=10\\'')"),
    
    bdoc("Run a terminal emulator."),
    kpress(META.."F2", "ioncore.exec_on(_, XTERM or 'x-terminal-emulator')"),
    
    bdoc("Query for command line to execute."),
    kpress(META.."F3", "mod_query.query_exec(_)"),

    bdoc("Volume down"),
    kpress("XF86AudioLowerVolume", "ioncore.exec_on(_, 'amixer -q sset Master 3%-')"),

    bdoc("Volume up"),
    kpress("XF86AudioRaiseVolume", "ioncore.exec_on(_, 'amixer -q sset Master 3%+')"),

    bdoc("Query for Lua code to execute."),
    kpress(META.."F4", "mod_query.query_lua(_)"),

    bdoc("Query for workspace to go to or create a new one."),
    kpress(META.."F9", "mod_query.query_workspace(_)"),

    bdoc("Configure external display DP1 on."),
    --kpress(META.."D", "ioncore.exec_on(_, 'xrandr --output DP-1 --auto --above eDP-1')"),
    --kpress(META.."D", "ioncore.exec_on(_, 'xrandr --output DP-1 --auto --left-of eDP-1')"),
    kpress(META.."D", "ioncore.exec_on(_, '/home/mitchell/usr/bin/external-on')"),

    bdoc("Configure external display DP1 off."),
    --kpress(META.."X", "ioncore.exec_on(_, 'xrandr --output DP-1 --off')"),
    kpress(META.."X", "ioncore.exec_on(_, '/home/mitchell/usr/bin/external-off')"),
    
    bdoc("Query for a client window to go to."),
    kpress(META.."G", "mod_query.query_gotoclient(_)"),
    
    bdoc("Display context menu."),
    --kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
    kpress(META.."M", "mod_query.query_menu(_, _sub, 'ctxmenu', 'Context menu:')"),
    
    submap(META.."K", {
        bdoc("Detach (float) or reattach an object to its previous location."),
        -- By using _chld instead of _sub, we can detach/reattach queries
        -- attached to a group. The detach code checks if the parameter 
        -- (_chld) is a group 'bottom' and detaches the whole group in that
        -- case.
        kpress("D", "ioncore.detach(_chld, 'toggle')", "_chld:non-nil"),
    }),
})


-- WFrame context bindings
--
-- These bindings are common to all types of frames. Some additional
-- frame bindings are found in some modules' configuration files.

defbindings("WFrame", {
    submap(META.."K", {
        bdoc("Maximize the frame horizontally/vertically."),
        kpress("H", "WFrame.maximize_horiz(_)"),
        kpress("V", "WFrame.maximize_vert(_)"),
    }),
    
    bdoc("Display context menu."),
    mpress("Button3", "mod_menu.pmenu(_, _sub, 'ctxmenu')"),
    
    bdoc("Begin move/resize mode."),
    kpress(META.."R", "WFrame.begin_kbresize(_)"),
    
    bdoc("Switch the frame to display the object indicated by the tab."),
    mclick("Button1@tab", "WFrame.p_switch_tab(_)"),
    mclick("Button2@tab", "WFrame.p_switch_tab(_)"),
    
    bdoc("Resize the frame."),
    mdrag("Button1@border", "WFrame.p_resize(_)"),
    mdrag(META.."Button3", "WFrame.p_resize(_)"),
    
    bdoc("Move the frame."),
    mdrag(META.."Button1", "WFrame.p_move(_)"),
    
    bdoc("Move objects between frames by dragging and dropping the tab."),
    mdrag("Button1@tab", "WFrame.p_tabdrag(_)"),
    mdrag("Button2@tab", "WFrame.p_tabdrag(_)"),
           
})

-- Frames for transient windows ignore this bindmap

defbindings("WFrame.toplevel", {
    bdoc("Query for a client window to attach."),
    kpress(META.."A", "mod_query.query_attachclient(_)"),

    bdoc("Switch to next/previous object within the frame."),
    kpress(META.."Shift+L", "WFrame.switch_next(_)"),
    kpress(META.."Shift+H", "WFrame.switch_prev(_)"),
    
--    submap(META.."K", {
--        -- Display tab numbers when modifiers are released
--        submap_wait("ioncore.tabnum.show(_)"),
--        
--        bdoc("Switch to n:th object within the frame."),
--        kpress("1", "WFrame.switch_nth(_, 0)"),
--        kpress("2", "WFrame.switch_nth(_, 1)"),
--        kpress("3", "WFrame.switch_nth(_, 2)"),
--        kpress("4", "WFrame.switch_nth(_, 3)"),
--        kpress("5", "WFrame.switch_nth(_, 4)"),
--        kpress("6", "WFrame.switch_nth(_, 5)"),
--        kpress("7", "WFrame.switch_nth(_, 6)"),
--        kpress("8", "WFrame.switch_nth(_, 7)"),
--        kpress("9", "WFrame.switch_nth(_, 8)"),
--        kpress("0", "WFrame.switch_nth(_, 9)"),
--        
--        bdoc("Move current object within the frame left/right."),
--        kpress("comma", "WFrame.dec_index(_, _sub)", "_sub:non-nil"),
--        kpress("period", "WFrame.inc_index(_, _sub)", "_sub:non-nil"),
--               
--        bdoc("Maximize the frame horizontally/vertically."),
--        kpress("H", "WFrame.maximize_horiz(_)"),
--        kpress("V", "WFrame.maximize_vert(_)"),
--
--        bdoc("Attach tagged objects to this frame."),
--        kpress("A", "ioncore.tagged_attach(_)"),
--    }),
})

-- Bindings for floating frames.

defbindings("WFrame.floating", {
    bdoc("Toggle shade mode"),
    mdblclick("Button1@tab", "WFrame.set_shaded(_, 'toggle')"),
    
    bdoc("Raise the frame."),
    mpress("Button1@tab", "WRegion.rqorder(_, 'front')"),
    mpress("Button1@border", "WRegion.rqorder(_, 'front')"),
    mclick(META.."Button1", "WRegion.rqorder(_, 'front')"),
    
    bdoc("Lower the frame."),
    mclick(META.."Button3", "WRegion.rqorder(_, 'back')"),
    
    bdoc("Move the frame."),
    mdrag("Button1@tab", "WFrame.p_move(_)"),
})


-- WMoveresMode context bindings
-- 
-- These bindings are available keyboard move/resize mode. The mode
-- is activated on frames with the command begin_kbresize (bound to
-- META.."R" above by default).

defbindings("WMoveresMode", {
    bdoc("Cancel the resize mode."),
    kpress("AnyModifier+Escape","WMoveresMode.cancel(_)"),

    bdoc("End the resize mode."),
    kpress("AnyModifier+Return","WMoveresMode.finish(_)"),

    bdoc("Grow in specified direction."),
    kpress("Left",  "WMoveresMode.resize(_, 1, 0, 0, 0)"),
    kpress("Right", "WMoveresMode.resize(_, 0, 1, 0, 0)"),
    kpress("Up",    "WMoveresMode.resize(_, 0, 0, 1, 0)"),
    kpress("Down",  "WMoveresMode.resize(_, 0, 0, 0, 1)"),
    kpress("F",     "WMoveresMode.resize(_, 1, 0, 0, 0)"),
    kpress("B",     "WMoveresMode.resize(_, 0, 1, 0, 0)"),
    kpress("P",     "WMoveresMode.resize(_, 0, 0, 1, 0)"),
    kpress("N",     "WMoveresMode.resize(_, 0, 0, 0, 1)"),
    
    bdoc("Shrink in specified direction."),
    kpress("Shift+Left",  "WMoveresMode.resize(_,-1, 0, 0, 0)"),
    kpress("Shift+Right", "WMoveresMode.resize(_, 0,-1, 0, 0)"),
    kpress("Shift+Up",    "WMoveresMode.resize(_, 0, 0,-1, 0)"),
    kpress("Shift+Down",  "WMoveresMode.resize(_, 0, 0, 0,-1)"),
    kpress("Shift+F",     "WMoveresMode.resize(_,-1, 0, 0, 0)"),
    kpress("Shift+B",     "WMoveresMode.resize(_, 0,-1, 0, 0)"),
    kpress("Shift+P",     "WMoveresMode.resize(_, 0, 0,-1, 0)"),
    kpress("Shift+N",     "WMoveresMode.resize(_, 0, 0, 0,-1)"),
    
    bdoc("Move in specified direction."),
    kpress(META.."Left",  "WMoveresMode.move(_,-1, 0)"),
    kpress(META.."Right", "WMoveresMode.move(_, 1, 0)"),
    kpress(META.."Up",    "WMoveresMode.move(_, 0,-1)"),
    kpress(META.."Down",  "WMoveresMode.move(_, 0, 1)"),
    kpress(META.."F",     "WMoveresMode.move(_,-1, 0)"),
    kpress(META.."B",     "WMoveresMode.move(_, 1, 0)"),
    kpress(META.."P",     "WMoveresMode.move(_, 0,-1)"),
    kpress(META.."N",     "WMoveresMode.move(_, 0, 1)"),
})


--
-- Menu definitions
--


-- Main menu
defmenu("mainmenu", {
    menuentry("Run...",         "mod_query.query_exec(_)"),
    menuentry("Terminal",       "ioncore.exec_on(_, XTERM or 'xterm')"),
    menuentry("Lock screen",    "ioncore.exec_on(_, 'xlock')"),
    menuentry("Help",           "mod_query.query_man(_)"),
    menuentry("About Notion",      "mod_query.show_about_ion(_)"),
    submenu("Styles",           "stylemenu"),
    submenu("Session",          "sessionmenu"),
})


-- Session control menu
defmenu("sessionmenu", {
    menuentry("Save",           "ioncore.snapshot()"),
    menuentry("Restart",        "ioncore.restart()"),
    menuentry("Restart TWM",    "ioncore.restart_other('twm')"),
    menuentry("Exit",           "ioncore.shutdown()"),
})


-- Context menu (frame actions etc.)
defctxmenu("WFrame", "Frame", {
    -- Note: this propagates the close to any subwindows; it does not
    -- destroy the frame itself, unless empty. An entry to destroy tiled
    -- frames is configured in cfg_tiling.lua.
    menuentry("Close",          "WRegion.rqclose_propagate(_, _sub)"),
    -- Low-priority entries
    menuentry("Attach tagged", "ioncore.tagged_attach(_)", { priority = 0 }),
    menuentry("Clear tags",    "ioncore.tagged_clear()", { priority = 0 }),
    menuentry("Window info",   "mod_query.show_tree(_, _sub)", { priority = 0 }),
})


-- Context menu for groups (workspaces, client windows)
defctxmenu("WGroup", "Group", {
    menuentry("Toggle tag",     "WRegion.set_tagged(_, 'toggle')"),
    menuentry("De/reattach",    "ioncore.detach(_, 'toggle')"), 
})


-- Context menu for workspaces
defctxmenu("WGroupWS", "Workspace", {
    menuentry("Close",          "WRegion.rqclose(_)"),
    menuentry("Rename",         "mod_query.query_renameworkspace(nil, _)"),
    menuentry("Attach tagged",  "ioncore.tagged_attach(_)"),
})


-- Context menu for client windows
defctxmenu("WClientWin", "Client window", {
    menuentry("Kill",           "WClientWin.kill(_)"),
})
