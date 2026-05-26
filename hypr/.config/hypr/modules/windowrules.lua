-- WINDOW RULES
hl.window_rule({
	name = "firefox-workspace",
	match = { class = "^(firefox)$" },
	workspace = 2,
})

hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "float-firefox-about",
	match = { title = "^(About Mozilla Firefox)$" },
	float = true,
})

hl.window_rule({
	name = "float-firefox-pip",
	match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
	float = true,
})

hl.window_rule({
	name = "float-firefox-library",
	match = { class = "^(firefox)$", title = "^(Library)$" },
	float = true,
})

hl.window_rule({
	name = "float-kitty-impala",
	match = { class = "^(kitty)$", title = "^(impala)$" },
	float = true,
})

hl.window_rule({
	name = "float-mpv",
	match = { class = "^(mpv)$" },
	float = true,
})

hl.window_rule({
	name = "float-nwg-look",
	match = { class = "^(nwg-look)$" },
	float = true,
})

hl.window_rule({
	name = "float-qt5ct",
	match = { class = "^(qt5ct)$" },
	float = true,
})

hl.window_rule({
	name = "float-qt6ct",
	match = { class = "^(qt6ct)$" },
	float = true,
})

hl.window_rule({
	name = "float-blueman",
	match = { class = "^(blueman-manager)$" },
	float = true,
})

hl.window_rule({
	name = "float-pavucontrol",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
})

hl.window_rule({
	name = "float-telegram",
	match = { class = "^(org.telegram.desktop)$" },
	float = true,
})

hl.window_rule({
	name = "float-iwgtk",
	match = { class = "^(org.twosheds.iwgtk)$" },
	float = true,
})

hl.window_rule({
	name = "float-quickshell",
	match = { class = "^(org.quickshell)$" },
	float = true,
})

for _, pattern in ipairs({
	"^(Open File)(.*)$",
	"^(Select a File)(.*)$",
	"^(Choose wallpaper)(.*)$",
	"^(Open Folder)(.*)$",
	"^(Save As)(.*)$",
	"^(Library)(.*)$",
	"^(File Upload)(.*)$",
}) do
	hl.window_rule({
		name = "float-dialog-" .. pattern,
		match = { title = pattern },
		float = true,
	})
end

-- Picture-in-Picture
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, keep_aspect_ratio = true })
hl.window_rule({
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	move = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
})
hl.window_rule({
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	size = { "(monitor_w*0.25)", "(monitor_h*0.25)" },
})
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, pin = true })
