/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 0;
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 1000;
static int fuzzy = 1;
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"jetbrains mono:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *dynamic     = NULL;      /* -dy option; dynamic command to run on input change */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#f7bfc0", "#0f161e" },
	[SchemeSel] = { "#0f161e", "#f7bfc0" },
	[SchemeOut] = { "#a29ac3", "#0f161e" },
	[SchemeSelHighlight] = { "#fcdace", "#fb676e"  },
	[SchemeNormHighlight] = { "#fb676e", "#222222"  },
	[SchemeOutHighlight] = { "#ffc978", "#00ffff"  },
	[SchemeHp] = { "#ff0000", "#45425c"  }
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 4;
static unsigned int columns    = 4;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 3;
