return {
	-- Everforest main palette
	red     = 0xffe67e80,
	orange  = 0xffe69875,
	yellow  = 0xffdbbc7f,
	green   = 0xffa7c080,
	cyan    = 0xff83c092,
	blue    = 0xff7fbbb3,
	magenta = 0xffd699b6,

	accent       = 0xffa7c080,
	accent_bright = 0xffa7c080,
	transparent  = 0x00000000,
	background   = 0xff2d353b,

	grey = 0xff859289,

	foreground = 0xe0d3c6aa,

	black      = 0xe0232a2e,
	pure_green = 0xffa7c080,
	white      = 0xe0d3c6aa,
	purple     = 0xc0d699b6,

	black_bright   = 0xe0859289,
	red_bright     = 0xe0e67e80,
	green_bright   = 0xe0a7c080,
	yellow_bright  = 0xe0dbbc7f,
	blue_bright    = 0xe07fbbb3,
	magenta_bright = 0xe0d699b6,
	cyan_bright    = 0xe083c092,
	white_bright   = 0xe0d3c6aa,
	purple_bright  = 0xffd699b6,

	bar = {
		bg     = 0xf02d353b,
		border = 0xff2d353b,
	},
	popup = {
		bg     = 0xc02d353b,
		border = 0xff859289,
	},
	bg1 = 0xff343f44,
	bg2 = 0xff3d484d,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,

	-- Everforest equivalents (tn_* names kept for item compatibility)
	tn_red         = 0xffe67e80,
	tn_orange      = 0xffe69875,
	tn_yellow      = 0xffdbbc7f,
	tn_green       = 0xffa7c080,
	tn_light_green = 0xff83c092,
	tn_white_green = 0xffd3c6aa,
	tn_cyan        = 0xff83c092,
	tn_skyblue     = 0xff7fbbb3,
	tn_blue        = 0xff7fbbb3,
	tn_magenta     = 0xffd699b6,
	tn_white1      = 0xffd3c6aa,
	tn_white2      = 0xffc5bfaa,
	tn_white3      = 0xffb0aba0,
	tn_black1      = 0xff3d484d,
	tn_black2      = 0xff343f44,
	tn_black3      = 0xff2d353b,
	tn_black4      = 0xff232a2e,

	tn_dark_red    = 0xff6b3336,
	tn_brown       = 0xff6b4c3b,
	tn_dark_yellow = 0xff6b5a2f,
	tn_olive       = 0xff4d4022,
	tn_dark_green  = 0xff3a5228,
	tn_teal        = 0xff3a5248,
	tn_aqua        = 0xff3a5a58,
	tn_navy        = 0xff2d4a58,
	tn_deep_blue   = 0xff2d4a6b,
	tn_purple      = 0xff4a3a5a,
	tn_dark_gray   = 0xff343f44,
	tn_gray        = 0xff3d484d,

	-- Space indicator colors (Everforest palette cycling)
	cmap_1  = 0xffe67e80,  -- red
	cmap_2  = 0xffe69875,  -- orange
	cmap_3  = 0xffdbbc7f,  -- yellow
	cmap_4  = 0xffa7c080,  -- green
	cmap_5  = 0xff83c092,  -- aqua
	cmap_6  = 0xff7fbbb3,  -- blue
	cmap_7  = 0xffd699b6,  -- purple
	cmap_8  = 0xffe67e80,  -- red (repeat)
	cmap_9  = 0xffa7c080,  -- green (repeat)
	cmap_10 = 0xff7fbbb3,  -- blue (repeat)

	-- Accents (was vivid cyan/pink, now Everforest)
	accent1 = 0xffa7c080,  -- Everforest green
	accent2 = 0xff83c092,  -- Everforest aqua
	accent3 = 0xc0d699b6,  -- Everforest purple (with alpha)
	accent4 = 0xff7fbbb3,  -- Everforest blue

	soft_red   = 0xff6b3336,
	soft_white = 0xffd3c6aa,
}
