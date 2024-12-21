require("hs.ipc")
hs = hs
-- local spaces = require("spaces")

--# constants
-- local hyper = { "shift", "alt", "ctrl" }
local hyper = "⇧⌥⌃⌘"
local hyper2 = "⇧⌥⌃"
-- local hyper3 = "⌃⌥⌘"
-- local empty_table = {}
-- local windowCornerRadius = 10

local k = hs.hotkey.modal.new(hyper2, "h")

local alertStyle = {
	strokeWidth = 0,
	strokeColor = { white = 0, alpha = 1 },
	fillColor = { white = 0, alpha = 0.95 },
	textColor = { white = 1, alpha = 1 },
	textFont = "Fira Code",
	textSize = 14,
	radius = 12,
	atScreenEdge = 0,
	fadeInDuration = 0.10,
	fadeOutDuration = 0.10,
	padding = nil,
}

-- function k:entered()
-- 	hs.alert.show("HS", alertStyle)
-- end
--
-- function k:exited()
-- 	hs.alert.show("HS Done", alertStyle)
-- end

k:bind("", "escape", function()
	k:exit()
end)

k:bind("", "a", "arc", function()
	hs.application.launchOrFocus("Arc")
	k:exit()
end)

k:bind("", "w", "wezterm", function()
	hs.application.launchOrFocus("Wezterm")
	k:exit()
end)

k:bind("", "r", function()
	hs.reload()
	k:exit()
end)

k:bind("", "c", "", function()
	local chooser = hs.chooser.new(function(v)
		hs.alert.show(v["uuid"], alertStyle)
		k:exit()
	end)
	chooser:choices({
		{ ["text"] = "Wezterm", ["uuid"] = "0001" },
		{ ["text"] = "Arc", ["uuid"] = "0002" },
	})
	chooser:show()
end)

hs.alert.show("Config Loaded", alertStyle, 1)
