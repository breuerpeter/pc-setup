debug_print("Window name: " .. get_window_name());
debug_print("Application name: " .. get_application_name())

if string.match(get_window_name(), "Cursor") then
    set_window_position(0, 0)      -- Left screen
    set_window_size(3840, 2160)    -- Full left screen size
end

if string.match(get_window_name(), "GitKraken") then
    set_window_position(3840, 0)   -- Right screen
    set_window_size(2160, 3840)    -- Full right screen size
end

if string.match(get_window_name(), "Obsidian") then
    set_window_position(3840, 0)   -- Right screen
    set_window_size(2160, 3840)    -- Full right screen size
end 

-- TODO: Wayland apps (WezTerm, Chrome)