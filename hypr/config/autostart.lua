hl.on("hyprland.start", function ()
    -- hyprpm only builds/enables plugins; nothing loads them at login unless
    -- asked. Without this, hyprglass (Liquid Glass) never loads at all.
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("qs")
    -- Registers a Bluetooth pairing agent (NoInputNoOutput = "Just Works"
    -- auto-accept, since the island has no PIN/confirmation UI). Without
    -- this running, BlueZ has nobody to hand pairing requests to and every
    -- pair() from the Quickshell panel fails with "Authentication Failed".
    hl.exec_cmd("bt-agent --capability=NoInputNoOutput")
    -- Clipboard history for the island's clipboard panel (SUPER+V).
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)