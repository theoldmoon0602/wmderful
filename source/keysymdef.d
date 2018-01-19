
string keysym_to_string(int keysym) {
	string[int] conv_table = ([
		0xffffff: "XK_VoidSymbol",   /* Void symbol */
		/*
		 * TTY function keys, cleverly chosen to map to ASCII, for convenience of
		 * programming, but could have been arbitrary (at the cost of lookup
		 * tables in client code).
		 */

		0xff08: "XK_BackSpace",   /* Back space, back char */
		0xff09: "XK_Tab", 
		0xff0a: "XK_Linefeed",   /* Linefeed, LF */
		0xff0b: "XK_Clear", 
		0xff0d: "XK_Return",   /* Return, enter */
		0xff13: "XK_Pause",   /* Pause, hold */
		0xff14: "XK_Scroll_Lock", 
		0xff15: "XK_Sys_Req", 
		0xff1b: "XK_Escape", 
		0xffff: "XK_Delete",   /* Delete, rubout */



		/* International & multi-key character composition */

		0xff20: "XK_Multi_key",   /* Multi-key character compose */
		0xff37: "XK_Codeinput", 
		0xff3c: "XK_SingleCandidate", 
		0xff3d: "XK_MultipleCandidate", 
		0xff3e: "XK_PreviousCandidate", 

		/* Japanese keyboard support */

		0xff21: "XK_Kanji",   /* Kanji, Kanji convert */
		0xff22: "XK_Muhenkan",   /* Cancel Conversion */
		0xff23: "XK_Henkan_Mode",   /* Start/Stop Conversion */
		0xff23: "XK_Henkan",   /* Alias for Henkan_Mode */
		0xff24: "XK_Romaji",   /* to Romaji */
		0xff25: "XK_Hiragana",   /* to Hiragana */
		0xff26: "XK_Katakana",   /* to Katakana */
		0xff27: "XK_Hiragana_Katakana",   /* Hiragana/Katakana toggle */
		0xff28: "XK_Zenkaku",   /* to Zenkaku */
		0xff29: "XK_Hankaku",   /* to Hankaku */
		0xff2a: "XK_Zenkaku_Hankaku",   /* Zenkaku/Hankaku toggle */
		0xff2b: "XK_Touroku",   /* Add to Dictionary */
		0xff2c: "XK_Massyo",   /* Delete from Dictionary */
		0xff2d: "XK_Kana_Lock",   /* Kana Lock */
		0xff2e: "XK_Kana_Shift",   /* Kana Shift */
		0xff2f: "XK_Eisu_Shift",   /* Alphanumeric Shift */
		0xff30: "XK_Eisu_toggle",   /* Alphanumeric toggle */
		0xff37: "XK_Kanji_Bangou",   /* Codeinput */
		0xff3d: "XK_Zen_Koho",   /* Multiple/All Candidate(s) */
		0xff3e: "XK_Mae_Koho",   /* Previous Candidate */

		/* 0xff31 thru 0xff3f are under XK_KOREAN */

		/* Cursor control & motion */

		0xff50: "XK_Home", 
		0xff51: "XK_Left",   /* Move left, left arrow */
		0xff52: "XK_Up",   /* Move up, up arrow */
		0xff53: "XK_Right",   /* Move right, right arrow */
		0xff54: "XK_Down",   /* Move down, down arrow */
		0xff55: "XK_Prior",   /* Prior, previous */
		0xff55: "XK_Page_Up", 
		0xff56: "XK_Next",   /* Next */
		0xff56: "XK_Page_Down", 
		0xff57: "XK_End",   /* EOL */
		0xff58: "XK_Begin",   /* BOL */


		/* Misc functions */

		0xff60: "XK_Select",   /* Select, mark */
		0xff61: "XK_Print", 
		0xff62: "XK_Execute",   /* Execute, run, do */
		0xff63: "XK_Insert",   /* Insert, insert here */
		0xff65: "XK_Undo", 
		0xff66: "XK_Redo",   /* Redo, again */
		0xff67: "XK_Menu", 
		0xff68: "XK_Find",   /* Find, search */
		0xff69: "XK_Cancel",   /* Cancel, stop, abort, exit */
		0xff6a: "XK_Help",   /* Help */
		0xff6b: "XK_Break", 
		0xff7e: "XK_Mode_switch",   /* Character set switch */
		0xff7e: "XK_script_switch",   /* Alias for mode_switch */
		0xff7f: "XK_Num_Lock", 

		/* Keypad functions, keypad numbers cleverly chosen to map to ASCII */

		0xff80: "XK_KP_Space",   /* Space */
		0xff89: "XK_KP_Tab", 
		0xff8d: "XK_KP_Enter",   /* Enter */
		0xff91: "XK_KP_F1",   /* PF1, KP_A, ... */
		0xff92: "XK_KP_F2", 
		0xff93: "XK_KP_F3", 
		0xff94: "XK_KP_F4", 
		0xff95: "XK_KP_Home", 
		0xff96: "XK_KP_Left", 
		0xff97: "XK_KP_Up", 
		0xff98: "XK_KP_Right", 
		0xff99: "XK_KP_Down", 
		0xff9a: "XK_KP_Prior", 
		0xff9a: "XK_KP_Page_Up", 
		0xff9b: "XK_KP_Next", 
		0xff9b: "XK_KP_Page_Down", 
		0xff9c: "XK_KP_End", 
		0xff9d: "XK_KP_Begin", 
		0xff9e: "XK_KP_Insert", 
		0xff9f: "XK_KP_Delete", 
		0xffbd: "XK_KP_Equal",   /* Equals */
		0xffaa: "XK_KP_Multiply", 
		0xffab: "XK_KP_Add", 
		0xffac: "XK_KP_Separator",   /* Separator, often comma */
		0xffad: "XK_KP_Subtract", 
		0xffae: "XK_KP_Decimal", 
		0xffaf: "XK_KP_Divide", 

		0xffb0: "XK_KP_0", 
		0xffb1: "XK_KP_1", 
		0xffb2: "XK_KP_2", 
		0xffb3: "XK_KP_3", 
		0xffb4: "XK_KP_4", 
		0xffb5: "XK_KP_5", 
		0xffb6: "XK_KP_6", 
		0xffb7: "XK_KP_7", 
		0xffb8: "XK_KP_8", 
		0xffb9: "XK_KP_9", 



		/*
 * Auxiliary functions; note the duplicate definitions for left and right
 * function keys;  Sun keyboards and a few other manufacturers have such
 * function key groups on the left and/or right sides of the keyboard.
 * We've not found a keyboard with more than 35 function keys total.
 */

		0xffbe: "XK_F1", 
		0xffbf: "XK_F2", 
		0xffc0: "XK_F3", 
		0xffc1: "XK_F4", 
		0xffc2: "XK_F5", 
		0xffc3: "XK_F6", 
		0xffc4: "XK_F7", 
		0xffc5: "XK_F8", 
		0xffc6: "XK_F9", 
		0xffc7: "XK_F10", 
		0xffc8: "XK_F11", 
		0xffc8: "XK_L1", 
		0xffc9: "XK_F12", 
		0xffc9: "XK_L2", 
		0xffca: "XK_F13", 
		0xffca: "XK_L3", 
		0xffcb: "XK_F14", 
		0xffcb: "XK_L4", 
		0xffcc: "XK_F15", 
		0xffcc: "XK_L5", 
		0xffcd: "XK_F16", 
		0xffcd: "XK_L6", 
		0xffce: "XK_F17", 
		0xffce: "XK_L7", 
		0xffcf: "XK_F18", 
		0xffcf: "XK_L8", 
		0xffd0: "XK_F19", 
		0xffd0: "XK_L9", 
		0xffd1: "XK_F20", 
		0xffd1: "XK_L10", 
		0xffd2: "XK_F21", 
		0xffd2: "XK_R1", 
		0xffd3: "XK_F22", 
		0xffd3: "XK_R2", 
		0xffd4: "XK_F23", 
		0xffd4: "XK_R3", 
		0xffd5: "XK_F24", 
		0xffd5: "XK_R4", 
		0xffd6: "XK_F25", 
		0xffd6: "XK_R5", 
		0xffd7: "XK_F26", 
		0xffd7: "XK_R6", 
		0xffd8: "XK_F27", 
		0xffd8: "XK_R7", 
		0xffd9: "XK_F28", 
		0xffd9: "XK_R8", 
		0xffda: "XK_F29", 
		0xffda: "XK_R9", 
		0xffdb: "XK_F30", 
		0xffdb: "XK_R10", 
		0xffdc: "XK_F31", 
		0xffdc: "XK_R11", 
		0xffdd: "XK_F32", 
		0xffdd: "XK_R12", 
		0xffde: "XK_F33", 
		0xffde: "XK_R13", 
		0xffdf: "XK_F34", 
		0xffdf: "XK_R14", 
		0xffe0: "XK_F35", 
		0xffe0: "XK_R15", 

		/* Modifiers */

		0xffe1: "XK_Shift_L",   /* Left shift */
		0xffe2: "XK_Shift_R",   /* Right shift */
		0xffe3: "XK_Control_L",   /* Left control */
		0xffe4: "XK_Control_R",   /* Right control */
		0xffe5: "XK_Caps_Lock",   /* Caps lock */
		0xffe6: "XK_Shift_Lock",   /* Shift lock */

		0xffe7: "XK_Meta_L",   /* Left meta */
		0xffe8: "XK_Meta_R",   /* Right meta */
		0xffe9: "XK_Alt_L",   /* Left alt */
		0xffea: "XK_Alt_R",   /* Right alt */
		0xffeb: "XK_Super_L",   /* Left super */
		0xffec: "XK_Super_R",   /* Right super */
		0xffed: "XK_Hyper_L",   /* Left hyper */
		0xffee: "XK_Hyper_R",   /* Right hyper */

		/*
 * Keyboard (XKB) Extension function and modifier keys
 * (from Appendix C of "The X Keyboard Extension: Protocol Specification")
 * Byte 3 = 0xfe
 */

		0xfe01: "XK_ISO_Lock", 
		0xfe02: "XK_ISO_Level2_Latch", 
		0xfe03: "XK_ISO_Level3_Shift", 
		0xfe04: "XK_ISO_Level3_Latch", 
		0xfe05: "XK_ISO_Level3_Lock", 
		0xfe11: "XK_ISO_Level5_Shift", 
		0xfe12: "XK_ISO_Level5_Latch", 
		0xfe13: "XK_ISO_Level5_Lock", 
		0xff7e: "XK_ISO_Group_Shift",   /* Alias for mode_switch */
		0xfe06: "XK_ISO_Group_Latch", 
		0xfe07: "XK_ISO_Group_Lock", 
		0xfe08: "XK_ISO_Next_Group", 
		0xfe09: "XK_ISO_Next_Group_Lock", 
		0xfe0a: "XK_ISO_Prev_Group", 
		0xfe0b: "XK_ISO_Prev_Group_Lock", 
		0xfe0c: "XK_ISO_First_Group", 
		0xfe0d: "XK_ISO_First_Group_Lock", 
		0xfe0e: "XK_ISO_Last_Group", 
		0xfe0f: "XK_ISO_Last_Group_Lock", 

		0xfe20: "XK_ISO_Left_Tab", 
		0xfe21: "XK_ISO_Move_Line_Up", 
		0xfe22: "XK_ISO_Move_Line_Down", 
		0xfe23: "XK_ISO_Partial_Line_Up", 
		0xfe24: "XK_ISO_Partial_Line_Down", 
		0xfe25: "XK_ISO_Partial_Space_Left", 
		0xfe26: "XK_ISO_Partial_Space_Right", 
		0xfe27: "XK_ISO_Set_Margin_Left", 
		0xfe28: "XK_ISO_Set_Margin_Right", 
		0xfe29: "XK_ISO_Release_Margin_Left", 
		0xfe2a: "XK_ISO_Release_Margin_Right", 
		0xfe2b: "XK_ISO_Release_Both_Margins", 
		0xfe2c: "XK_ISO_Fast_Cursor_Left", 
		0xfe2d: "XK_ISO_Fast_Cursor_Right", 
		0xfe2e: "XK_ISO_Fast_Cursor_Up", 
		0xfe2f: "XK_ISO_Fast_Cursor_Down", 
		0xfe30: "XK_ISO_Continuous_Underline", 
		0xfe31: "XK_ISO_Discontinuous_Underline", 
		0xfe32: "XK_ISO_Emphasize", 
		0xfe33: "XK_ISO_Center_Object", 
		0xfe34: "XK_ISO_Enter", 

		0xfe50: "XK_dead_grave", 
		0xfe51: "XK_dead_acute", 
		0xfe52: "XK_dead_circumflex", 
		0xfe53: "XK_dead_tilde", 
		0xfe53: "XK_dead_perispomeni",   /* alias for dead_tilde */
		0xfe54: "XK_dead_macron", 
		0xfe55: "XK_dead_breve", 
		0xfe56: "XK_dead_abovedot", 
		0xfe57: "XK_dead_diaeresis", 
		0xfe58: "XK_dead_abovering", 
		0xfe59: "XK_dead_doubleacute", 
		0xfe5a: "XK_dead_caron", 
		0xfe5b: "XK_dead_cedilla", 
		0xfe5c: "XK_dead_ogonek", 
		0xfe5d: "XK_dead_iota", 
		0xfe5e: "XK_dead_voiced_sound", 
		0xfe5f: "XK_dead_semivoiced_sound", 
		0xfe60: "XK_dead_belowdot", 
		0xfe61: "XK_dead_hook", 
		0xfe62: "XK_dead_horn", 
		0xfe63: "XK_dead_stroke", 
		0xfe64: "XK_dead_abovecomma", 
		0xfe64: "XK_dead_psili",   /* alias for dead_abovecomma */
		0xfe65: "XK_dead_abovereversedcomma", 
		0xfe65: "XK_dead_dasia",   /* alias for dead_abovereversedcomma */
		0xfe66: "XK_dead_doublegrave", 
		0xfe67: "XK_dead_belowring", 
		0xfe68: "XK_dead_belowmacron", 
		0xfe69: "XK_dead_belowcircumflex", 
		0xfe6a: "XK_dead_belowtilde", 
		0xfe6b: "XK_dead_belowbreve", 
		0xfe6c: "XK_dead_belowdiaeresis", 
		0xfe6d: "XK_dead_invertedbreve", 
		0xfe6e: "XK_dead_belowcomma", 
		0xfe6f: "XK_dead_currency", 

		/* extra dead elements for German T3 layout */
		0xfe90: "XK_dead_lowline", 
		0xfe91: "XK_dead_aboveverticalline", 
		0xfe92: "XK_dead_belowverticalline", 
		0xfe93: "XK_dead_longsolidusoverlay", 

		/* dead vowels for universal syllable entry */
		0xfe80: "XK_dead_a", 
		0xfe81: "XK_dead_A", 
		0xfe82: "XK_dead_e", 
		0xfe83: "XK_dead_E", 
		0xfe84: "XK_dead_i", 
		0xfe85: "XK_dead_I", 
		0xfe86: "XK_dead_o", 
		0xfe87: "XK_dead_O", 
		0xfe88: "XK_dead_u", 
		0xfe89: "XK_dead_U", 
		0xfe8a: "XK_dead_small_schwa", 
		0xfe8b: "XK_dead_capital_schwa", 

		0xfe8c: "XK_dead_greek", 

		0xfed0: "XK_First_Virtual_Screen", 
		0xfed1: "XK_Prev_Virtual_Screen", 
		0xfed2: "XK_Next_Virtual_Screen", 
		0xfed4: "XK_Last_Virtual_Screen", 
		0xfed5: "XK_Terminate_Server", 

		0xfe70: "XK_AccessX_Enable", 
		0xfe71: "XK_AccessX_Feedback_Enable", 
		0xfe72: "XK_RepeatKeys_Enable", 
		0xfe73: "XK_SlowKeys_Enable", 
		0xfe74: "XK_BounceKeys_Enable", 
		0xfe75: "XK_StickyKeys_Enable", 
		0xfe76: "XK_MouseKeys_Enable", 
		0xfe77: "XK_MouseKeys_Accel_Enable", 
		0xfe78: "XK_Overlay1_Enable", 
		0xfe79: "XK_Overlay2_Enable", 
		0xfe7a: "XK_AudibleBell_Enable", 

		0xfee0: "XK_Pointer_Left", 
		0xfee1: "XK_Pointer_Right", 
		0xfee2: "XK_Pointer_Up", 
		0xfee3: "XK_Pointer_Down", 
		0xfee4: "XK_Pointer_UpLeft", 
		0xfee5: "XK_Pointer_UpRight", 
		0xfee6: "XK_Pointer_DownLeft", 
		0xfee7: "XK_Pointer_DownRight", 
		0xfee8: "XK_Pointer_Button_Dflt", 
		0xfee9: "XK_Pointer_Button1", 
		0xfeea: "XK_Pointer_Button2", 
		0xfeeb: "XK_Pointer_Button3", 
		0xfeec: "XK_Pointer_Button4", 
		0xfeed: "XK_Pointer_Button5", 
		0xfeee: "XK_Pointer_DblClick_Dflt", 
		0xfeef: "XK_Pointer_DblClick1", 
		0xfef0: "XK_Pointer_DblClick2", 
		0xfef1: "XK_Pointer_DblClick3", 
		0xfef2: "XK_Pointer_DblClick4", 
		0xfef3: "XK_Pointer_DblClick5", 
		0xfef4: "XK_Pointer_Drag_Dflt", 
		0xfef5: "XK_Pointer_Drag1", 
		0xfef6: "XK_Pointer_Drag2", 
		0xfef7: "XK_Pointer_Drag3", 
		0xfef8: "XK_Pointer_Drag4", 
		0xfefd: "XK_Pointer_Drag5", 

		0xfef9: "XK_Pointer_EnableKeys", 
		0xfefa: "XK_Pointer_Accelerate", 
		0xfefb: "XK_Pointer_DfltBtnNext", 
		0xfefc: "XK_Pointer_DfltBtnPrev", 

		/* Single-Stroke Multiple-Character N-Graph Keysyms For The X Input Method */

		0xfea0: "XK_ch", 
		0xfea1: "XK_Ch", 
		0xfea2: "XK_CH", 
		0xfea3: "XK_c_h", 
		0xfea4: "XK_C_h", 
		0xfea5: "XK_C_H", 


		/*
 * 3270 Terminal Keys
 * Byte 3 = 0xfd
 */

		0xfd01: "XK_3270_Duplicate", 
		0xfd02: "XK_3270_FieldMark", 
		0xfd03: "XK_3270_Right2", 
		0xfd04: "XK_3270_Left2", 
		0xfd05: "XK_3270_BackTab", 
		0xfd06: "XK_3270_EraseEOF", 
		0xfd07: "XK_3270_EraseInput", 
		0xfd08: "XK_3270_Reset", 
		0xfd09: "XK_3270_Quit", 
		0xfd0a: "XK_3270_PA1", 
		0xfd0b: "XK_3270_PA2", 
		0xfd0c: "XK_3270_PA3", 
		0xfd0d: "XK_3270_Test", 
		0xfd0e: "XK_3270_Attn", 
		0xfd0f: "XK_3270_CursorBlink", 
		0xfd10: "XK_3270_AltCursor", 
		0xfd11: "XK_3270_KeyClick", 
		0xfd12: "XK_3270_Jump", 
		0xfd13: "XK_3270_Ident", 
		0xfd14: "XK_3270_Rule", 
		0xfd15: "XK_3270_Copy", 
		0xfd16: "XK_3270_Play", 
		0xfd17: "XK_3270_Setup", 
		0xfd18: "XK_3270_Record", 
		0xfd19: "XK_3270_ChangeScreen", 
		0xfd1a: "XK_3270_DeleteWord", 
		0xfd1b: "XK_3270_ExSelect", 
		0xfd1c: "XK_3270_CursorSelect", 
		0xfd1d: "XK_3270_PrintScreen", 
		0xfd1e: "XK_3270_Enter", 


		/*
 * Latin 1
 * (ISO/IEC 8859-1 = Unicode U+0020..U+00FF)
 * Byte 3 = 0
 */
		0x0020: "XK_space",   /* U+0020 SPACE */
		0x0021: "XK_exclam",   /* U+0021 EXCLAMATION MARK */
		0x0022: "XK_quotedbl",   /* U+0022 QUOTATION MARK */
		0x0023: "XK_numbersign",   /* U+0023 NUMBER SIGN */
		0x0024: "XK_dollar",   /* U+0024 DOLLAR SIGN */
		0x0025: "XK_percent",   /* U+0025 PERCENT SIGN */
		0x0026: "XK_ampersand",   /* U+0026 AMPERSAND */
		0x0027: "XK_apostrophe",   /* U+0027 APOSTROPHE */
		0x0027: "XK_quoteright",   /* deprecated */
		0x0028: "XK_parenleft",   /* U+0028 LEFT PARENTHESIS */
		0x0029: "XK_parenright",   /* U+0029 RIGHT PARENTHESIS */
		0x002a: "XK_asterisk",   /* U+002A ASTERISK */
		0x002b: "XK_plus",   /* U+002B PLUS SIGN */
		0x002c: "XK_comma",   /* U+002C COMMA */
		0x002d: "XK_minus",   /* U+002D HYPHEN-MINUS */
		0x002e: "XK_period",   /* U+002E FULL STOP */
		0x002f: "XK_slash",   /* U+002F SOLIDUS */
		0x0030: "XK_0",   /* U+0030 DIGIT ZERO */
		0x0031: "XK_1",   /* U+0031 DIGIT ONE */
		0x0032: "XK_2",   /* U+0032 DIGIT TWO */
		0x0033: "XK_3",   /* U+0033 DIGIT THREE */
		0x0034: "XK_4",   /* U+0034 DIGIT FOUR */
		0x0035: "XK_5",   /* U+0035 DIGIT FIVE */
		0x0036: "XK_6",   /* U+0036 DIGIT SIX */
		0x0037: "XK_7",   /* U+0037 DIGIT SEVEN */
		0x0038: "XK_8",   /* U+0038 DIGIT EIGHT */
		0x0039: "XK_9",   /* U+0039 DIGIT NINE */
		0x003a: "XK_colon",   /* U+003A COLON */
		0x003b: "XK_semicolon",   /* U+003B SEMICOLON */
		0x003c: "XK_less",   /* U+003C LESS-THAN SIGN */
		0x003d: "XK_equal",   /* U+003D EQUALS SIGN */
		0x003e: "XK_greater",   /* U+003E GREATER-THAN SIGN */
		0x003f: "XK_question",   /* U+003F QUESTION MARK */
		0x0040: "XK_at",   /* U+0040 COMMERCIAL AT */
		0x0041: "XK_A",   /* U+0041 LATIN CAPITAL LETTER A */
		0x0042: "XK_B",   /* U+0042 LATIN CAPITAL LETTER B */
		0x0043: "XK_C",   /* U+0043 LATIN CAPITAL LETTER C */
		0x0044: "XK_D",   /* U+0044 LATIN CAPITAL LETTER D */
		0x0045: "XK_E",   /* U+0045 LATIN CAPITAL LETTER E */
		0x0046: "XK_F",   /* U+0046 LATIN CAPITAL LETTER F */
		0x0047: "XK_G",   /* U+0047 LATIN CAPITAL LETTER G */
		0x0048: "XK_H",   /* U+0048 LATIN CAPITAL LETTER H */
		0x0049: "XK_I",   /* U+0049 LATIN CAPITAL LETTER I */
		0x004a: "XK_J",   /* U+004A LATIN CAPITAL LETTER J */
		0x004b: "XK_K",   /* U+004B LATIN CAPITAL LETTER K */
		0x004c: "XK_L",   /* U+004C LATIN CAPITAL LETTER L */
		0x004d: "XK_M",   /* U+004D LATIN CAPITAL LETTER M */
		0x004e: "XK_N",   /* U+004E LATIN CAPITAL LETTER N */
		0x004f: "XK_O",   /* U+004F LATIN CAPITAL LETTER O */
		0x0050: "XK_P",   /* U+0050 LATIN CAPITAL LETTER P */
		0x0051: "XK_Q",   /* U+0051 LATIN CAPITAL LETTER Q */
		0x0052: "XK_R",   /* U+0052 LATIN CAPITAL LETTER R */
		0x0053: "XK_S",   /* U+0053 LATIN CAPITAL LETTER S */
		0x0054: "XK_T",   /* U+0054 LATIN CAPITAL LETTER T */
		0x0055: "XK_U",   /* U+0055 LATIN CAPITAL LETTER U */
		0x0056: "XK_V",   /* U+0056 LATIN CAPITAL LETTER V */
		0x0057: "XK_W",   /* U+0057 LATIN CAPITAL LETTER W */
		0x0058: "XK_X",   /* U+0058 LATIN CAPITAL LETTER X */
		0x0059: "XK_Y",   /* U+0059 LATIN CAPITAL LETTER Y */
		0x005a: "XK_Z",   /* U+005A LATIN CAPITAL LETTER Z */
		0x005b: "XK_bracketleft",   /* U+005B LEFT SQUARE BRACKET */
		0x005c: "XK_backslash",   /* U+005C REVERSE SOLIDUS */
		0x005d: "XK_bracketright",   /* U+005D RIGHT SQUARE BRACKET */
		0x005e: "XK_asciicircum",   /* U+005E CIRCUMFLEX ACCENT */
		0x005f: "XK_underscore",   /* U+005F LOW LINE */
		0x0060: "XK_grave",   /* U+0060 GRAVE ACCENT */
		0x0060: "XK_quoteleft",   /* deprecated */
		0x0061: "XK_a",   /* U+0061 LATIN SMALL LETTER A */
		0x0062: "XK_b",   /* U+0062 LATIN SMALL LETTER B */
		0x0063: "XK_c",   /* U+0063 LATIN SMALL LETTER C */
		0x0064: "XK_d",   /* U+0064 LATIN SMALL LETTER D */
		0x0065: "XK_e",   /* U+0065 LATIN SMALL LETTER E */
		0x0066: "XK_f",   /* U+0066 LATIN SMALL LETTER F */
		0x0067: "XK_g",   /* U+0067 LATIN SMALL LETTER G */
		0x0068: "XK_h",   /* U+0068 LATIN SMALL LETTER H */
		0x0069: "XK_i",   /* U+0069 LATIN SMALL LETTER I */
		0x006a: "XK_j",   /* U+006A LATIN SMALL LETTER J */
		0x006b: "XK_k",   /* U+006B LATIN SMALL LETTER K */
		0x006c: "XK_l",   /* U+006C LATIN SMALL LETTER L */
		0x006d: "XK_m",   /* U+006D LATIN SMALL LETTER M */
		0x006e: "XK_n",   /* U+006E LATIN SMALL LETTER N */
		0x006f: "XK_o",   /* U+006F LATIN SMALL LETTER O */
		0x0070: "XK_p",   /* U+0070 LATIN SMALL LETTER P */
		0x0071: "XK_q",   /* U+0071 LATIN SMALL LETTER Q */
		0x0072: "XK_r",   /* U+0072 LATIN SMALL LETTER R */
		0x0073: "XK_s",   /* U+0073 LATIN SMALL LETTER S */
		0x0074: "XK_t",   /* U+0074 LATIN SMALL LETTER T */
		0x0075: "XK_u",   /* U+0075 LATIN SMALL LETTER U */
		0x0076: "XK_v",   /* U+0076 LATIN SMALL LETTER V */
		0x0077: "XK_w",   /* U+0077 LATIN SMALL LETTER W */
		0x0078: "XK_x",   /* U+0078 LATIN SMALL LETTER X */
		0x0079: "XK_y",   /* U+0079 LATIN SMALL LETTER Y */
		0x007a: "XK_z",   /* U+007A LATIN SMALL LETTER Z */
		0x007b: "XK_braceleft",   /* U+007B LEFT CURLY BRACKET */
		0x007c: "XK_bar",   /* U+007C VERTICAL LINE */
		0x007d: "XK_braceright",   /* U+007D RIGHT CURLY BRACKET */
		0x007e: "XK_asciitilde",   /* U+007E TILDE */

		0x00a0: "XK_nobreakspace",   /* U+00A0 NO-BREAK SPACE */
		0x00a1: "XK_exclamdown",   /* U+00A1 INVERTED EXCLAMATION MARK */
		0x00a2: "XK_cent",   /* U+00A2 CENT SIGN */
		0x00a3: "XK_sterling",   /* U+00A3 POUND SIGN */
		0x00a4: "XK_currency",   /* U+00A4 CURRENCY SIGN */
		0x00a5: "XK_yen",   /* U+00A5 YEN SIGN */
		0x00a6: "XK_brokenbar",   /* U+00A6 BROKEN BAR */
		0x00a7: "XK_section",   /* U+00A7 SECTION SIGN */
		0x00a8: "XK_diaeresis",   /* U+00A8 DIAERESIS */
		0x00a9: "XK_copyright",   /* U+00A9 COPYRIGHT SIGN */
		0x00aa: "XK_ordfeminine",   /* U+00AA FEMININE ORDINAL INDICATOR */
		0x00ab: "XK_guillemotleft",   /* U+00AB LEFT-POINTING DOUBLE ANGLE QUOTATION MARK */
		0x00ac: "XK_notsign",   /* U+00AC NOT SIGN */
		0x00ad: "XK_hyphen",   /* U+00AD SOFT HYPHEN */
		0x00ae: "XK_registered",   /* U+00AE REGISTERED SIGN */
		0x00af: "XK_macron",   /* U+00AF MACRON */
		0x00b0: "XK_degree",   /* U+00B0 DEGREE SIGN */
		0x00b1: "XK_plusminus",   /* U+00B1 PLUS-MINUS SIGN */
		0x00b2: "XK_twosuperior",   /* U+00B2 SUPERSCRIPT TWO */
		0x00b3: "XK_threesuperior",   /* U+00B3 SUPERSCRIPT THREE */
		0x00b4: "XK_acute",   /* U+00B4 ACUTE ACCENT */
		0x00b5: "XK_mu",   /* U+00B5 MICRO SIGN */
		0x00b6: "XK_paragraph",   /* U+00B6 PILCROW SIGN */
		0x00b7: "XK_periodcentered",   /* U+00B7 MIDDLE DOT */
		0x00b8: "XK_cedilla",   /* U+00B8 CEDILLA */
		0x00b9: "XK_onesuperior",   /* U+00B9 SUPERSCRIPT ONE */
		0x00ba: "XK_masculine",   /* U+00BA MASCULINE ORDINAL INDICATOR */
		0x00bb: "XK_guillemotright",   /* U+00BB RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK */
		0x00bc: "XK_onequarter",   /* U+00BC VULGAR FRACTION ONE QUARTER */
		0x00bd: "XK_onehalf",   /* U+00BD VULGAR FRACTION ONE HALF */
		0x00be: "XK_threequarters",   /* U+00BE VULGAR FRACTION THREE QUARTERS */
		0x00bf: "XK_questiondown",   /* U+00BF INVERTED QUESTION MARK */
		0x00c0: "XK_Agrave",   /* U+00C0 LATIN CAPITAL LETTER A WITH GRAVE */
		0x00c1: "XK_Aacute",   /* U+00C1 LATIN CAPITAL LETTER A WITH ACUTE */
		0x00c2: "XK_Acircumflex",   /* U+00C2 LATIN CAPITAL LETTER A WITH CIRCUMFLEX */
		0x00c3: "XK_Atilde",   /* U+00C3 LATIN CAPITAL LETTER A WITH TILDE */
		0x00c4: "XK_Adiaeresis",   /* U+00C4 LATIN CAPITAL LETTER A WITH DIAERESIS */
		0x00c5: "XK_Aring",   /* U+00C5 LATIN CAPITAL LETTER A WITH RING ABOVE */
		0x00c6: "XK_AE",   /* U+00C6 LATIN CAPITAL LETTER AE */
		0x00c7: "XK_Ccedilla",   /* U+00C7 LATIN CAPITAL LETTER C WITH CEDILLA */
		0x00c8: "XK_Egrave",   /* U+00C8 LATIN CAPITAL LETTER E WITH GRAVE */
		0x00c9: "XK_Eacute",   /* U+00C9 LATIN CAPITAL LETTER E WITH ACUTE */
		0x00ca: "XK_Ecircumflex",   /* U+00CA LATIN CAPITAL LETTER E WITH CIRCUMFLEX */
		0x00cb: "XK_Ediaeresis",   /* U+00CB LATIN CAPITAL LETTER E WITH DIAERESIS */
		0x00cc: "XK_Igrave",   /* U+00CC LATIN CAPITAL LETTER I WITH GRAVE */
		0x00cd: "XK_Iacute",   /* U+00CD LATIN CAPITAL LETTER I WITH ACUTE */
		0x00ce: "XK_Icircumflex",   /* U+00CE LATIN CAPITAL LETTER I WITH CIRCUMFLEX */
		0x00cf: "XK_Idiaeresis",   /* U+00CF LATIN CAPITAL LETTER I WITH DIAERESIS */
		0x00d0: "XK_ETH",   /* U+00D0 LATIN CAPITAL LETTER ETH */
		0x00d0: "XK_Eth",   /* deprecated */
		0x00d1: "XK_Ntilde",   /* U+00D1 LATIN CAPITAL LETTER N WITH TILDE */
		0x00d2: "XK_Ograve",   /* U+00D2 LATIN CAPITAL LETTER O WITH GRAVE */
		0x00d3: "XK_Oacute",   /* U+00D3 LATIN CAPITAL LETTER O WITH ACUTE */
		0x00d4: "XK_Ocircumflex",   /* U+00D4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX */
		0x00d5: "XK_Otilde",   /* U+00D5 LATIN CAPITAL LETTER O WITH TILDE */
		0x00d6: "XK_Odiaeresis",   /* U+00D6 LATIN CAPITAL LETTER O WITH DIAERESIS */
		0x00d7: "XK_multiply",   /* U+00D7 MULTIPLICATION SIGN */
		0x00d8: "XK_Oslash",   /* U+00D8 LATIN CAPITAL LETTER O WITH STROKE */
		0x00d8: "XK_Ooblique",   /* U+00D8 LATIN CAPITAL LETTER O WITH STROKE */
		0x00d9: "XK_Ugrave",   /* U+00D9 LATIN CAPITAL LETTER U WITH GRAVE */
		0x00da: "XK_Uacute",   /* U+00DA LATIN CAPITAL LETTER U WITH ACUTE */
		0x00db: "XK_Ucircumflex",   /* U+00DB LATIN CAPITAL LETTER U WITH CIRCUMFLEX */
		0x00dc: "XK_Udiaeresis",   /* U+00DC LATIN CAPITAL LETTER U WITH DIAERESIS */
		0x00dd: "XK_Yacute",   /* U+00DD LATIN CAPITAL LETTER Y WITH ACUTE */
		0x00de: "XK_THORN",   /* U+00DE LATIN CAPITAL LETTER THORN */
		0x00de: "XK_Thorn",   /* deprecated */
		0x00df: "XK_ssharp",   /* U+00DF LATIN SMALL LETTER SHARP S */
		0x00e0: "XK_agrave",   /* U+00E0 LATIN SMALL LETTER A WITH GRAVE */
		0x00e1: "XK_aacute",   /* U+00E1 LATIN SMALL LETTER A WITH ACUTE */
		0x00e2: "XK_acircumflex",   /* U+00E2 LATIN SMALL LETTER A WITH CIRCUMFLEX */
		0x00e3: "XK_atilde",   /* U+00E3 LATIN SMALL LETTER A WITH TILDE */
		0x00e4: "XK_adiaeresis",   /* U+00E4 LATIN SMALL LETTER A WITH DIAERESIS */
		0x00e5: "XK_aring",   /* U+00E5 LATIN SMALL LETTER A WITH RING ABOVE */
		0x00e6: "XK_ae",   /* U+00E6 LATIN SMALL LETTER AE */
		0x00e7: "XK_ccedilla",   /* U+00E7 LATIN SMALL LETTER C WITH CEDILLA */
		0x00e8: "XK_egrave",   /* U+00E8 LATIN SMALL LETTER E WITH GRAVE */
		0x00e9: "XK_eacute",   /* U+00E9 LATIN SMALL LETTER E WITH ACUTE */
		0x00ea: "XK_ecircumflex",   /* U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX */
		0x00eb: "XK_ediaeresis",   /* U+00EB LATIN SMALL LETTER E WITH DIAERESIS */
		0x00ec: "XK_igrave",   /* U+00EC LATIN SMALL LETTER I WITH GRAVE */
		0x00ed: "XK_iacute",   /* U+00ED LATIN SMALL LETTER I WITH ACUTE */
		0x00ee: "XK_icircumflex",   /* U+00EE LATIN SMALL LETTER I WITH CIRCUMFLEX */
		0x00ef: "XK_idiaeresis",   /* U+00EF LATIN SMALL LETTER I WITH DIAERESIS */
		0x00f0: "XK_eth",   /* U+00F0 LATIN SMALL LETTER ETH */
		0x00f1: "XK_ntilde",   /* U+00F1 LATIN SMALL LETTER N WITH TILDE */
		0x00f2: "XK_ograve",   /* U+00F2 LATIN SMALL LETTER O WITH GRAVE */
		0x00f3: "XK_oacute",   /* U+00F3 LATIN SMALL LETTER O WITH ACUTE */
		0x00f4: "XK_ocircumflex",   /* U+00F4 LATIN SMALL LETTER O WITH CIRCUMFLEX */
		0x00f5: "XK_otilde",   /* U+00F5 LATIN SMALL LETTER O WITH TILDE */
		0x00f6: "XK_odiaeresis",   /* U+00F6 LATIN SMALL LETTER O WITH DIAERESIS */
		0x00f7: "XK_division",   /* U+00F7 DIVISION SIGN */
		0x00f8: "XK_oslash",   /* U+00F8 LATIN SMALL LETTER O WITH STROKE */
		0x00f8: "XK_ooblique",   /* U+00F8 LATIN SMALL LETTER O WITH STROKE */
		0x00f9: "XK_ugrave",   /* U+00F9 LATIN SMALL LETTER U WITH GRAVE */
		0x00fa: "XK_uacute",   /* U+00FA LATIN SMALL LETTER U WITH ACUTE */
		0x00fb: "XK_ucircumflex",   /* U+00FB LATIN SMALL LETTER U WITH CIRCUMFLEX */
		0x00fc: "XK_udiaeresis",   /* U+00FC LATIN SMALL LETTER U WITH DIAERESIS */
		0x00fd: "XK_yacute",   /* U+00FD LATIN SMALL LETTER Y WITH ACUTE */
		0x00fe: "XK_thorn",   /* U+00FE LATIN SMALL LETTER THORN */
		0x00ff: "XK_ydiaeresis",   /* U+00FF LATIN SMALL LETTER Y WITH DIAERESIS */


		/*
 * Latin 2
 * Byte 3 = 1
 */

		0x01a1: "XK_Aogonek",   /* U+0104 LATIN CAPITAL LETTER A WITH OGONEK */
		0x01a2: "XK_breve",   /* U+02D8 BREVE */
		0x01a3: "XK_Lstroke",   /* U+0141 LATIN CAPITAL LETTER L WITH STROKE */
		0x01a5: "XK_Lcaron",   /* U+013D LATIN CAPITAL LETTER L WITH CARON */
		0x01a6: "XK_Sacute",   /* U+015A LATIN CAPITAL LETTER S WITH ACUTE */
		0x01a9: "XK_Scaron",   /* U+0160 LATIN CAPITAL LETTER S WITH CARON */
		0x01aa: "XK_Scedilla",   /* U+015E LATIN CAPITAL LETTER S WITH CEDILLA */
		0x01ab: "XK_Tcaron",   /* U+0164 LATIN CAPITAL LETTER T WITH CARON */
		0x01ac: "XK_Zacute",   /* U+0179 LATIN CAPITAL LETTER Z WITH ACUTE */
		0x01ae: "XK_Zcaron",   /* U+017D LATIN CAPITAL LETTER Z WITH CARON */
		0x01af: "XK_Zabovedot",   /* U+017B LATIN CAPITAL LETTER Z WITH DOT ABOVE */
		0x01b1: "XK_aogonek",   /* U+0105 LATIN SMALL LETTER A WITH OGONEK */
		0x01b2: "XK_ogonek",   /* U+02DB OGONEK */
		0x01b3: "XK_lstroke",   /* U+0142 LATIN SMALL LETTER L WITH STROKE */
		0x01b5: "XK_lcaron",   /* U+013E LATIN SMALL LETTER L WITH CARON */
		0x01b6: "XK_sacute",   /* U+015B LATIN SMALL LETTER S WITH ACUTE */
		0x01b7: "XK_caron",   /* U+02C7 CARON */
		0x01b9: "XK_scaron",   /* U+0161 LATIN SMALL LETTER S WITH CARON */
		0x01ba: "XK_scedilla",   /* U+015F LATIN SMALL LETTER S WITH CEDILLA */
		0x01bb: "XK_tcaron",   /* U+0165 LATIN SMALL LETTER T WITH CARON */
		0x01bc: "XK_zacute",   /* U+017A LATIN SMALL LETTER Z WITH ACUTE */
		0x01bd: "XK_doubleacute",   /* U+02DD DOUBLE ACUTE ACCENT */
		0x01be: "XK_zcaron",   /* U+017E LATIN SMALL LETTER Z WITH CARON */
		0x01bf: "XK_zabovedot",   /* U+017C LATIN SMALL LETTER Z WITH DOT ABOVE */
		0x01c0: "XK_Racute",   /* U+0154 LATIN CAPITAL LETTER R WITH ACUTE */
		0x01c3: "XK_Abreve",   /* U+0102 LATIN CAPITAL LETTER A WITH BREVE */
		0x01c5: "XK_Lacute",   /* U+0139 LATIN CAPITAL LETTER L WITH ACUTE */
		0x01c6: "XK_Cacute",   /* U+0106 LATIN CAPITAL LETTER C WITH ACUTE */
		0x01c8: "XK_Ccaron",   /* U+010C LATIN CAPITAL LETTER C WITH CARON */
		0x01ca: "XK_Eogonek",   /* U+0118 LATIN CAPITAL LETTER E WITH OGONEK */
		0x01cc: "XK_Ecaron",   /* U+011A LATIN CAPITAL LETTER E WITH CARON */
		0x01cf: "XK_Dcaron",   /* U+010E LATIN CAPITAL LETTER D WITH CARON */
		0x01d0: "XK_Dstroke",   /* U+0110 LATIN CAPITAL LETTER D WITH STROKE */
		0x01d1: "XK_Nacute",   /* U+0143 LATIN CAPITAL LETTER N WITH ACUTE */
		0x01d2: "XK_Ncaron",   /* U+0147 LATIN CAPITAL LETTER N WITH CARON */
		0x01d5: "XK_Odoubleacute",   /* U+0150 LATIN CAPITAL LETTER O WITH DOUBLE ACUTE */
		0x01d8: "XK_Rcaron",   /* U+0158 LATIN CAPITAL LETTER R WITH CARON */
		0x01d9: "XK_Uring",   /* U+016E LATIN CAPITAL LETTER U WITH RING ABOVE */
		0x01db: "XK_Udoubleacute",   /* U+0170 LATIN CAPITAL LETTER U WITH DOUBLE ACUTE */
		0x01de: "XK_Tcedilla",   /* U+0162 LATIN CAPITAL LETTER T WITH CEDILLA */
		0x01e0: "XK_racute",   /* U+0155 LATIN SMALL LETTER R WITH ACUTE */
		0x01e3: "XK_abreve",   /* U+0103 LATIN SMALL LETTER A WITH BREVE */
		0x01e5: "XK_lacute",   /* U+013A LATIN SMALL LETTER L WITH ACUTE */
		0x01e6: "XK_cacute",   /* U+0107 LATIN SMALL LETTER C WITH ACUTE */
		0x01e8: "XK_ccaron",   /* U+010D LATIN SMALL LETTER C WITH CARON */
		0x01ea: "XK_eogonek",   /* U+0119 LATIN SMALL LETTER E WITH OGONEK */
		0x01ec: "XK_ecaron",   /* U+011B LATIN SMALL LETTER E WITH CARON */
		0x01ef: "XK_dcaron",   /* U+010F LATIN SMALL LETTER D WITH CARON */
		0x01f0: "XK_dstroke",   /* U+0111 LATIN SMALL LETTER D WITH STROKE */
		0x01f1: "XK_nacute",   /* U+0144 LATIN SMALL LETTER N WITH ACUTE */
		0x01f2: "XK_ncaron",   /* U+0148 LATIN SMALL LETTER N WITH CARON */
		0x01f5: "XK_odoubleacute",   /* U+0151 LATIN SMALL LETTER O WITH DOUBLE ACUTE */
		0x01f8: "XK_rcaron",   /* U+0159 LATIN SMALL LETTER R WITH CARON */
		0x01f9: "XK_uring",   /* U+016F LATIN SMALL LETTER U WITH RING ABOVE */
		0x01fb: "XK_udoubleacute",   /* U+0171 LATIN SMALL LETTER U WITH DOUBLE ACUTE */
		0x01fe: "XK_tcedilla",   /* U+0163 LATIN SMALL LETTER T WITH CEDILLA */
		0x01ff: "XK_abovedot",   /* U+02D9 DOT ABOVE */


		/*
 * Latin 3
 * Byte 3 = 2
 */

		0x02a1: "XK_Hstroke",   /* U+0126 LATIN CAPITAL LETTER H WITH STROKE */
		0x02a6: "XK_Hcircumflex",   /* U+0124 LATIN CAPITAL LETTER H WITH CIRCUMFLEX */
		0x02a9: "XK_Iabovedot",   /* U+0130 LATIN CAPITAL LETTER I WITH DOT ABOVE */
		0x02ab: "XK_Gbreve",   /* U+011E LATIN CAPITAL LETTER G WITH BREVE */
		0x02ac: "XK_Jcircumflex",   /* U+0134 LATIN CAPITAL LETTER J WITH CIRCUMFLEX */
		0x02b1: "XK_hstroke",   /* U+0127 LATIN SMALL LETTER H WITH STROKE */
		0x02b6: "XK_hcircumflex",   /* U+0125 LATIN SMALL LETTER H WITH CIRCUMFLEX */
		0x02b9: "XK_idotless",   /* U+0131 LATIN SMALL LETTER DOTLESS I */
		0x02bb: "XK_gbreve",   /* U+011F LATIN SMALL LETTER G WITH BREVE */
		0x02bc: "XK_jcircumflex",   /* U+0135 LATIN SMALL LETTER J WITH CIRCUMFLEX */
		0x02c5: "XK_Cabovedot",   /* U+010A LATIN CAPITAL LETTER C WITH DOT ABOVE */
		0x02c6: "XK_Ccircumflex",   /* U+0108 LATIN CAPITAL LETTER C WITH CIRCUMFLEX */
		0x02d5: "XK_Gabovedot",   /* U+0120 LATIN CAPITAL LETTER G WITH DOT ABOVE */
		0x02d8: "XK_Gcircumflex",   /* U+011C LATIN CAPITAL LETTER G WITH CIRCUMFLEX */
		0x02dd: "XK_Ubreve",   /* U+016C LATIN CAPITAL LETTER U WITH BREVE */
		0x02de: "XK_Scircumflex",   /* U+015C LATIN CAPITAL LETTER S WITH CIRCUMFLEX */
		0x02e5: "XK_cabovedot",   /* U+010B LATIN SMALL LETTER C WITH DOT ABOVE */
		0x02e6: "XK_ccircumflex",   /* U+0109 LATIN SMALL LETTER C WITH CIRCUMFLEX */
		0x02f5: "XK_gabovedot",   /* U+0121 LATIN SMALL LETTER G WITH DOT ABOVE */
		0x02f8: "XK_gcircumflex",   /* U+011D LATIN SMALL LETTER G WITH CIRCUMFLEX */
		0x02fd: "XK_ubreve",   /* U+016D LATIN SMALL LETTER U WITH BREVE */
		0x02fe: "XK_scircumflex",   /* U+015D LATIN SMALL LETTER S WITH CIRCUMFLEX */



		/*
 * Latin 4
 * Byte 3 = 3
 */

		0x03a2: "XK_kra",   /* U+0138 LATIN SMALL LETTER KRA */
		0x03a2: "XK_kappa",   /* deprecated */
		0x03a3: "XK_Rcedilla",   /* U+0156 LATIN CAPITAL LETTER R WITH CEDILLA */
		0x03a5: "XK_Itilde",   /* U+0128 LATIN CAPITAL LETTER I WITH TILDE */
		0x03a6: "XK_Lcedilla",   /* U+013B LATIN CAPITAL LETTER L WITH CEDILLA */
		0x03aa: "XK_Emacron",   /* U+0112 LATIN CAPITAL LETTER E WITH MACRON */
		0x03ab: "XK_Gcedilla",   /* U+0122 LATIN CAPITAL LETTER G WITH CEDILLA */
		0x03ac: "XK_Tslash",   /* U+0166 LATIN CAPITAL LETTER T WITH STROKE */
		0x03b3: "XK_rcedilla",   /* U+0157 LATIN SMALL LETTER R WITH CEDILLA */
		0x03b5: "XK_itilde",   /* U+0129 LATIN SMALL LETTER I WITH TILDE */
		0x03b6: "XK_lcedilla",   /* U+013C LATIN SMALL LETTER L WITH CEDILLA */
		0x03ba: "XK_emacron",   /* U+0113 LATIN SMALL LETTER E WITH MACRON */
		0x03bb: "XK_gcedilla",   /* U+0123 LATIN SMALL LETTER G WITH CEDILLA */
		0x03bc: "XK_tslash",   /* U+0167 LATIN SMALL LETTER T WITH STROKE */
		0x03bd: "XK_ENG",   /* U+014A LATIN CAPITAL LETTER ENG */
		0x03bf: "XK_eng",   /* U+014B LATIN SMALL LETTER ENG */
		0x03c0: "XK_Amacron",   /* U+0100 LATIN CAPITAL LETTER A WITH MACRON */
		0x03c7: "XK_Iogonek",   /* U+012E LATIN CAPITAL LETTER I WITH OGONEK */
		0x03cc: "XK_Eabovedot",   /* U+0116 LATIN CAPITAL LETTER E WITH DOT ABOVE */
		0x03cf: "XK_Imacron",   /* U+012A LATIN CAPITAL LETTER I WITH MACRON */
		0x03d1: "XK_Ncedilla",   /* U+0145 LATIN CAPITAL LETTER N WITH CEDILLA */
		0x03d2: "XK_Omacron",   /* U+014C LATIN CAPITAL LETTER O WITH MACRON */
		0x03d3: "XK_Kcedilla",   /* U+0136 LATIN CAPITAL LETTER K WITH CEDILLA */
		0x03d9: "XK_Uogonek",   /* U+0172 LATIN CAPITAL LETTER U WITH OGONEK */
		0x03dd: "XK_Utilde",   /* U+0168 LATIN CAPITAL LETTER U WITH TILDE */
		0x03de: "XK_Umacron",   /* U+016A LATIN CAPITAL LETTER U WITH MACRON */
		0x03e0: "XK_amacron",   /* U+0101 LATIN SMALL LETTER A WITH MACRON */
		0x03e7: "XK_iogonek",   /* U+012F LATIN SMALL LETTER I WITH OGONEK */
		0x03ec: "XK_eabovedot",   /* U+0117 LATIN SMALL LETTER E WITH DOT ABOVE */
		0x03ef: "XK_imacron",   /* U+012B LATIN SMALL LETTER I WITH MACRON */
		0x03f1: "XK_ncedilla",   /* U+0146 LATIN SMALL LETTER N WITH CEDILLA */
		0x03f2: "XK_omacron",   /* U+014D LATIN SMALL LETTER O WITH MACRON */
		0x03f3: "XK_kcedilla",   /* U+0137 LATIN SMALL LETTER K WITH CEDILLA */
		0x03f9: "XK_uogonek",   /* U+0173 LATIN SMALL LETTER U WITH OGONEK */
		0x03fd: "XK_utilde",   /* U+0169 LATIN SMALL LETTER U WITH TILDE */
		0x03fe: "XK_umacron",   /* U+016B LATIN SMALL LETTER U WITH MACRON */


		/*
 * Latin 8
 */
		0x1000174: "XK_Wcircumflex",   /* U+0174 LATIN CAPITAL LETTER W WITH CIRCUMFLEX */
		0x1000175: "XK_wcircumflex",   /* U+0175 LATIN SMALL LETTER W WITH CIRCUMFLEX */
		0x1000176: "XK_Ycircumflex",   /* U+0176 LATIN CAPITAL LETTER Y WITH CIRCUMFLEX */
		0x1000177: "XK_ycircumflex",   /* U+0177 LATIN SMALL LETTER Y WITH CIRCUMFLEX */
		0x1001e02: "XK_Babovedot",   /* U+1E02 LATIN CAPITAL LETTER B WITH DOT ABOVE */
		0x1001e03: "XK_babovedot",   /* U+1E03 LATIN SMALL LETTER B WITH DOT ABOVE */
		0x1001e0a: "XK_Dabovedot",   /* U+1E0A LATIN CAPITAL LETTER D WITH DOT ABOVE */
		0x1001e0b: "XK_dabovedot",   /* U+1E0B LATIN SMALL LETTER D WITH DOT ABOVE */
		0x1001e1e: "XK_Fabovedot",   /* U+1E1E LATIN CAPITAL LETTER F WITH DOT ABOVE */
		0x1001e1f: "XK_fabovedot",   /* U+1E1F LATIN SMALL LETTER F WITH DOT ABOVE */
		0x1001e40: "XK_Mabovedot",   /* U+1E40 LATIN CAPITAL LETTER M WITH DOT ABOVE */
		0x1001e41: "XK_mabovedot",   /* U+1E41 LATIN SMALL LETTER M WITH DOT ABOVE */
		0x1001e56: "XK_Pabovedot",   /* U+1E56 LATIN CAPITAL LETTER P WITH DOT ABOVE */
		0x1001e57: "XK_pabovedot",   /* U+1E57 LATIN SMALL LETTER P WITH DOT ABOVE */
		0x1001e60: "XK_Sabovedot",   /* U+1E60 LATIN CAPITAL LETTER S WITH DOT ABOVE */
		0x1001e61: "XK_sabovedot",   /* U+1E61 LATIN SMALL LETTER S WITH DOT ABOVE */
		0x1001e6a: "XK_Tabovedot",   /* U+1E6A LATIN CAPITAL LETTER T WITH DOT ABOVE */
		0x1001e6b: "XK_tabovedot",   /* U+1E6B LATIN SMALL LETTER T WITH DOT ABOVE */
		0x1001e80: "XK_Wgrave",   /* U+1E80 LATIN CAPITAL LETTER W WITH GRAVE */
		0x1001e81: "XK_wgrave",   /* U+1E81 LATIN SMALL LETTER W WITH GRAVE */
		0x1001e82: "XK_Wacute",   /* U+1E82 LATIN CAPITAL LETTER W WITH ACUTE */
		0x1001e83: "XK_wacute",   /* U+1E83 LATIN SMALL LETTER W WITH ACUTE */
		0x1001e84: "XK_Wdiaeresis",   /* U+1E84 LATIN CAPITAL LETTER W WITH DIAERESIS */
		0x1001e85: "XK_wdiaeresis",   /* U+1E85 LATIN SMALL LETTER W WITH DIAERESIS */
		0x1001ef2: "XK_Ygrave",   /* U+1EF2 LATIN CAPITAL LETTER Y WITH GRAVE */
		0x1001ef3: "XK_ygrave",   /* U+1EF3 LATIN SMALL LETTER Y WITH GRAVE */


		/*
 * Latin 9
 * Byte 3 = 0x13
 */

		0x13bc: "XK_OE",   /* U+0152 LATIN CAPITAL LIGATURE OE */
		0x13bd: "XK_oe",   /* U+0153 LATIN SMALL LIGATURE OE */
		0x13be: "XK_Ydiaeresis",   /* U+0178 LATIN CAPITAL LETTER Y WITH DIAERESIS */


		/*
 * Katakana
 * Byte 3 = 4
 */

		0x047e: "XK_overline",   /* U+203E OVERLINE */
		0x04a1: "XK_kana_fullstop",   /* U+3002 IDEOGRAPHIC FULL STOP */
		0x04a2: "XK_kana_openingbracket",   /* U+300C LEFT CORNER BRACKET */
		0x04a3: "XK_kana_closingbracket",   /* U+300D RIGHT CORNER BRACKET */
		0x04a4: "XK_kana_comma",   /* U+3001 IDEOGRAPHIC COMMA */
		0x04a5: "XK_kana_conjunctive",   /* U+30FB KATAKANA MIDDLE DOT */
		0x04a5: "XK_kana_middledot",   /* deprecated */
		0x04a6: "XK_kana_WO",   /* U+30F2 KATAKANA LETTER WO */
		0x04a7: "XK_kana_a",   /* U+30A1 KATAKANA LETTER SMALL A */
		0x04a8: "XK_kana_i",   /* U+30A3 KATAKANA LETTER SMALL I */
		0x04a9: "XK_kana_u",   /* U+30A5 KATAKANA LETTER SMALL U */
		0x04aa: "XK_kana_e",   /* U+30A7 KATAKANA LETTER SMALL E */
		0x04ab: "XK_kana_o",   /* U+30A9 KATAKANA LETTER SMALL O */
		0x04ac: "XK_kana_ya",   /* U+30E3 KATAKANA LETTER SMALL YA */
		0x04ad: "XK_kana_yu",   /* U+30E5 KATAKANA LETTER SMALL YU */
		0x04ae: "XK_kana_yo",   /* U+30E7 KATAKANA LETTER SMALL YO */
		0x04af: "XK_kana_tsu",   /* U+30C3 KATAKANA LETTER SMALL TU */
		0x04af: "XK_kana_tu",   /* deprecated */
		0x04b0: "XK_prolongedsound",   /* U+30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK */
		0x04b1: "XK_kana_A",   /* U+30A2 KATAKANA LETTER A */
		0x04b2: "XK_kana_I",   /* U+30A4 KATAKANA LETTER I */
		0x04b3: "XK_kana_U",   /* U+30A6 KATAKANA LETTER U */
		0x04b4: "XK_kana_E",   /* U+30A8 KATAKANA LETTER E */
		0x04b5: "XK_kana_O",   /* U+30AA KATAKANA LETTER O */
		0x04b6: "XK_kana_KA",   /* U+30AB KATAKANA LETTER KA */
		0x04b7: "XK_kana_KI",   /* U+30AD KATAKANA LETTER KI */
		0x04b8: "XK_kana_KU",   /* U+30AF KATAKANA LETTER KU */
		0x04b9: "XK_kana_KE",   /* U+30B1 KATAKANA LETTER KE */
		0x04ba: "XK_kana_KO",   /* U+30B3 KATAKANA LETTER KO */
		0x04bb: "XK_kana_SA",   /* U+30B5 KATAKANA LETTER SA */
		0x04bc: "XK_kana_SHI",   /* U+30B7 KATAKANA LETTER SI */
		0x04bd: "XK_kana_SU",   /* U+30B9 KATAKANA LETTER SU */
		0x04be: "XK_kana_SE",   /* U+30BB KATAKANA LETTER SE */
		0x04bf: "XK_kana_SO",   /* U+30BD KATAKANA LETTER SO */
		0x04c0: "XK_kana_TA",   /* U+30BF KATAKANA LETTER TA */
		0x04c1: "XK_kana_CHI",   /* U+30C1 KATAKANA LETTER TI */
		0x04c1: "XK_kana_TI",   /* deprecated */
		0x04c2: "XK_kana_TSU",   /* U+30C4 KATAKANA LETTER TU */
		0x04c2: "XK_kana_TU",   /* deprecated */
		0x04c3: "XK_kana_TE",   /* U+30C6 KATAKANA LETTER TE */
		0x04c4: "XK_kana_TO",   /* U+30C8 KATAKANA LETTER TO */
		0x04c5: "XK_kana_NA",   /* U+30CA KATAKANA LETTER NA */
		0x04c6: "XK_kana_NI",   /* U+30CB KATAKANA LETTER NI */
		0x04c7: "XK_kana_NU",   /* U+30CC KATAKANA LETTER NU */
		0x04c8: "XK_kana_NE",   /* U+30CD KATAKANA LETTER NE */
		0x04c9: "XK_kana_NO",   /* U+30CE KATAKANA LETTER NO */
		0x04ca: "XK_kana_HA",   /* U+30CF KATAKANA LETTER HA */
		0x04cb: "XK_kana_HI",   /* U+30D2 KATAKANA LETTER HI */
		0x04cc: "XK_kana_FU",   /* U+30D5 KATAKANA LETTER HU */
		0x04cc: "XK_kana_HU",   /* deprecated */
		0x04cd: "XK_kana_HE",   /* U+30D8 KATAKANA LETTER HE */
		0x04ce: "XK_kana_HO",   /* U+30DB KATAKANA LETTER HO */
		0x04cf: "XK_kana_MA",   /* U+30DE KATAKANA LETTER MA */
		0x04d0: "XK_kana_MI",   /* U+30DF KATAKANA LETTER MI */
		0x04d1: "XK_kana_MU",   /* U+30E0 KATAKANA LETTER MU */
		0x04d2: "XK_kana_ME",   /* U+30E1 KATAKANA LETTER ME */
		0x04d3: "XK_kana_MO",   /* U+30E2 KATAKANA LETTER MO */
		0x04d4: "XK_kana_YA",   /* U+30E4 KATAKANA LETTER YA */
		0x04d5: "XK_kana_YU",   /* U+30E6 KATAKANA LETTER YU */
		0x04d6: "XK_kana_YO",   /* U+30E8 KATAKANA LETTER YO */
		0x04d7: "XK_kana_RA",   /* U+30E9 KATAKANA LETTER RA */
		0x04d8: "XK_kana_RI",   /* U+30EA KATAKANA LETTER RI */
		0x04d9: "XK_kana_RU",   /* U+30EB KATAKANA LETTER RU */
		0x04da: "XK_kana_RE",   /* U+30EC KATAKANA LETTER RE */
		0x04db: "XK_kana_RO",   /* U+30ED KATAKANA LETTER RO */
		0x04dc: "XK_kana_WA",   /* U+30EF KATAKANA LETTER WA */
		0x04dd: "XK_kana_N",   /* U+30F3 KATAKANA LETTER N */
		0x04de: "XK_voicedsound",   /* U+309B KATAKANA-HIRAGANA VOICED SOUND MARK */
		0x04df: "XK_semivoicedsound",   /* U+309C KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK */
		0xff7e: "XK_kana_switch",   /* Alias for mode_switch */


		/*
 * Arabic
 * Byte 3 = 5
 */

		0x10006f0: "XK_Farsi_0",   /* U+06F0 EXTENDED ARABIC-INDIC DIGIT ZERO */
		0x10006f1: "XK_Farsi_1",   /* U+06F1 EXTENDED ARABIC-INDIC DIGIT ONE */
		0x10006f2: "XK_Farsi_2",   /* U+06F2 EXTENDED ARABIC-INDIC DIGIT TWO */
		0x10006f3: "XK_Farsi_3",   /* U+06F3 EXTENDED ARABIC-INDIC DIGIT THREE */
		0x10006f4: "XK_Farsi_4",   /* U+06F4 EXTENDED ARABIC-INDIC DIGIT FOUR */
		0x10006f5: "XK_Farsi_5",   /* U+06F5 EXTENDED ARABIC-INDIC DIGIT FIVE */
		0x10006f6: "XK_Farsi_6",   /* U+06F6 EXTENDED ARABIC-INDIC DIGIT SIX */
		0x10006f7: "XK_Farsi_7",   /* U+06F7 EXTENDED ARABIC-INDIC DIGIT SEVEN */
		0x10006f8: "XK_Farsi_8",   /* U+06F8 EXTENDED ARABIC-INDIC DIGIT EIGHT */
		0x10006f9: "XK_Farsi_9",   /* U+06F9 EXTENDED ARABIC-INDIC DIGIT NINE */
		0x100066a: "XK_Arabic_percent",   /* U+066A ARABIC PERCENT SIGN */
		0x1000670: "XK_Arabic_superscript_alef",   /* U+0670 ARABIC LETTER SUPERSCRIPT ALEF */
		0x1000679: "XK_Arabic_tteh",   /* U+0679 ARABIC LETTER TTEH */
		0x100067e: "XK_Arabic_peh",   /* U+067E ARABIC LETTER PEH */
		0x1000686: "XK_Arabic_tcheh",   /* U+0686 ARABIC LETTER TCHEH */
		0x1000688: "XK_Arabic_ddal",   /* U+0688 ARABIC LETTER DDAL */
		0x1000691: "XK_Arabic_rreh",   /* U+0691 ARABIC LETTER RREH */
		0x05ac: "XK_Arabic_comma",   /* U+060C ARABIC COMMA */
		0x10006d4: "XK_Arabic_fullstop",   /* U+06D4 ARABIC FULL STOP */
		0x1000660: "XK_Arabic_0",   /* U+0660 ARABIC-INDIC DIGIT ZERO */
		0x1000661: "XK_Arabic_1",   /* U+0661 ARABIC-INDIC DIGIT ONE */
		0x1000662: "XK_Arabic_2",   /* U+0662 ARABIC-INDIC DIGIT TWO */
		0x1000663: "XK_Arabic_3",   /* U+0663 ARABIC-INDIC DIGIT THREE */
		0x1000664: "XK_Arabic_4",   /* U+0664 ARABIC-INDIC DIGIT FOUR */
		0x1000665: "XK_Arabic_5",   /* U+0665 ARABIC-INDIC DIGIT FIVE */
		0x1000666: "XK_Arabic_6",   /* U+0666 ARABIC-INDIC DIGIT SIX */
		0x1000667: "XK_Arabic_7",   /* U+0667 ARABIC-INDIC DIGIT SEVEN */
		0x1000668: "XK_Arabic_8",   /* U+0668 ARABIC-INDIC DIGIT EIGHT */
		0x1000669: "XK_Arabic_9",   /* U+0669 ARABIC-INDIC DIGIT NINE */
		0x05bb: "XK_Arabic_semicolon",   /* U+061B ARABIC SEMICOLON */
		0x05bf: "XK_Arabic_question_mark",   /* U+061F ARABIC QUESTION MARK */
		0x05c1: "XK_Arabic_hamza",   /* U+0621 ARABIC LETTER HAMZA */
		0x05c2: "XK_Arabic_maddaonalef",   /* U+0622 ARABIC LETTER ALEF WITH MADDA ABOVE */
		0x05c3: "XK_Arabic_hamzaonalef",   /* U+0623 ARABIC LETTER ALEF WITH HAMZA ABOVE */
		0x05c4: "XK_Arabic_hamzaonwaw",   /* U+0624 ARABIC LETTER WAW WITH HAMZA ABOVE */
		0x05c5: "XK_Arabic_hamzaunderalef",   /* U+0625 ARABIC LETTER ALEF WITH HAMZA BELOW */
		0x05c6: "XK_Arabic_hamzaonyeh",   /* U+0626 ARABIC LETTER YEH WITH HAMZA ABOVE */
		0x05c7: "XK_Arabic_alef",   /* U+0627 ARABIC LETTER ALEF */
		0x05c8: "XK_Arabic_beh",   /* U+0628 ARABIC LETTER BEH */
		0x05c9: "XK_Arabic_tehmarbuta",   /* U+0629 ARABIC LETTER TEH MARBUTA */
		0x05ca: "XK_Arabic_teh",   /* U+062A ARABIC LETTER TEH */
		0x05cb: "XK_Arabic_theh",   /* U+062B ARABIC LETTER THEH */
		0x05cc: "XK_Arabic_jeem",   /* U+062C ARABIC LETTER JEEM */
		0x05cd: "XK_Arabic_hah",   /* U+062D ARABIC LETTER HAH */
		0x05ce: "XK_Arabic_khah",   /* U+062E ARABIC LETTER KHAH */
		0x05cf: "XK_Arabic_dal",   /* U+062F ARABIC LETTER DAL */
		0x05d0: "XK_Arabic_thal",   /* U+0630 ARABIC LETTER THAL */
		0x05d1: "XK_Arabic_ra",   /* U+0631 ARABIC LETTER REH */
		0x05d2: "XK_Arabic_zain",   /* U+0632 ARABIC LETTER ZAIN */
		0x05d3: "XK_Arabic_seen",   /* U+0633 ARABIC LETTER SEEN */
		0x05d4: "XK_Arabic_sheen",   /* U+0634 ARABIC LETTER SHEEN */
		0x05d5: "XK_Arabic_sad",   /* U+0635 ARABIC LETTER SAD */
		0x05d6: "XK_Arabic_dad",   /* U+0636 ARABIC LETTER DAD */
		0x05d7: "XK_Arabic_tah",   /* U+0637 ARABIC LETTER TAH */
		0x05d8: "XK_Arabic_zah",   /* U+0638 ARABIC LETTER ZAH */
		0x05d9: "XK_Arabic_ain",   /* U+0639 ARABIC LETTER AIN */
		0x05da: "XK_Arabic_ghain",   /* U+063A ARABIC LETTER GHAIN */
		0x05e0: "XK_Arabic_tatweel",   /* U+0640 ARABIC TATWEEL */
		0x05e1: "XK_Arabic_feh",   /* U+0641 ARABIC LETTER FEH */
		0x05e2: "XK_Arabic_qaf",   /* U+0642 ARABIC LETTER QAF */
		0x05e3: "XK_Arabic_kaf",   /* U+0643 ARABIC LETTER KAF */
		0x05e4: "XK_Arabic_lam",   /* U+0644 ARABIC LETTER LAM */
		0x05e5: "XK_Arabic_meem",   /* U+0645 ARABIC LETTER MEEM */
		0x05e6: "XK_Arabic_noon",   /* U+0646 ARABIC LETTER NOON */
		0x05e7: "XK_Arabic_ha",   /* U+0647 ARABIC LETTER HEH */
		0x05e7: "XK_Arabic_heh",   /* deprecated */
		0x05e8: "XK_Arabic_waw",   /* U+0648 ARABIC LETTER WAW */
		0x05e9: "XK_Arabic_alefmaksura",   /* U+0649 ARABIC LETTER ALEF MAKSURA */
		0x05ea: "XK_Arabic_yeh",   /* U+064A ARABIC LETTER YEH */
		0x05eb: "XK_Arabic_fathatan",   /* U+064B ARABIC FATHATAN */
		0x05ec: "XK_Arabic_dammatan",   /* U+064C ARABIC DAMMATAN */
		0x05ed: "XK_Arabic_kasratan",   /* U+064D ARABIC KASRATAN */
		0x05ee: "XK_Arabic_fatha",   /* U+064E ARABIC FATHA */
		0x05ef: "XK_Arabic_damma",   /* U+064F ARABIC DAMMA */
		0x05f0: "XK_Arabic_kasra",   /* U+0650 ARABIC KASRA */
		0x05f1: "XK_Arabic_shadda",   /* U+0651 ARABIC SHADDA */
		0x05f2: "XK_Arabic_sukun",   /* U+0652 ARABIC SUKUN */
		0x1000653: "XK_Arabic_madda_above",   /* U+0653 ARABIC MADDAH ABOVE */
		0x1000654: "XK_Arabic_hamza_above",   /* U+0654 ARABIC HAMZA ABOVE */
		0x1000655: "XK_Arabic_hamza_below",   /* U+0655 ARABIC HAMZA BELOW */
		0x1000698: "XK_Arabic_jeh",   /* U+0698 ARABIC LETTER JEH */
		0x10006a4: "XK_Arabic_veh",   /* U+06A4 ARABIC LETTER VEH */
		0x10006a9: "XK_Arabic_keheh",   /* U+06A9 ARABIC LETTER KEHEH */
		0x10006af: "XK_Arabic_gaf",   /* U+06AF ARABIC LETTER GAF */
		0x10006ba: "XK_Arabic_noon_ghunna",   /* U+06BA ARABIC LETTER NOON GHUNNA */
		0x10006be: "XK_Arabic_heh_doachashmee",   /* U+06BE ARABIC LETTER HEH DOACHASHMEE */
		0x10006cc: "XK_Farsi_yeh",   /* U+06CC ARABIC LETTER FARSI YEH */
		0x10006cc: "XK_Arabic_farsi_yeh",   /* U+06CC ARABIC LETTER FARSI YEH */
		0x10006d2: "XK_Arabic_yeh_baree",   /* U+06D2 ARABIC LETTER YEH BARREE */
		0x10006c1: "XK_Arabic_heh_goal",   /* U+06C1 ARABIC LETTER HEH GOAL */
		0xff7e: "XK_Arabic_switch",   /* Alias for mode_switch */


		/*
 * Cyrillic
 * Byte 3 = 6
 */
		0x1000492: "XK_Cyrillic_GHE_bar",   /* U+0492 CYRILLIC CAPITAL LETTER GHE WITH STROKE */
		0x1000493: "XK_Cyrillic_ghe_bar",   /* U+0493 CYRILLIC SMALL LETTER GHE WITH STROKE */
		0x1000496: "XK_Cyrillic_ZHE_descender",   /* U+0496 CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER */
		0x1000497: "XK_Cyrillic_zhe_descender",   /* U+0497 CYRILLIC SMALL LETTER ZHE WITH DESCENDER */
		0x100049a: "XK_Cyrillic_KA_descender",   /* U+049A CYRILLIC CAPITAL LETTER KA WITH DESCENDER */
		0x100049b: "XK_Cyrillic_ka_descender",   /* U+049B CYRILLIC SMALL LETTER KA WITH DESCENDER */
		0x100049c: "XK_Cyrillic_KA_vertstroke",   /* U+049C CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE */
		0x100049d: "XK_Cyrillic_ka_vertstroke",   /* U+049D CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE */
		0x10004a2: "XK_Cyrillic_EN_descender",   /* U+04A2 CYRILLIC CAPITAL LETTER EN WITH DESCENDER */
		0x10004a3: "XK_Cyrillic_en_descender",   /* U+04A3 CYRILLIC SMALL LETTER EN WITH DESCENDER */
		0x10004ae: "XK_Cyrillic_U_straight",   /* U+04AE CYRILLIC CAPITAL LETTER STRAIGHT U */
		0x10004af: "XK_Cyrillic_u_straight",   /* U+04AF CYRILLIC SMALL LETTER STRAIGHT U */
		0x10004b0: "XK_Cyrillic_U_straight_bar",   /* U+04B0 CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE */
		0x10004b1: "XK_Cyrillic_u_straight_bar",   /* U+04B1 CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE */
		0x10004b2: "XK_Cyrillic_HA_descender",   /* U+04B2 CYRILLIC CAPITAL LETTER HA WITH DESCENDER */
		0x10004b3: "XK_Cyrillic_ha_descender",   /* U+04B3 CYRILLIC SMALL LETTER HA WITH DESCENDER */
		0x10004b6: "XK_Cyrillic_CHE_descender",   /* U+04B6 CYRILLIC CAPITAL LETTER CHE WITH DESCENDER */
		0x10004b7: "XK_Cyrillic_che_descender",   /* U+04B7 CYRILLIC SMALL LETTER CHE WITH DESCENDER */
		0x10004b8: "XK_Cyrillic_CHE_vertstroke",   /* U+04B8 CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE */
		0x10004b9: "XK_Cyrillic_che_vertstroke",   /* U+04B9 CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE */
		0x10004ba: "XK_Cyrillic_SHHA",   /* U+04BA CYRILLIC CAPITAL LETTER SHHA */
		0x10004bb: "XK_Cyrillic_shha",   /* U+04BB CYRILLIC SMALL LETTER SHHA */

		0x10004d8: "XK_Cyrillic_SCHWA",   /* U+04D8 CYRILLIC CAPITAL LETTER SCHWA */
		0x10004d9: "XK_Cyrillic_schwa",   /* U+04D9 CYRILLIC SMALL LETTER SCHWA */
		0x10004e2: "XK_Cyrillic_I_macron",   /* U+04E2 CYRILLIC CAPITAL LETTER I WITH MACRON */
		0x10004e3: "XK_Cyrillic_i_macron",   /* U+04E3 CYRILLIC SMALL LETTER I WITH MACRON */
		0x10004e8: "XK_Cyrillic_O_bar",   /* U+04E8 CYRILLIC CAPITAL LETTER BARRED O */
		0x10004e9: "XK_Cyrillic_o_bar",   /* U+04E9 CYRILLIC SMALL LETTER BARRED O */
		0x10004ee: "XK_Cyrillic_U_macron",   /* U+04EE CYRILLIC CAPITAL LETTER U WITH MACRON */
		0x10004ef: "XK_Cyrillic_u_macron",   /* U+04EF CYRILLIC SMALL LETTER U WITH MACRON */

		0x06a1: "XK_Serbian_dje",   /* U+0452 CYRILLIC SMALL LETTER DJE */
		0x06a2: "XK_Macedonia_gje",   /* U+0453 CYRILLIC SMALL LETTER GJE */
		0x06a3: "XK_Cyrillic_io",   /* U+0451 CYRILLIC SMALL LETTER IO */
		0x06a4: "XK_Ukrainian_ie",   /* U+0454 CYRILLIC SMALL LETTER UKRAINIAN IE */
		0x06a4: "XK_Ukranian_je",   /* deprecated */
		0x06a5: "XK_Macedonia_dse",   /* U+0455 CYRILLIC SMALL LETTER DZE */
		0x06a6: "XK_Ukrainian_i",   /* U+0456 CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I */
		0x06a6: "XK_Ukranian_i",   /* deprecated */
		0x06a7: "XK_Ukrainian_yi",   /* U+0457 CYRILLIC SMALL LETTER YI */
		0x06a7: "XK_Ukranian_yi",   /* deprecated */
		0x06a8: "XK_Cyrillic_je",   /* U+0458 CYRILLIC SMALL LETTER JE */
		0x06a8: "XK_Serbian_je",   /* deprecated */
		0x06a9: "XK_Cyrillic_lje",   /* U+0459 CYRILLIC SMALL LETTER LJE */
		0x06a9: "XK_Serbian_lje",   /* deprecated */
		0x06aa: "XK_Cyrillic_nje",   /* U+045A CYRILLIC SMALL LETTER NJE */
		0x06aa: "XK_Serbian_nje",   /* deprecated */
		0x06ab: "XK_Serbian_tshe",   /* U+045B CYRILLIC SMALL LETTER TSHE */
		0x06ac: "XK_Macedonia_kje",   /* U+045C CYRILLIC SMALL LETTER KJE */
		0x06ad: "XK_Ukrainian_ghe_with_upturn",   /* U+0491 CYRILLIC SMALL LETTER GHE WITH UPTURN */
		0x06ae: "XK_Byelorussian_shortu",   /* U+045E CYRILLIC SMALL LETTER SHORT U */
		0x06af: "XK_Cyrillic_dzhe",   /* U+045F CYRILLIC SMALL LETTER DZHE */
		0x06af: "XK_Serbian_dze",   /* deprecated */
		0x06b0: "XK_numerosign",   /* U+2116 NUMERO SIGN */
		0x06b1: "XK_Serbian_DJE",   /* U+0402 CYRILLIC CAPITAL LETTER DJE */
		0x06b2: "XK_Macedonia_GJE",   /* U+0403 CYRILLIC CAPITAL LETTER GJE */
		0x06b3: "XK_Cyrillic_IO",   /* U+0401 CYRILLIC CAPITAL LETTER IO */
		0x06b4: "XK_Ukrainian_IE",   /* U+0404 CYRILLIC CAPITAL LETTER UKRAINIAN IE */
		0x06b4: "XK_Ukranian_JE",   /* deprecated */
		0x06b5: "XK_Macedonia_DSE",   /* U+0405 CYRILLIC CAPITAL LETTER DZE */
		0x06b6: "XK_Ukrainian_I",   /* U+0406 CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I */
		0x06b6: "XK_Ukranian_I",   /* deprecated */
		0x06b7: "XK_Ukrainian_YI",   /* U+0407 CYRILLIC CAPITAL LETTER YI */
		0x06b7: "XK_Ukranian_YI",   /* deprecated */
		0x06b8: "XK_Cyrillic_JE",   /* U+0408 CYRILLIC CAPITAL LETTER JE */
		0x06b8: "XK_Serbian_JE",   /* deprecated */
		0x06b9: "XK_Cyrillic_LJE",   /* U+0409 CYRILLIC CAPITAL LETTER LJE */
		0x06b9: "XK_Serbian_LJE",   /* deprecated */
		0x06ba: "XK_Cyrillic_NJE",   /* U+040A CYRILLIC CAPITAL LETTER NJE */
		0x06ba: "XK_Serbian_NJE",   /* deprecated */
		0x06bb: "XK_Serbian_TSHE",   /* U+040B CYRILLIC CAPITAL LETTER TSHE */
		0x06bc: "XK_Macedonia_KJE",   /* U+040C CYRILLIC CAPITAL LETTER KJE */
		0x06bd: "XK_Ukrainian_GHE_WITH_UPTURN",   /* U+0490 CYRILLIC CAPITAL LETTER GHE WITH UPTURN */
		0x06be: "XK_Byelorussian_SHORTU",   /* U+040E CYRILLIC CAPITAL LETTER SHORT U */
		0x06bf: "XK_Cyrillic_DZHE",   /* U+040F CYRILLIC CAPITAL LETTER DZHE */
		0x06bf: "XK_Serbian_DZE",   /* deprecated */
		0x06c0: "XK_Cyrillic_yu",   /* U+044E CYRILLIC SMALL LETTER YU */
		0x06c1: "XK_Cyrillic_a",   /* U+0430 CYRILLIC SMALL LETTER A */
		0x06c2: "XK_Cyrillic_be",   /* U+0431 CYRILLIC SMALL LETTER BE */
		0x06c3: "XK_Cyrillic_tse",   /* U+0446 CYRILLIC SMALL LETTER TSE */
		0x06c4: "XK_Cyrillic_de",   /* U+0434 CYRILLIC SMALL LETTER DE */
		0x06c5: "XK_Cyrillic_ie",   /* U+0435 CYRILLIC SMALL LETTER IE */
		0x06c6: "XK_Cyrillic_ef",   /* U+0444 CYRILLIC SMALL LETTER EF */
		0x06c7: "XK_Cyrillic_ghe",   /* U+0433 CYRILLIC SMALL LETTER GHE */
		0x06c8: "XK_Cyrillic_ha",   /* U+0445 CYRILLIC SMALL LETTER HA */
		0x06c9: "XK_Cyrillic_i",   /* U+0438 CYRILLIC SMALL LETTER I */
		0x06ca: "XK_Cyrillic_shorti",   /* U+0439 CYRILLIC SMALL LETTER SHORT I */
		0x06cb: "XK_Cyrillic_ka",   /* U+043A CYRILLIC SMALL LETTER KA */
		0x06cc: "XK_Cyrillic_el",   /* U+043B CYRILLIC SMALL LETTER EL */
		0x06cd: "XK_Cyrillic_em",   /* U+043C CYRILLIC SMALL LETTER EM */
		0x06ce: "XK_Cyrillic_en",   /* U+043D CYRILLIC SMALL LETTER EN */
		0x06cf: "XK_Cyrillic_o",   /* U+043E CYRILLIC SMALL LETTER O */
		0x06d0: "XK_Cyrillic_pe",   /* U+043F CYRILLIC SMALL LETTER PE */
		0x06d1: "XK_Cyrillic_ya",   /* U+044F CYRILLIC SMALL LETTER YA */
		0x06d2: "XK_Cyrillic_er",   /* U+0440 CYRILLIC SMALL LETTER ER */
		0x06d3: "XK_Cyrillic_es",   /* U+0441 CYRILLIC SMALL LETTER ES */
		0x06d4: "XK_Cyrillic_te",   /* U+0442 CYRILLIC SMALL LETTER TE */
		0x06d5: "XK_Cyrillic_u",   /* U+0443 CYRILLIC SMALL LETTER U */
		0x06d6: "XK_Cyrillic_zhe",   /* U+0436 CYRILLIC SMALL LETTER ZHE */
		0x06d7: "XK_Cyrillic_ve",   /* U+0432 CYRILLIC SMALL LETTER VE */
		0x06d8: "XK_Cyrillic_softsign",   /* U+044C CYRILLIC SMALL LETTER SOFT SIGN */
		0x06d9: "XK_Cyrillic_yeru",   /* U+044B CYRILLIC SMALL LETTER YERU */
		0x06da: "XK_Cyrillic_ze",   /* U+0437 CYRILLIC SMALL LETTER ZE */
		0x06db: "XK_Cyrillic_sha",   /* U+0448 CYRILLIC SMALL LETTER SHA */
		0x06dc: "XK_Cyrillic_e",   /* U+044D CYRILLIC SMALL LETTER E */
		0x06dd: "XK_Cyrillic_shcha",   /* U+0449 CYRILLIC SMALL LETTER SHCHA */
		0x06de: "XK_Cyrillic_che",   /* U+0447 CYRILLIC SMALL LETTER CHE */
		0x06df: "XK_Cyrillic_hardsign",   /* U+044A CYRILLIC SMALL LETTER HARD SIGN */
		0x06e0: "XK_Cyrillic_YU",   /* U+042E CYRILLIC CAPITAL LETTER YU */
		0x06e1: "XK_Cyrillic_A",   /* U+0410 CYRILLIC CAPITAL LETTER A */
		0x06e2: "XK_Cyrillic_BE",   /* U+0411 CYRILLIC CAPITAL LETTER BE */
		0x06e3: "XK_Cyrillic_TSE",   /* U+0426 CYRILLIC CAPITAL LETTER TSE */
		0x06e4: "XK_Cyrillic_DE",   /* U+0414 CYRILLIC CAPITAL LETTER DE */
		0x06e5: "XK_Cyrillic_IE",   /* U+0415 CYRILLIC CAPITAL LETTER IE */
		0x06e6: "XK_Cyrillic_EF",   /* U+0424 CYRILLIC CAPITAL LETTER EF */
		0x06e7: "XK_Cyrillic_GHE",   /* U+0413 CYRILLIC CAPITAL LETTER GHE */
		0x06e8: "XK_Cyrillic_HA",   /* U+0425 CYRILLIC CAPITAL LETTER HA */
		0x06e9: "XK_Cyrillic_I",   /* U+0418 CYRILLIC CAPITAL LETTER I */
		0x06ea: "XK_Cyrillic_SHORTI",   /* U+0419 CYRILLIC CAPITAL LETTER SHORT I */
		0x06eb: "XK_Cyrillic_KA",   /* U+041A CYRILLIC CAPITAL LETTER KA */
		0x06ec: "XK_Cyrillic_EL",   /* U+041B CYRILLIC CAPITAL LETTER EL */
		0x06ed: "XK_Cyrillic_EM",   /* U+041C CYRILLIC CAPITAL LETTER EM */
		0x06ee: "XK_Cyrillic_EN",   /* U+041D CYRILLIC CAPITAL LETTER EN */
		0x06ef: "XK_Cyrillic_O",   /* U+041E CYRILLIC CAPITAL LETTER O */
		0x06f0: "XK_Cyrillic_PE",   /* U+041F CYRILLIC CAPITAL LETTER PE */
		0x06f1: "XK_Cyrillic_YA",   /* U+042F CYRILLIC CAPITAL LETTER YA */
		0x06f2: "XK_Cyrillic_ER",   /* U+0420 CYRILLIC CAPITAL LETTER ER */
		0x06f3: "XK_Cyrillic_ES",   /* U+0421 CYRILLIC CAPITAL LETTER ES */
		0x06f4: "XK_Cyrillic_TE",   /* U+0422 CYRILLIC CAPITAL LETTER TE */
		0x06f5: "XK_Cyrillic_U",   /* U+0423 CYRILLIC CAPITAL LETTER U */
		0x06f6: "XK_Cyrillic_ZHE",   /* U+0416 CYRILLIC CAPITAL LETTER ZHE */
		0x06f7: "XK_Cyrillic_VE",   /* U+0412 CYRILLIC CAPITAL LETTER VE */
		0x06f8: "XK_Cyrillic_SOFTSIGN",   /* U+042C CYRILLIC CAPITAL LETTER SOFT SIGN */
		0x06f9: "XK_Cyrillic_YERU",   /* U+042B CYRILLIC CAPITAL LETTER YERU */
		0x06fa: "XK_Cyrillic_ZE",   /* U+0417 CYRILLIC CAPITAL LETTER ZE */
		0x06fb: "XK_Cyrillic_SHA",   /* U+0428 CYRILLIC CAPITAL LETTER SHA */
		0x06fc: "XK_Cyrillic_E",   /* U+042D CYRILLIC CAPITAL LETTER E */
		0x06fd: "XK_Cyrillic_SHCHA",   /* U+0429 CYRILLIC CAPITAL LETTER SHCHA */
		0x06fe: "XK_Cyrillic_CHE",   /* U+0427 CYRILLIC CAPITAL LETTER CHE */
		0x06ff: "XK_Cyrillic_HARDSIGN",   /* U+042A CYRILLIC CAPITAL LETTER HARD SIGN */


		/*
 * Greek
 * (based on an early draft of, and not quite identical to, ISO/IEC 8859-7)
 * Byte 3 = 7
 */

		0x07a1: "XK_Greek_ALPHAaccent",   /* U+0386 GREEK CAPITAL LETTER ALPHA WITH TONOS */
		0x07a2: "XK_Greek_EPSILONaccent",   /* U+0388 GREEK CAPITAL LETTER EPSILON WITH TONOS */
		0x07a3: "XK_Greek_ETAaccent",   /* U+0389 GREEK CAPITAL LETTER ETA WITH TONOS */
		0x07a4: "XK_Greek_IOTAaccent",   /* U+038A GREEK CAPITAL LETTER IOTA WITH TONOS */
		0x07a5: "XK_Greek_IOTAdieresis",   /* U+03AA GREEK CAPITAL LETTER IOTA WITH DIALYTIKA */
		0x07a5: "XK_Greek_IOTAdiaeresis",   /* old typo */
		0x07a7: "XK_Greek_OMICRONaccent",   /* U+038C GREEK CAPITAL LETTER OMICRON WITH TONOS */
		0x07a8: "XK_Greek_UPSILONaccent",   /* U+038E GREEK CAPITAL LETTER UPSILON WITH TONOS */
		0x07a9: "XK_Greek_UPSILONdieresis",   /* U+03AB GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA */
		0x07ab: "XK_Greek_OMEGAaccent",   /* U+038F GREEK CAPITAL LETTER OMEGA WITH TONOS */
		0x07ae: "XK_Greek_accentdieresis",   /* U+0385 GREEK DIALYTIKA TONOS */
		0x07af: "XK_Greek_horizbar",   /* U+2015 HORIZONTAL BAR */
		0x07b1: "XK_Greek_alphaaccent",   /* U+03AC GREEK SMALL LETTER ALPHA WITH TONOS */
		0x07b2: "XK_Greek_epsilonaccent",   /* U+03AD GREEK SMALL LETTER EPSILON WITH TONOS */
		0x07b3: "XK_Greek_etaaccent",   /* U+03AE GREEK SMALL LETTER ETA WITH TONOS */
		0x07b4: "XK_Greek_iotaaccent",   /* U+03AF GREEK SMALL LETTER IOTA WITH TONOS */
		0x07b5: "XK_Greek_iotadieresis",   /* U+03CA GREEK SMALL LETTER IOTA WITH DIALYTIKA */
		0x07b6: "XK_Greek_iotaaccentdieresis",   /* U+0390 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS */
		0x07b7: "XK_Greek_omicronaccent",   /* U+03CC GREEK SMALL LETTER OMICRON WITH TONOS */
		0x07b8: "XK_Greek_upsilonaccent",   /* U+03CD GREEK SMALL LETTER UPSILON WITH TONOS */
		0x07b9: "XK_Greek_upsilondieresis",   /* U+03CB GREEK SMALL LETTER UPSILON WITH DIALYTIKA */
		0x07ba: "XK_Greek_upsilonaccentdieresis",   /* U+03B0 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS */
		0x07bb: "XK_Greek_omegaaccent",   /* U+03CE GREEK SMALL LETTER OMEGA WITH TONOS */
		0x07c1: "XK_Greek_ALPHA",   /* U+0391 GREEK CAPITAL LETTER ALPHA */
		0x07c2: "XK_Greek_BETA",   /* U+0392 GREEK CAPITAL LETTER BETA */
		0x07c3: "XK_Greek_GAMMA",   /* U+0393 GREEK CAPITAL LETTER GAMMA */
		0x07c4: "XK_Greek_DELTA",   /* U+0394 GREEK CAPITAL LETTER DELTA */
		0x07c5: "XK_Greek_EPSILON",   /* U+0395 GREEK CAPITAL LETTER EPSILON */
		0x07c6: "XK_Greek_ZETA",   /* U+0396 GREEK CAPITAL LETTER ZETA */
		0x07c7: "XK_Greek_ETA",   /* U+0397 GREEK CAPITAL LETTER ETA */
		0x07c8: "XK_Greek_THETA",   /* U+0398 GREEK CAPITAL LETTER THETA */
		0x07c9: "XK_Greek_IOTA",   /* U+0399 GREEK CAPITAL LETTER IOTA */
		0x07ca: "XK_Greek_KAPPA",   /* U+039A GREEK CAPITAL LETTER KAPPA */
		0x07cb: "XK_Greek_LAMDA",   /* U+039B GREEK CAPITAL LETTER LAMDA */
		0x07cb: "XK_Greek_LAMBDA",   /* U+039B GREEK CAPITAL LETTER LAMDA */
		0x07cc: "XK_Greek_MU",   /* U+039C GREEK CAPITAL LETTER MU */
		0x07cd: "XK_Greek_NU",   /* U+039D GREEK CAPITAL LETTER NU */
		0x07ce: "XK_Greek_XI",   /* U+039E GREEK CAPITAL LETTER XI */
		0x07cf: "XK_Greek_OMICRON",   /* U+039F GREEK CAPITAL LETTER OMICRON */
		0x07d0: "XK_Greek_PI",   /* U+03A0 GREEK CAPITAL LETTER PI */
		0x07d1: "XK_Greek_RHO",   /* U+03A1 GREEK CAPITAL LETTER RHO */
		0x07d2: "XK_Greek_SIGMA",   /* U+03A3 GREEK CAPITAL LETTER SIGMA */
		0x07d4: "XK_Greek_TAU",   /* U+03A4 GREEK CAPITAL LETTER TAU */
		0x07d5: "XK_Greek_UPSILON",   /* U+03A5 GREEK CAPITAL LETTER UPSILON */
		0x07d6: "XK_Greek_PHI",   /* U+03A6 GREEK CAPITAL LETTER PHI */
		0x07d7: "XK_Greek_CHI",   /* U+03A7 GREEK CAPITAL LETTER CHI */
		0x07d8: "XK_Greek_PSI",   /* U+03A8 GREEK CAPITAL LETTER PSI */
		0x07d9: "XK_Greek_OMEGA",   /* U+03A9 GREEK CAPITAL LETTER OMEGA */
		0x07e1: "XK_Greek_alpha",   /* U+03B1 GREEK SMALL LETTER ALPHA */
		0x07e2: "XK_Greek_beta",   /* U+03B2 GREEK SMALL LETTER BETA */
		0x07e3: "XK_Greek_gamma",   /* U+03B3 GREEK SMALL LETTER GAMMA */
		0x07e4: "XK_Greek_delta",   /* U+03B4 GREEK SMALL LETTER DELTA */
		0x07e5: "XK_Greek_epsilon",   /* U+03B5 GREEK SMALL LETTER EPSILON */
		0x07e6: "XK_Greek_zeta",   /* U+03B6 GREEK SMALL LETTER ZETA */
		0x07e7: "XK_Greek_eta",   /* U+03B7 GREEK SMALL LETTER ETA */
		0x07e8: "XK_Greek_theta",   /* U+03B8 GREEK SMALL LETTER THETA */
		0x07e9: "XK_Greek_iota",   /* U+03B9 GREEK SMALL LETTER IOTA */
		0x07ea: "XK_Greek_kappa",   /* U+03BA GREEK SMALL LETTER KAPPA */
		0x07eb: "XK_Greek_lamda",   /* U+03BB GREEK SMALL LETTER LAMDA */
		0x07eb: "XK_Greek_lambda",   /* U+03BB GREEK SMALL LETTER LAMDA */
		0x07ec: "XK_Greek_mu",   /* U+03BC GREEK SMALL LETTER MU */
		0x07ed: "XK_Greek_nu",   /* U+03BD GREEK SMALL LETTER NU */
		0x07ee: "XK_Greek_xi",   /* U+03BE GREEK SMALL LETTER XI */
		0x07ef: "XK_Greek_omicron",   /* U+03BF GREEK SMALL LETTER OMICRON */
		0x07f0: "XK_Greek_pi",   /* U+03C0 GREEK SMALL LETTER PI */
		0x07f1: "XK_Greek_rho",   /* U+03C1 GREEK SMALL LETTER RHO */
		0x07f2: "XK_Greek_sigma",   /* U+03C3 GREEK SMALL LETTER SIGMA */
		0x07f3: "XK_Greek_finalsmallsigma",   /* U+03C2 GREEK SMALL LETTER FINAL SIGMA */
		0x07f4: "XK_Greek_tau",   /* U+03C4 GREEK SMALL LETTER TAU */
		0x07f5: "XK_Greek_upsilon",   /* U+03C5 GREEK SMALL LETTER UPSILON */
		0x07f6: "XK_Greek_phi",   /* U+03C6 GREEK SMALL LETTER PHI */
		0x07f7: "XK_Greek_chi",   /* U+03C7 GREEK SMALL LETTER CHI */
		0x07f8: "XK_Greek_psi",   /* U+03C8 GREEK SMALL LETTER PSI */
		0x07f9: "XK_Greek_omega",   /* U+03C9 GREEK SMALL LETTER OMEGA */
		0xff7e: "XK_Greek_switch",   /* Alias for mode_switch */


		/*
 * Technical
 * (from the DEC VT330/VT420 Technical Character Set, http://vt100.net/charsets/technical.html)
 * Byte 3 = 8
 */

		0x08a1: "XK_leftradical",   /* U+23B7 RADICAL SYMBOL BOTTOM */
		0x08a2: "XK_topleftradical",   /*(U+250C BOX DRAWINGS LIGHT DOWN AND RIGHT)*/
		0x08a3: "XK_horizconnector",   /*(U+2500 BOX DRAWINGS LIGHT HORIZONTAL)*/
		0x08a4: "XK_topintegral",   /* U+2320 TOP HALF INTEGRAL */
		0x08a5: "XK_botintegral",   /* U+2321 BOTTOM HALF INTEGRAL */
		0x08a6: "XK_vertconnector",   /*(U+2502 BOX DRAWINGS LIGHT VERTICAL)*/
		0x08a7: "XK_topleftsqbracket",   /* U+23A1 LEFT SQUARE BRACKET UPPER CORNER */
		0x08a8: "XK_botleftsqbracket",   /* U+23A3 LEFT SQUARE BRACKET LOWER CORNER */
		0x08a9: "XK_toprightsqbracket",   /* U+23A4 RIGHT SQUARE BRACKET UPPER CORNER */
		0x08aa: "XK_botrightsqbracket",   /* U+23A6 RIGHT SQUARE BRACKET LOWER CORNER */
		0x08ab: "XK_topleftparens",   /* U+239B LEFT PARENTHESIS UPPER HOOK */
		0x08ac: "XK_botleftparens",   /* U+239D LEFT PARENTHESIS LOWER HOOK */
		0x08ad: "XK_toprightparens",   /* U+239E RIGHT PARENTHESIS UPPER HOOK */
		0x08ae: "XK_botrightparens",   /* U+23A0 RIGHT PARENTHESIS LOWER HOOK */
		0x08af: "XK_leftmiddlecurlybrace",   /* U+23A8 LEFT CURLY BRACKET MIDDLE PIECE */
		0x08b0: "XK_rightmiddlecurlybrace",   /* U+23AC RIGHT CURLY BRACKET MIDDLE PIECE */
		0x08b1: "XK_topleftsummation", 
		0x08b2: "XK_botleftsummation", 
		0x08b3: "XK_topvertsummationconnector", 
		0x08b4: "XK_botvertsummationconnector", 
		0x08b5: "XK_toprightsummation", 
		0x08b6: "XK_botrightsummation", 
		0x08b7: "XK_rightmiddlesummation", 
		0x08bc: "XK_lessthanequal",   /* U+2264 LESS-THAN OR EQUAL TO */
		0x08bd: "XK_notequal",   /* U+2260 NOT EQUAL TO */
		0x08be: "XK_greaterthanequal",   /* U+2265 GREATER-THAN OR EQUAL TO */
		0x08bf: "XK_integral",   /* U+222B INTEGRAL */
		0x08c0: "XK_therefore",   /* U+2234 THEREFORE */
		0x08c1: "XK_variation",   /* U+221D PROPORTIONAL TO */
		0x08c2: "XK_infinity",   /* U+221E INFINITY */
		0x08c5: "XK_nabla",   /* U+2207 NABLA */
		0x08c8: "XK_approximate",   /* U+223C TILDE OPERATOR */
		0x08c9: "XK_similarequal",   /* U+2243 ASYMPTOTICALLY EQUAL TO */
		0x08cd: "XK_ifonlyif",   /* U+21D4 LEFT RIGHT DOUBLE ARROW */
		0x08ce: "XK_implies",   /* U+21D2 RIGHTWARDS DOUBLE ARROW */
		0x08cf: "XK_identical",   /* U+2261 IDENTICAL TO */
		0x08d6: "XK_radical",   /* U+221A SQUARE ROOT */
		0x08da: "XK_includedin",   /* U+2282 SUBSET OF */
		0x08db: "XK_includes",   /* U+2283 SUPERSET OF */
		0x08dc: "XK_intersection",   /* U+2229 INTERSECTION */
		0x08dd: "XK_union",   /* U+222A UNION */
		0x08de: "XK_logicaland",   /* U+2227 LOGICAL AND */
		0x08df: "XK_logicalor",   /* U+2228 LOGICAL OR */
		0x08ef: "XK_partialderivative",   /* U+2202 PARTIAL DIFFERENTIAL */
		0x08f6: "XK_function",   /* U+0192 LATIN SMALL LETTER F WITH HOOK */
		0x08fb: "XK_leftarrow",   /* U+2190 LEFTWARDS ARROW */
		0x08fc: "XK_uparrow",   /* U+2191 UPWARDS ARROW */
		0x08fd: "XK_rightarrow",   /* U+2192 RIGHTWARDS ARROW */
		0x08fe: "XK_downarrow",   /* U+2193 DOWNWARDS ARROW */


		/*
 * Special
 * (from the DEC VT100 Special Graphics Character Set)
 * Byte 3 = 9
 */

		0x0aa1: "XK_emspace",   /* U+2003 EM SPACE */
		0x0aa2: "XK_enspace",   /* U+2002 EN SPACE */
		0x0aa3: "XK_em3space",   /* U+2004 THREE-PER-EM SPACE */
		0x0aa4: "XK_em4space",   /* U+2005 FOUR-PER-EM SPACE */
		0x0aa5: "XK_digitspace",   /* U+2007 FIGURE SPACE */
		0x0aa6: "XK_punctspace",   /* U+2008 PUNCTUATION SPACE */
		0x0aa7: "XK_thinspace",   /* U+2009 THIN SPACE */
		0x0aa8: "XK_hairspace",   /* U+200A HAIR SPACE */
		0x0aa9: "XK_emdash",   /* U+2014 EM DASH */
		0x0aaa: "XK_endash",   /* U+2013 EN DASH */
		0x0aac: "XK_signifblank",   /*(U+2423 OPEN BOX)*/
		0x0aae: "XK_ellipsis",   /* U+2026 HORIZONTAL ELLIPSIS */
		0x0aaf: "XK_doubbaselinedot",   /* U+2025 TWO DOT LEADER */
		0x0ab0: "XK_onethird",   /* U+2153 VULGAR FRACTION ONE THIRD */
		0x0ab1: "XK_twothirds",   /* U+2154 VULGAR FRACTION TWO THIRDS */
		0x0ab2: "XK_onefifth",   /* U+2155 VULGAR FRACTION ONE FIFTH */
		0x0ab3: "XK_twofifths",   /* U+2156 VULGAR FRACTION TWO FIFTHS */
		0x0ab4: "XK_threefifths",   /* U+2157 VULGAR FRACTION THREE FIFTHS */
		0x0ab5: "XK_fourfifths",   /* U+2158 VULGAR FRACTION FOUR FIFTHS */
		0x0ab6: "XK_onesixth",   /* U+2159 VULGAR FRACTION ONE SIXTH */
		0x0ab7: "XK_fivesixths",   /* U+215A VULGAR FRACTION FIVE SIXTHS */
		0x0ab8: "XK_careof",   /* U+2105 CARE OF */
		0x0abb: "XK_figdash",   /* U+2012 FIGURE DASH */
		0x0abc: "XK_leftanglebracket",   /*(U+27E8 MATHEMATICAL LEFT ANGLE BRACKET)*/
		0x0abd: "XK_decimalpoint",   /*(U+002E FULL STOP)*/
		0x0abe: "XK_rightanglebracket",   /*(U+27E9 MATHEMATICAL RIGHT ANGLE BRACKET)*/
		0x0abf: "XK_marker", 
		0x0ac3: "XK_oneeighth",   /* U+215B VULGAR FRACTION ONE EIGHTH */
		0x0ac4: "XK_threeeighths",   /* U+215C VULGAR FRACTION THREE EIGHTHS */
		0x0ac5: "XK_fiveeighths",   /* U+215D VULGAR FRACTION FIVE EIGHTHS */
		0x0ac6: "XK_seveneighths",   /* U+215E VULGAR FRACTION SEVEN EIGHTHS */
		0x0ac9: "XK_trademark",   /* U+2122 TRADE MARK SIGN */
		0x0aca: "XK_signaturemark",   /*(U+2613 SALTIRE)*/
		0x0acb: "XK_trademarkincircle", 
		0x0acc: "XK_leftopentriangle",   /*(U+25C1 WHITE LEFT-POINTING TRIANGLE)*/
		0x0acd: "XK_rightopentriangle",   /*(U+25B7 WHITE RIGHT-POINTING TRIANGLE)*/
		0x0ace: "XK_emopencircle",   /*(U+25CB WHITE CIRCLE)*/
		0x0acf: "XK_emopenrectangle",   /*(U+25AF WHITE VERTICAL RECTANGLE)*/
		0x0ad0: "XK_leftsinglequotemark",   /* U+2018 LEFT SINGLE QUOTATION MARK */
		0x0ad1: "XK_rightsinglequotemark",   /* U+2019 RIGHT SINGLE QUOTATION MARK */
		0x0ad2: "XK_leftdoublequotemark",   /* U+201C LEFT DOUBLE QUOTATION MARK */
		0x0ad3: "XK_rightdoublequotemark",   /* U+201D RIGHT DOUBLE QUOTATION MARK */
		0x0ad4: "XK_prescription",   /* U+211E PRESCRIPTION TAKE */
		0x0ad5: "XK_permille",   /* U+2030 PER MILLE SIGN */
		0x0ad6: "XK_minutes",   /* U+2032 PRIME */
		0x0ad7: "XK_seconds",   /* U+2033 DOUBLE PRIME */
		0x0ad9: "XK_latincross",   /* U+271D LATIN CROSS */
		0x0ada: "XK_hexagram", 
		0x0adb: "XK_filledrectbullet",   /*(U+25AC BLACK RECTANGLE)*/
		0x0adc: "XK_filledlefttribullet",   /*(U+25C0 BLACK LEFT-POINTING TRIANGLE)*/
		0x0add: "XK_filledrighttribullet",   /*(U+25B6 BLACK RIGHT-POINTING TRIANGLE)*/
		0x0ade: "XK_emfilledcircle",   /*(U+25CF BLACK CIRCLE)*/
		0x0adf: "XK_emfilledrect",   /*(U+25AE BLACK VERTICAL RECTANGLE)*/
		0x0ae0: "XK_enopencircbullet",   /*(U+25E6 WHITE BULLET)*/
		0x0ae1: "XK_enopensquarebullet",   /*(U+25AB WHITE SMALL SQUARE)*/
		0x0ae2: "XK_openrectbullet",   /*(U+25AD WHITE RECTANGLE)*/
		0x0ae3: "XK_opentribulletup",   /*(U+25B3 WHITE UP-POINTING TRIANGLE)*/
		0x0ae4: "XK_opentribulletdown",   /*(U+25BD WHITE DOWN-POINTING TRIANGLE)*/
		0x0ae5: "XK_openstar",   /*(U+2606 WHITE STAR)*/
		0x0ae6: "XK_enfilledcircbullet",   /*(U+2022 BULLET)*/
		0x0ae7: "XK_enfilledsqbullet",   /*(U+25AA BLACK SMALL SQUARE)*/
		0x0ae8: "XK_filledtribulletup",   /*(U+25B2 BLACK UP-POINTING TRIANGLE)*/
		0x0ae9: "XK_filledtribulletdown",   /*(U+25BC BLACK DOWN-POINTING TRIANGLE)*/
		0x0aea: "XK_leftpointer",   /*(U+261C WHITE LEFT POINTING INDEX)*/
		0x0aeb: "XK_rightpointer",   /*(U+261E WHITE RIGHT POINTING INDEX)*/
		0x0aec: "XK_club",   /* U+2663 BLACK CLUB SUIT */
		0x0aed: "XK_diamond",   /* U+2666 BLACK DIAMOND SUIT */
		0x0aee: "XK_heart",   /* U+2665 BLACK HEART SUIT */
		0x0af0: "XK_maltesecross",   /* U+2720 MALTESE CROSS */
		0x0af1: "XK_dagger",   /* U+2020 DAGGER */
		0x0af2: "XK_doubledagger",   /* U+2021 DOUBLE DAGGER */
		0x0af3: "XK_checkmark",   /* U+2713 CHECK MARK */
		0x0af4: "XK_ballotcross",   /* U+2717 BALLOT X */
		0x0af5: "XK_musicalsharp",   /* U+266F MUSIC SHARP SIGN */
		0x0af6: "XK_musicalflat",   /* U+266D MUSIC FLAT SIGN */
		0x0af7: "XK_malesymbol",   /* U+2642 MALE SIGN */
		0x0af8: "XK_femalesymbol",   /* U+2640 FEMALE SIGN */
		0x0af9: "XK_telephone",   /* U+260E BLACK TELEPHONE */
		0x0afa: "XK_telephonerecorder",   /* U+2315 TELEPHONE RECORDER */
		0x0afb: "XK_phonographcopyright",   /* U+2117 SOUND RECORDING COPYRIGHT */
		0x0afc: "XK_caret",   /* U+2038 CARET */
		0x0afd: "XK_singlelowquotemark",   /* U+201A SINGLE LOW-9 QUOTATION MARK */
		0x0afe: "XK_doublelowquotemark",   /* U+201E DOUBLE LOW-9 QUOTATION MARK */
		0x0aff: "XK_cursor", 


		/*
 * APL
 * Byte 3 = 0x0b
 */

		0x0ba3: "XK_leftcaret",   /*(U+003C LESS-THAN SIGN)*/
		0x0ba6: "XK_rightcaret",   /*(U+003E GREATER-THAN SIGN)*/
		0x0ba8: "XK_downcaret",   /*(U+2228 LOGICAL OR)*/
		0x0ba9: "XK_upcaret",   /*(U+2227 LOGICAL AND)*/
		0x0bc0: "XK_overbar",   /*(U+00AF MACRON)*/
		0x0bc2: "XK_downtack",   /* U+22A4 DOWN TACK */
		0x0bc3: "XK_upshoe",   /*(U+2229 INTERSECTION)*/
		0x0bc4: "XK_downstile",   /* U+230A LEFT FLOOR */
		0x0bc6: "XK_underbar",   /*(U+005F LOW LINE)*/
		0x0bca: "XK_jot",   /* U+2218 RING OPERATOR */
		0x0bcc: "XK_quad",   /* U+2395 APL FUNCTIONAL SYMBOL QUAD */
		0x0bce: "XK_uptack",   /* U+22A5 UP TACK */
		0x0bcf: "XK_circle",   /* U+25CB WHITE CIRCLE */
		0x0bd3: "XK_upstile",   /* U+2308 LEFT CEILING */
		0x0bd6: "XK_downshoe",   /*(U+222A UNION)*/
		0x0bd8: "XK_rightshoe",   /*(U+2283 SUPERSET OF)*/
		0x0bda: "XK_leftshoe",   /*(U+2282 SUBSET OF)*/
		0x0bdc: "XK_lefttack",   /* U+22A3 LEFT TACK */
		0x0bfc: "XK_righttack",   /* U+22A2 RIGHT TACK */


		/*
 * Hebrew
 * Byte 3 = 0x0c
 */

		0x0cdf: "XK_hebrew_doublelowline",   /* U+2017 DOUBLE LOW LINE */
		0x0ce0: "XK_hebrew_aleph",   /* U+05D0 HEBREW LETTER ALEF */
		0x0ce1: "XK_hebrew_bet",   /* U+05D1 HEBREW LETTER BET */
		0x0ce1: "XK_hebrew_beth",   /* deprecated */
		0x0ce2: "XK_hebrew_gimel",   /* U+05D2 HEBREW LETTER GIMEL */
		0x0ce2: "XK_hebrew_gimmel",   /* deprecated */
		0x0ce3: "XK_hebrew_dalet",   /* U+05D3 HEBREW LETTER DALET */
		0x0ce3: "XK_hebrew_daleth",   /* deprecated */
		0x0ce4: "XK_hebrew_he",   /* U+05D4 HEBREW LETTER HE */
		0x0ce5: "XK_hebrew_waw",   /* U+05D5 HEBREW LETTER VAV */
		0x0ce6: "XK_hebrew_zain",   /* U+05D6 HEBREW LETTER ZAYIN */
		0x0ce6: "XK_hebrew_zayin",   /* deprecated */
		0x0ce7: "XK_hebrew_chet",   /* U+05D7 HEBREW LETTER HET */
		0x0ce7: "XK_hebrew_het",   /* deprecated */
		0x0ce8: "XK_hebrew_tet",   /* U+05D8 HEBREW LETTER TET */
		0x0ce8: "XK_hebrew_teth",   /* deprecated */
		0x0ce9: "XK_hebrew_yod",   /* U+05D9 HEBREW LETTER YOD */
		0x0cea: "XK_hebrew_finalkaph",   /* U+05DA HEBREW LETTER FINAL KAF */
		0x0ceb: "XK_hebrew_kaph",   /* U+05DB HEBREW LETTER KAF */
		0x0cec: "XK_hebrew_lamed",   /* U+05DC HEBREW LETTER LAMED */
		0x0ced: "XK_hebrew_finalmem",   /* U+05DD HEBREW LETTER FINAL MEM */
		0x0cee: "XK_hebrew_mem",   /* U+05DE HEBREW LETTER MEM */
		0x0cef: "XK_hebrew_finalnun",   /* U+05DF HEBREW LETTER FINAL NUN */
		0x0cf0: "XK_hebrew_nun",   /* U+05E0 HEBREW LETTER NUN */
		0x0cf1: "XK_hebrew_samech",   /* U+05E1 HEBREW LETTER SAMEKH */
		0x0cf1: "XK_hebrew_samekh",   /* deprecated */
		0x0cf2: "XK_hebrew_ayin",   /* U+05E2 HEBREW LETTER AYIN */
		0x0cf3: "XK_hebrew_finalpe",   /* U+05E3 HEBREW LETTER FINAL PE */
		0x0cf4: "XK_hebrew_pe",   /* U+05E4 HEBREW LETTER PE */
		0x0cf5: "XK_hebrew_finalzade",   /* U+05E5 HEBREW LETTER FINAL TSADI */
		0x0cf5: "XK_hebrew_finalzadi",   /* deprecated */
		0x0cf6: "XK_hebrew_zade",   /* U+05E6 HEBREW LETTER TSADI */
		0x0cf6: "XK_hebrew_zadi",   /* deprecated */
		0x0cf7: "XK_hebrew_qoph",   /* U+05E7 HEBREW LETTER QOF */
		0x0cf7: "XK_hebrew_kuf",   /* deprecated */
		0x0cf8: "XK_hebrew_resh",   /* U+05E8 HEBREW LETTER RESH */
		0x0cf9: "XK_hebrew_shin",   /* U+05E9 HEBREW LETTER SHIN */
		0x0cfa: "XK_hebrew_taw",   /* U+05EA HEBREW LETTER TAV */
		0x0cfa: "XK_hebrew_taf",   /* deprecated */
		0xff7e: "XK_Hebrew_switch",   /* Alias for mode_switch */


		/*
 * Thai
 * Byte 3 = 0x0d
 */

		0x0da1: "XK_Thai_kokai",   /* U+0E01 THAI CHARACTER KO KAI */
		0x0da2: "XK_Thai_khokhai",   /* U+0E02 THAI CHARACTER KHO KHAI */
		0x0da3: "XK_Thai_khokhuat",   /* U+0E03 THAI CHARACTER KHO KHUAT */
		0x0da4: "XK_Thai_khokhwai",   /* U+0E04 THAI CHARACTER KHO KHWAI */
		0x0da5: "XK_Thai_khokhon",   /* U+0E05 THAI CHARACTER KHO KHON */
		0x0da6: "XK_Thai_khorakhang",   /* U+0E06 THAI CHARACTER KHO RAKHANG */
		0x0da7: "XK_Thai_ngongu",   /* U+0E07 THAI CHARACTER NGO NGU */
		0x0da8: "XK_Thai_chochan",   /* U+0E08 THAI CHARACTER CHO CHAN */
		0x0da9: "XK_Thai_choching",   /* U+0E09 THAI CHARACTER CHO CHING */
		0x0daa: "XK_Thai_chochang",   /* U+0E0A THAI CHARACTER CHO CHANG */
		0x0dab: "XK_Thai_soso",   /* U+0E0B THAI CHARACTER SO SO */
		0x0dac: "XK_Thai_chochoe",   /* U+0E0C THAI CHARACTER CHO CHOE */
		0x0dad: "XK_Thai_yoying",   /* U+0E0D THAI CHARACTER YO YING */
		0x0dae: "XK_Thai_dochada",   /* U+0E0E THAI CHARACTER DO CHADA */
		0x0daf: "XK_Thai_topatak",   /* U+0E0F THAI CHARACTER TO PATAK */
		0x0db0: "XK_Thai_thothan",   /* U+0E10 THAI CHARACTER THO THAN */
		0x0db1: "XK_Thai_thonangmontho",   /* U+0E11 THAI CHARACTER THO NANGMONTHO */
		0x0db2: "XK_Thai_thophuthao",   /* U+0E12 THAI CHARACTER THO PHUTHAO */
		0x0db3: "XK_Thai_nonen",   /* U+0E13 THAI CHARACTER NO NEN */
		0x0db4: "XK_Thai_dodek",   /* U+0E14 THAI CHARACTER DO DEK */
		0x0db5: "XK_Thai_totao",   /* U+0E15 THAI CHARACTER TO TAO */
		0x0db6: "XK_Thai_thothung",   /* U+0E16 THAI CHARACTER THO THUNG */
		0x0db7: "XK_Thai_thothahan",   /* U+0E17 THAI CHARACTER THO THAHAN */
		0x0db8: "XK_Thai_thothong",   /* U+0E18 THAI CHARACTER THO THONG */
		0x0db9: "XK_Thai_nonu",   /* U+0E19 THAI CHARACTER NO NU */
		0x0dba: "XK_Thai_bobaimai",   /* U+0E1A THAI CHARACTER BO BAIMAI */
		0x0dbb: "XK_Thai_popla",   /* U+0E1B THAI CHARACTER PO PLA */
		0x0dbc: "XK_Thai_phophung",   /* U+0E1C THAI CHARACTER PHO PHUNG */
		0x0dbd: "XK_Thai_fofa",   /* U+0E1D THAI CHARACTER FO FA */
		0x0dbe: "XK_Thai_phophan",   /* U+0E1E THAI CHARACTER PHO PHAN */
		0x0dbf: "XK_Thai_fofan",   /* U+0E1F THAI CHARACTER FO FAN */
		0x0dc0: "XK_Thai_phosamphao",   /* U+0E20 THAI CHARACTER PHO SAMPHAO */
		0x0dc1: "XK_Thai_moma",   /* U+0E21 THAI CHARACTER MO MA */
		0x0dc2: "XK_Thai_yoyak",   /* U+0E22 THAI CHARACTER YO YAK */
		0x0dc3: "XK_Thai_rorua",   /* U+0E23 THAI CHARACTER RO RUA */
		0x0dc4: "XK_Thai_ru",   /* U+0E24 THAI CHARACTER RU */
		0x0dc5: "XK_Thai_loling",   /* U+0E25 THAI CHARACTER LO LING */
		0x0dc6: "XK_Thai_lu",   /* U+0E26 THAI CHARACTER LU */
		0x0dc7: "XK_Thai_wowaen",   /* U+0E27 THAI CHARACTER WO WAEN */
		0x0dc8: "XK_Thai_sosala",   /* U+0E28 THAI CHARACTER SO SALA */
		0x0dc9: "XK_Thai_sorusi",   /* U+0E29 THAI CHARACTER SO RUSI */
		0x0dca: "XK_Thai_sosua",   /* U+0E2A THAI CHARACTER SO SUA */
		0x0dcb: "XK_Thai_hohip",   /* U+0E2B THAI CHARACTER HO HIP */
		0x0dcc: "XK_Thai_lochula",   /* U+0E2C THAI CHARACTER LO CHULA */
		0x0dcd: "XK_Thai_oang",   /* U+0E2D THAI CHARACTER O ANG */
		0x0dce: "XK_Thai_honokhuk",   /* U+0E2E THAI CHARACTER HO NOKHUK */
		0x0dcf: "XK_Thai_paiyannoi",   /* U+0E2F THAI CHARACTER PAIYANNOI */
		0x0dd0: "XK_Thai_saraa",   /* U+0E30 THAI CHARACTER SARA A */
		0x0dd1: "XK_Thai_maihanakat",   /* U+0E31 THAI CHARACTER MAI HAN-AKAT */
		0x0dd2: "XK_Thai_saraaa",   /* U+0E32 THAI CHARACTER SARA AA */
		0x0dd3: "XK_Thai_saraam",   /* U+0E33 THAI CHARACTER SARA AM */
		0x0dd4: "XK_Thai_sarai",   /* U+0E34 THAI CHARACTER SARA I */
		0x0dd5: "XK_Thai_saraii",   /* U+0E35 THAI CHARACTER SARA II */
		0x0dd6: "XK_Thai_saraue",   /* U+0E36 THAI CHARACTER SARA UE */
		0x0dd7: "XK_Thai_sarauee",   /* U+0E37 THAI CHARACTER SARA UEE */
		0x0dd8: "XK_Thai_sarau",   /* U+0E38 THAI CHARACTER SARA U */
		0x0dd9: "XK_Thai_sarauu",   /* U+0E39 THAI CHARACTER SARA UU */
		0x0dda: "XK_Thai_phinthu",   /* U+0E3A THAI CHARACTER PHINTHU */
		0x0dde: "XK_Thai_maihanakat_maitho", 
		0x0ddf: "XK_Thai_baht",   /* U+0E3F THAI CURRENCY SYMBOL BAHT */
		0x0de0: "XK_Thai_sarae",   /* U+0E40 THAI CHARACTER SARA E */
		0x0de1: "XK_Thai_saraae",   /* U+0E41 THAI CHARACTER SARA AE */
		0x0de2: "XK_Thai_sarao",   /* U+0E42 THAI CHARACTER SARA O */
		0x0de3: "XK_Thai_saraaimaimuan",   /* U+0E43 THAI CHARACTER SARA AI MAIMUAN */
		0x0de4: "XK_Thai_saraaimaimalai",   /* U+0E44 THAI CHARACTER SARA AI MAIMALAI */
		0x0de5: "XK_Thai_lakkhangyao",   /* U+0E45 THAI CHARACTER LAKKHANGYAO */
		0x0de6: "XK_Thai_maiyamok",   /* U+0E46 THAI CHARACTER MAIYAMOK */
		0x0de7: "XK_Thai_maitaikhu",   /* U+0E47 THAI CHARACTER MAITAIKHU */
		0x0de8: "XK_Thai_maiek",   /* U+0E48 THAI CHARACTER MAI EK */
		0x0de9: "XK_Thai_maitho",   /* U+0E49 THAI CHARACTER MAI THO */
		0x0dea: "XK_Thai_maitri",   /* U+0E4A THAI CHARACTER MAI TRI */
		0x0deb: "XK_Thai_maichattawa",   /* U+0E4B THAI CHARACTER MAI CHATTAWA */
		0x0dec: "XK_Thai_thanthakhat",   /* U+0E4C THAI CHARACTER THANTHAKHAT */
		0x0ded: "XK_Thai_nikhahit",   /* U+0E4D THAI CHARACTER NIKHAHIT */
		0x0df0: "XK_Thai_leksun",   /* U+0E50 THAI DIGIT ZERO */
		0x0df1: "XK_Thai_leknung",   /* U+0E51 THAI DIGIT ONE */
		0x0df2: "XK_Thai_leksong",   /* U+0E52 THAI DIGIT TWO */
		0x0df3: "XK_Thai_leksam",   /* U+0E53 THAI DIGIT THREE */
		0x0df4: "XK_Thai_leksi",   /* U+0E54 THAI DIGIT FOUR */
		0x0df5: "XK_Thai_lekha",   /* U+0E55 THAI DIGIT FIVE */
		0x0df6: "XK_Thai_lekhok",   /* U+0E56 THAI DIGIT SIX */
		0x0df7: "XK_Thai_lekchet",   /* U+0E57 THAI DIGIT SEVEN */
		0x0df8: "XK_Thai_lekpaet",   /* U+0E58 THAI DIGIT EIGHT */
		0x0df9: "XK_Thai_lekkao",   /* U+0E59 THAI DIGIT NINE */


		/*
 * Korean
 * Byte 3 = 0x0e
 */


		0xff31: "XK_Hangul",   /* Hangul start/stop(toggle) */
		0xff32: "XK_Hangul_Start",   /* Hangul start */
		0xff33: "XK_Hangul_End",   /* Hangul end, English start */
		0xff34: "XK_Hangul_Hanja",   /* Start Hangul->Hanja Conversion */
		0xff35: "XK_Hangul_Jamo",   /* Hangul Jamo mode */
		0xff36: "XK_Hangul_Romaja",   /* Hangul Romaja mode */
		0xff37: "XK_Hangul_Codeinput",   /* Hangul code input mode */
		0xff38: "XK_Hangul_Jeonja",   /* Jeonja mode */
		0xff39: "XK_Hangul_Banja",   /* Banja mode */
		0xff3a: "XK_Hangul_PreHanja",   /* Pre Hanja conversion */
		0xff3b: "XK_Hangul_PostHanja",   /* Post Hanja conversion */
		0xff3c: "XK_Hangul_SingleCandidate",   /* Single candidate */
		0xff3d: "XK_Hangul_MultipleCandidate",   /* Multiple candidate */
		0xff3e: "XK_Hangul_PreviousCandidate",   /* Previous candidate */
		0xff3f: "XK_Hangul_Special",   /* Special symbols */
		0xff7e: "XK_Hangul_switch",   /* Alias for mode_switch */

		/* Hangul Consonant Characters */
		0x0ea1: "XK_Hangul_Kiyeog", 
		0x0ea2: "XK_Hangul_SsangKiyeog", 
		0x0ea3: "XK_Hangul_KiyeogSios", 
		0x0ea4: "XK_Hangul_Nieun", 
		0x0ea5: "XK_Hangul_NieunJieuj", 
		0x0ea6: "XK_Hangul_NieunHieuh", 
		0x0ea7: "XK_Hangul_Dikeud", 
		0x0ea8: "XK_Hangul_SsangDikeud", 
		0x0ea9: "XK_Hangul_Rieul", 
		0x0eaa: "XK_Hangul_RieulKiyeog", 
		0x0eab: "XK_Hangul_RieulMieum", 
		0x0eac: "XK_Hangul_RieulPieub", 
		0x0ead: "XK_Hangul_RieulSios", 
		0x0eae: "XK_Hangul_RieulTieut", 
		0x0eaf: "XK_Hangul_RieulPhieuf", 
		0x0eb0: "XK_Hangul_RieulHieuh", 
		0x0eb1: "XK_Hangul_Mieum", 
		0x0eb2: "XK_Hangul_Pieub", 
		0x0eb3: "XK_Hangul_SsangPieub", 
		0x0eb4: "XK_Hangul_PieubSios", 
		0x0eb5: "XK_Hangul_Sios", 
		0x0eb6: "XK_Hangul_SsangSios", 
		0x0eb7: "XK_Hangul_Ieung", 
		0x0eb8: "XK_Hangul_Jieuj", 
		0x0eb9: "XK_Hangul_SsangJieuj", 
		0x0eba: "XK_Hangul_Cieuc", 
		0x0ebb: "XK_Hangul_Khieuq", 
		0x0ebc: "XK_Hangul_Tieut", 
		0x0ebd: "XK_Hangul_Phieuf", 
		0x0ebe: "XK_Hangul_Hieuh", 

		/* Hangul Vowel Characters */
		0x0ebf: "XK_Hangul_A", 
		0x0ec0: "XK_Hangul_AE", 
		0x0ec1: "XK_Hangul_YA", 
		0x0ec2: "XK_Hangul_YAE", 
		0x0ec3: "XK_Hangul_EO", 
		0x0ec4: "XK_Hangul_E", 
		0x0ec5: "XK_Hangul_YEO", 
		0x0ec6: "XK_Hangul_YE", 
		0x0ec7: "XK_Hangul_O", 
		0x0ec8: "XK_Hangul_WA", 
		0x0ec9: "XK_Hangul_WAE", 
		0x0eca: "XK_Hangul_OE", 
		0x0ecb: "XK_Hangul_YO", 
		0x0ecc: "XK_Hangul_U", 
		0x0ecd: "XK_Hangul_WEO", 
		0x0ece: "XK_Hangul_WE", 
		0x0ecf: "XK_Hangul_WI", 
		0x0ed0: "XK_Hangul_YU", 
		0x0ed1: "XK_Hangul_EU", 
		0x0ed2: "XK_Hangul_YI", 
		0x0ed3: "XK_Hangul_I", 

		/* Hangul syllable-final (JongSeong) Characters */
		0x0ed4: "XK_Hangul_J_Kiyeog", 
		0x0ed5: "XK_Hangul_J_SsangKiyeog", 
		0x0ed6: "XK_Hangul_J_KiyeogSios", 
		0x0ed7: "XK_Hangul_J_Nieun", 
		0x0ed8: "XK_Hangul_J_NieunJieuj", 
		0x0ed9: "XK_Hangul_J_NieunHieuh", 
		0x0eda: "XK_Hangul_J_Dikeud", 
		0x0edb: "XK_Hangul_J_Rieul", 
		0x0edc: "XK_Hangul_J_RieulKiyeog", 
		0x0edd: "XK_Hangul_J_RieulMieum", 
		0x0ede: "XK_Hangul_J_RieulPieub", 
		0x0edf: "XK_Hangul_J_RieulSios", 
		0x0ee0: "XK_Hangul_J_RieulTieut", 
		0x0ee1: "XK_Hangul_J_RieulPhieuf", 
		0x0ee2: "XK_Hangul_J_RieulHieuh", 
		0x0ee3: "XK_Hangul_J_Mieum", 
		0x0ee4: "XK_Hangul_J_Pieub", 
		0x0ee5: "XK_Hangul_J_PieubSios", 
		0x0ee6: "XK_Hangul_J_Sios", 
		0x0ee7: "XK_Hangul_J_SsangSios", 
		0x0ee8: "XK_Hangul_J_Ieung", 
		0x0ee9: "XK_Hangul_J_Jieuj", 
		0x0eea: "XK_Hangul_J_Cieuc", 
		0x0eeb: "XK_Hangul_J_Khieuq", 
		0x0eec: "XK_Hangul_J_Tieut", 
		0x0eed: "XK_Hangul_J_Phieuf", 
		0x0eee: "XK_Hangul_J_Hieuh", 

		/* Ancient Hangul Consonant Characters */
		0x0eef: "XK_Hangul_RieulYeorinHieuh", 
		0x0ef0: "XK_Hangul_SunkyeongeumMieum", 
		0x0ef1: "XK_Hangul_SunkyeongeumPieub", 
		0x0ef2: "XK_Hangul_PanSios", 
		0x0ef3: "XK_Hangul_KkogjiDalrinIeung", 
		0x0ef4: "XK_Hangul_SunkyeongeumPhieuf", 
		0x0ef5: "XK_Hangul_YeorinHieuh", 

		/* Ancient Hangul Vowel Characters */
		0x0ef6: "XK_Hangul_AraeA", 
		0x0ef7: "XK_Hangul_AraeAE", 

		/* Ancient Hangul syllable-final (JongSeong) Characters */
		0x0ef8: "XK_Hangul_J_PanSios", 
		0x0ef9: "XK_Hangul_J_KkogjiDalrinIeung", 
		0x0efa: "XK_Hangul_J_YeorinHieuh", 

		/* Korean currency symbol */
		0x0eff: "XK_Korean_Won",   /*(U+20A9 WON SIGN)*/



		/*
 * Armenian
 */

		0x1000587: "XK_Armenian_ligature_ew",   /* U+0587 ARMENIAN SMALL LIGATURE ECH YIWN */
		0x1000589: "XK_Armenian_full_stop",   /* U+0589 ARMENIAN FULL STOP */
		0x1000589: "XK_Armenian_verjaket",   /* U+0589 ARMENIAN FULL STOP */
		0x100055d: "XK_Armenian_separation_mark",   /* U+055D ARMENIAN COMMA */
		0x100055d: "XK_Armenian_but",   /* U+055D ARMENIAN COMMA */
		0x100058a: "XK_Armenian_hyphen",   /* U+058A ARMENIAN HYPHEN */
		0x100058a: "XK_Armenian_yentamna",   /* U+058A ARMENIAN HYPHEN */
		0x100055c: "XK_Armenian_exclam",   /* U+055C ARMENIAN EXCLAMATION MARK */
		0x100055c: "XK_Armenian_amanak",   /* U+055C ARMENIAN EXCLAMATION MARK */
		0x100055b: "XK_Armenian_accent",   /* U+055B ARMENIAN EMPHASIS MARK */
		0x100055b: "XK_Armenian_shesht",   /* U+055B ARMENIAN EMPHASIS MARK */
		0x100055e: "XK_Armenian_question",   /* U+055E ARMENIAN QUESTION MARK */
		0x100055e: "XK_Armenian_paruyk",   /* U+055E ARMENIAN QUESTION MARK */
		0x1000531: "XK_Armenian_AYB",   /* U+0531 ARMENIAN CAPITAL LETTER AYB */
		0x1000561: "XK_Armenian_ayb",   /* U+0561 ARMENIAN SMALL LETTER AYB */
		0x1000532: "XK_Armenian_BEN",   /* U+0532 ARMENIAN CAPITAL LETTER BEN */
		0x1000562: "XK_Armenian_ben",   /* U+0562 ARMENIAN SMALL LETTER BEN */
		0x1000533: "XK_Armenian_GIM",   /* U+0533 ARMENIAN CAPITAL LETTER GIM */
		0x1000563: "XK_Armenian_gim",   /* U+0563 ARMENIAN SMALL LETTER GIM */
		0x1000534: "XK_Armenian_DA",   /* U+0534 ARMENIAN CAPITAL LETTER DA */
		0x1000564: "XK_Armenian_da",   /* U+0564 ARMENIAN SMALL LETTER DA */
		0x1000535: "XK_Armenian_YECH",   /* U+0535 ARMENIAN CAPITAL LETTER ECH */
		0x1000565: "XK_Armenian_yech",   /* U+0565 ARMENIAN SMALL LETTER ECH */
		0x1000536: "XK_Armenian_ZA",   /* U+0536 ARMENIAN CAPITAL LETTER ZA */
		0x1000566: "XK_Armenian_za",   /* U+0566 ARMENIAN SMALL LETTER ZA */
		0x1000537: "XK_Armenian_E",   /* U+0537 ARMENIAN CAPITAL LETTER EH */
		0x1000567: "XK_Armenian_e",   /* U+0567 ARMENIAN SMALL LETTER EH */
		0x1000538: "XK_Armenian_AT",   /* U+0538 ARMENIAN CAPITAL LETTER ET */
		0x1000568: "XK_Armenian_at",   /* U+0568 ARMENIAN SMALL LETTER ET */
		0x1000539: "XK_Armenian_TO",   /* U+0539 ARMENIAN CAPITAL LETTER TO */
		0x1000569: "XK_Armenian_to",   /* U+0569 ARMENIAN SMALL LETTER TO */
		0x100053a: "XK_Armenian_ZHE",   /* U+053A ARMENIAN CAPITAL LETTER ZHE */
		0x100056a: "XK_Armenian_zhe",   /* U+056A ARMENIAN SMALL LETTER ZHE */
		0x100053b: "XK_Armenian_INI",   /* U+053B ARMENIAN CAPITAL LETTER INI */
		0x100056b: "XK_Armenian_ini",   /* U+056B ARMENIAN SMALL LETTER INI */
		0x100053c: "XK_Armenian_LYUN",   /* U+053C ARMENIAN CAPITAL LETTER LIWN */
		0x100056c: "XK_Armenian_lyun",   /* U+056C ARMENIAN SMALL LETTER LIWN */
		0x100053d: "XK_Armenian_KHE",   /* U+053D ARMENIAN CAPITAL LETTER XEH */
		0x100056d: "XK_Armenian_khe",   /* U+056D ARMENIAN SMALL LETTER XEH */
		0x100053e: "XK_Armenian_TSA",   /* U+053E ARMENIAN CAPITAL LETTER CA */
		0x100056e: "XK_Armenian_tsa",   /* U+056E ARMENIAN SMALL LETTER CA */
		0x100053f: "XK_Armenian_KEN",   /* U+053F ARMENIAN CAPITAL LETTER KEN */
		0x100056f: "XK_Armenian_ken",   /* U+056F ARMENIAN SMALL LETTER KEN */
		0x1000540: "XK_Armenian_HO",   /* U+0540 ARMENIAN CAPITAL LETTER HO */
		0x1000570: "XK_Armenian_ho",   /* U+0570 ARMENIAN SMALL LETTER HO */
		0x1000541: "XK_Armenian_DZA",   /* U+0541 ARMENIAN CAPITAL LETTER JA */
		0x1000571: "XK_Armenian_dza",   /* U+0571 ARMENIAN SMALL LETTER JA */
		0x1000542: "XK_Armenian_GHAT",   /* U+0542 ARMENIAN CAPITAL LETTER GHAD */
		0x1000572: "XK_Armenian_ghat",   /* U+0572 ARMENIAN SMALL LETTER GHAD */
		0x1000543: "XK_Armenian_TCHE",   /* U+0543 ARMENIAN CAPITAL LETTER CHEH */
		0x1000573: "XK_Armenian_tche",   /* U+0573 ARMENIAN SMALL LETTER CHEH */
		0x1000544: "XK_Armenian_MEN",   /* U+0544 ARMENIAN CAPITAL LETTER MEN */
		0x1000574: "XK_Armenian_men",   /* U+0574 ARMENIAN SMALL LETTER MEN */
		0x1000545: "XK_Armenian_HI",   /* U+0545 ARMENIAN CAPITAL LETTER YI */
		0x1000575: "XK_Armenian_hi",   /* U+0575 ARMENIAN SMALL LETTER YI */
		0x1000546: "XK_Armenian_NU",   /* U+0546 ARMENIAN CAPITAL LETTER NOW */
		0x1000576: "XK_Armenian_nu",   /* U+0576 ARMENIAN SMALL LETTER NOW */
		0x1000547: "XK_Armenian_SHA",   /* U+0547 ARMENIAN CAPITAL LETTER SHA */
		0x1000577: "XK_Armenian_sha",   /* U+0577 ARMENIAN SMALL LETTER SHA */
		0x1000548: "XK_Armenian_VO",   /* U+0548 ARMENIAN CAPITAL LETTER VO */
		0x1000578: "XK_Armenian_vo",   /* U+0578 ARMENIAN SMALL LETTER VO */
		0x1000549: "XK_Armenian_CHA",   /* U+0549 ARMENIAN CAPITAL LETTER CHA */
		0x1000579: "XK_Armenian_cha",   /* U+0579 ARMENIAN SMALL LETTER CHA */
		0x100054a: "XK_Armenian_PE",   /* U+054A ARMENIAN CAPITAL LETTER PEH */
		0x100057a: "XK_Armenian_pe",   /* U+057A ARMENIAN SMALL LETTER PEH */
		0x100054b: "XK_Armenian_JE",   /* U+054B ARMENIAN CAPITAL LETTER JHEH */
		0x100057b: "XK_Armenian_je",   /* U+057B ARMENIAN SMALL LETTER JHEH */
		0x100054c: "XK_Armenian_RA",   /* U+054C ARMENIAN CAPITAL LETTER RA */
		0x100057c: "XK_Armenian_ra",   /* U+057C ARMENIAN SMALL LETTER RA */
		0x100054d: "XK_Armenian_SE",   /* U+054D ARMENIAN CAPITAL LETTER SEH */
		0x100057d: "XK_Armenian_se",   /* U+057D ARMENIAN SMALL LETTER SEH */
		0x100054e: "XK_Armenian_VEV",   /* U+054E ARMENIAN CAPITAL LETTER VEW */
		0x100057e: "XK_Armenian_vev",   /* U+057E ARMENIAN SMALL LETTER VEW */
		0x100054f: "XK_Armenian_TYUN",   /* U+054F ARMENIAN CAPITAL LETTER TIWN */
		0x100057f: "XK_Armenian_tyun",   /* U+057F ARMENIAN SMALL LETTER TIWN */
		0x1000550: "XK_Armenian_RE",   /* U+0550 ARMENIAN CAPITAL LETTER REH */
		0x1000580: "XK_Armenian_re",   /* U+0580 ARMENIAN SMALL LETTER REH */
		0x1000551: "XK_Armenian_TSO",   /* U+0551 ARMENIAN CAPITAL LETTER CO */
		0x1000581: "XK_Armenian_tso",   /* U+0581 ARMENIAN SMALL LETTER CO */
		0x1000552: "XK_Armenian_VYUN",   /* U+0552 ARMENIAN CAPITAL LETTER YIWN */
		0x1000582: "XK_Armenian_vyun",   /* U+0582 ARMENIAN SMALL LETTER YIWN */
		0x1000553: "XK_Armenian_PYUR",   /* U+0553 ARMENIAN CAPITAL LETTER PIWR */
		0x1000583: "XK_Armenian_pyur",   /* U+0583 ARMENIAN SMALL LETTER PIWR */
		0x1000554: "XK_Armenian_KE",   /* U+0554 ARMENIAN CAPITAL LETTER KEH */
		0x1000584: "XK_Armenian_ke",   /* U+0584 ARMENIAN SMALL LETTER KEH */
		0x1000555: "XK_Armenian_O",   /* U+0555 ARMENIAN CAPITAL LETTER OH */
		0x1000585: "XK_Armenian_o",   /* U+0585 ARMENIAN SMALL LETTER OH */
		0x1000556: "XK_Armenian_FE",   /* U+0556 ARMENIAN CAPITAL LETTER FEH */
		0x1000586: "XK_Armenian_fe",   /* U+0586 ARMENIAN SMALL LETTER FEH */
		0x100055a: "XK_Armenian_apostrophe",   /* U+055A ARMENIAN APOSTROPHE */


		/*
 * Georgian
 */


		0x10010d0: "XK_Georgian_an",   /* U+10D0 GEORGIAN LETTER AN */
		0x10010d1: "XK_Georgian_ban",   /* U+10D1 GEORGIAN LETTER BAN */
		0x10010d2: "XK_Georgian_gan",   /* U+10D2 GEORGIAN LETTER GAN */
		0x10010d3: "XK_Georgian_don",   /* U+10D3 GEORGIAN LETTER DON */
		0x10010d4: "XK_Georgian_en",   /* U+10D4 GEORGIAN LETTER EN */
		0x10010d5: "XK_Georgian_vin",   /* U+10D5 GEORGIAN LETTER VIN */
		0x10010d6: "XK_Georgian_zen",   /* U+10D6 GEORGIAN LETTER ZEN */
		0x10010d7: "XK_Georgian_tan",   /* U+10D7 GEORGIAN LETTER TAN */
		0x10010d8: "XK_Georgian_in",   /* U+10D8 GEORGIAN LETTER IN */
		0x10010d9: "XK_Georgian_kan",   /* U+10D9 GEORGIAN LETTER KAN */
		0x10010da: "XK_Georgian_las",   /* U+10DA GEORGIAN LETTER LAS */
		0x10010db: "XK_Georgian_man",   /* U+10DB GEORGIAN LETTER MAN */
		0x10010dc: "XK_Georgian_nar",   /* U+10DC GEORGIAN LETTER NAR */
		0x10010dd: "XK_Georgian_on",   /* U+10DD GEORGIAN LETTER ON */
		0x10010de: "XK_Georgian_par",   /* U+10DE GEORGIAN LETTER PAR */
		0x10010df: "XK_Georgian_zhar",   /* U+10DF GEORGIAN LETTER ZHAR */
		0x10010e0: "XK_Georgian_rae",   /* U+10E0 GEORGIAN LETTER RAE */
		0x10010e1: "XK_Georgian_san",   /* U+10E1 GEORGIAN LETTER SAN */
		0x10010e2: "XK_Georgian_tar",   /* U+10E2 GEORGIAN LETTER TAR */
		0x10010e3: "XK_Georgian_un",   /* U+10E3 GEORGIAN LETTER UN */
		0x10010e4: "XK_Georgian_phar",   /* U+10E4 GEORGIAN LETTER PHAR */
		0x10010e5: "XK_Georgian_khar",   /* U+10E5 GEORGIAN LETTER KHAR */
		0x10010e6: "XK_Georgian_ghan",   /* U+10E6 GEORGIAN LETTER GHAN */
		0x10010e7: "XK_Georgian_qar",   /* U+10E7 GEORGIAN LETTER QAR */
		0x10010e8: "XK_Georgian_shin",   /* U+10E8 GEORGIAN LETTER SHIN */
		0x10010e9: "XK_Georgian_chin",   /* U+10E9 GEORGIAN LETTER CHIN */
		0x10010ea: "XK_Georgian_can",   /* U+10EA GEORGIAN LETTER CAN */
		0x10010eb: "XK_Georgian_jil",   /* U+10EB GEORGIAN LETTER JIL */
		0x10010ec: "XK_Georgian_cil",   /* U+10EC GEORGIAN LETTER CIL */
		0x10010ed: "XK_Georgian_char",   /* U+10ED GEORGIAN LETTER CHAR */
		0x10010ee: "XK_Georgian_xan",   /* U+10EE GEORGIAN LETTER XAN */
		0x10010ef: "XK_Georgian_jhan",   /* U+10EF GEORGIAN LETTER JHAN */
		0x10010f0: "XK_Georgian_hae",   /* U+10F0 GEORGIAN LETTER HAE */
		0x10010f1: "XK_Georgian_he",   /* U+10F1 GEORGIAN LETTER HE */
		0x10010f2: "XK_Georgian_hie",   /* U+10F2 GEORGIAN LETTER HIE */
		0x10010f3: "XK_Georgian_we",   /* U+10F3 GEORGIAN LETTER WE */
		0x10010f4: "XK_Georgian_har",   /* U+10F4 GEORGIAN LETTER HAR */
		0x10010f5: "XK_Georgian_hoe",   /* U+10F5 GEORGIAN LETTER HOE */
		0x10010f6: "XK_Georgian_fi",   /* U+10F6 GEORGIAN LETTER FI */


		/*
 * Azeri (and other Turkic or Caucasian languages)
 */


		/* latin */
		0x1001e8a: "XK_Xabovedot",   /* U+1E8A LATIN CAPITAL LETTER X WITH DOT ABOVE */
		0x100012c: "XK_Ibreve",   /* U+012C LATIN CAPITAL LETTER I WITH BREVE */
		0x10001b5: "XK_Zstroke",   /* U+01B5 LATIN CAPITAL LETTER Z WITH STROKE */
		0x10001e6: "XK_Gcaron",   /* U+01E6 LATIN CAPITAL LETTER G WITH CARON */
		0x10001d1: "XK_Ocaron",   /* U+01D2 LATIN CAPITAL LETTER O WITH CARON */
		0x100019f: "XK_Obarred",   /* U+019F LATIN CAPITAL LETTER O WITH MIDDLE TILDE */
		0x1001e8b: "XK_xabovedot",   /* U+1E8B LATIN SMALL LETTER X WITH DOT ABOVE */
		0x100012d: "XK_ibreve",   /* U+012D LATIN SMALL LETTER I WITH BREVE */
		0x10001b6: "XK_zstroke",   /* U+01B6 LATIN SMALL LETTER Z WITH STROKE */
		0x10001e7: "XK_gcaron",   /* U+01E7 LATIN SMALL LETTER G WITH CARON */
		0x10001d2: "XK_ocaron",   /* U+01D2 LATIN SMALL LETTER O WITH CARON */
		0x1000275: "XK_obarred",   /* U+0275 LATIN SMALL LETTER BARRED O */
		0x100018f: "XK_SCHWA",   /* U+018F LATIN CAPITAL LETTER SCHWA */
		0x1000259: "XK_schwa",   /* U+0259 LATIN SMALL LETTER SCHWA */
		0x10001b7: "XK_EZH",   /* U+01B7 LATIN CAPITAL LETTER EZH */
		0x1000292: "XK_ezh",   /* U+0292 LATIN SMALL LETTER EZH */
		/* those are not really Caucasus */
		/* For Inupiak */
		0x1001e36: "XK_Lbelowdot",   /* U+1E36 LATIN CAPITAL LETTER L WITH DOT BELOW */
		0x1001e37: "XK_lbelowdot",   /* U+1E37 LATIN SMALL LETTER L WITH DOT BELOW */


		/*
 * Vietnamese
 */


		0x1001ea0: "XK_Abelowdot",   /* U+1EA0 LATIN CAPITAL LETTER A WITH DOT BELOW */
		0x1001ea1: "XK_abelowdot",   /* U+1EA1 LATIN SMALL LETTER A WITH DOT BELOW */
		0x1001ea2: "XK_Ahook",   /* U+1EA2 LATIN CAPITAL LETTER A WITH HOOK ABOVE */
		0x1001ea3: "XK_ahook",   /* U+1EA3 LATIN SMALL LETTER A WITH HOOK ABOVE */
		0x1001ea4: "XK_Acircumflexacute",   /* U+1EA4 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE */
		0x1001ea5: "XK_acircumflexacute",   /* U+1EA5 LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE */
		0x1001ea6: "XK_Acircumflexgrave",   /* U+1EA6 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE */
		0x1001ea7: "XK_acircumflexgrave",   /* U+1EA7 LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE */
		0x1001ea8: "XK_Acircumflexhook",   /* U+1EA8 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001ea9: "XK_acircumflexhook",   /* U+1EA9 LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001eaa: "XK_Acircumflextilde",   /* U+1EAA LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE */
		0x1001eab: "XK_acircumflextilde",   /* U+1EAB LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE */
		0x1001eac: "XK_Acircumflexbelowdot",   /* U+1EAC LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND DOT BELOW */
		0x1001ead: "XK_acircumflexbelowdot",   /* U+1EAD LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW */
		0x1001eae: "XK_Abreveacute",   /* U+1EAE LATIN CAPITAL LETTER A WITH BREVE AND ACUTE */
		0x1001eaf: "XK_abreveacute",   /* U+1EAF LATIN SMALL LETTER A WITH BREVE AND ACUTE */
		0x1001eb0: "XK_Abrevegrave",   /* U+1EB0 LATIN CAPITAL LETTER A WITH BREVE AND GRAVE */
		0x1001eb1: "XK_abrevegrave",   /* U+1EB1 LATIN SMALL LETTER A WITH BREVE AND GRAVE */
		0x1001eb2: "XK_Abrevehook",   /* U+1EB2 LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE */
		0x1001eb3: "XK_abrevehook",   /* U+1EB3 LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE */
		0x1001eb4: "XK_Abrevetilde",   /* U+1EB4 LATIN CAPITAL LETTER A WITH BREVE AND TILDE */
		0x1001eb5: "XK_abrevetilde",   /* U+1EB5 LATIN SMALL LETTER A WITH BREVE AND TILDE */
		0x1001eb6: "XK_Abrevebelowdot",   /* U+1EB6 LATIN CAPITAL LETTER A WITH BREVE AND DOT BELOW */
		0x1001eb7: "XK_abrevebelowdot",   /* U+1EB7 LATIN SMALL LETTER A WITH BREVE AND DOT BELOW */
		0x1001eb8: "XK_Ebelowdot",   /* U+1EB8 LATIN CAPITAL LETTER E WITH DOT BELOW */
		0x1001eb9: "XK_ebelowdot",   /* U+1EB9 LATIN SMALL LETTER E WITH DOT BELOW */
		0x1001eba: "XK_Ehook",   /* U+1EBA LATIN CAPITAL LETTER E WITH HOOK ABOVE */
		0x1001ebb: "XK_ehook",   /* U+1EBB LATIN SMALL LETTER E WITH HOOK ABOVE */
		0x1001ebc: "XK_Etilde",   /* U+1EBC LATIN CAPITAL LETTER E WITH TILDE */
		0x1001ebd: "XK_etilde",   /* U+1EBD LATIN SMALL LETTER E WITH TILDE */
		0x1001ebe: "XK_Ecircumflexacute",   /* U+1EBE LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE */
		0x1001ebf: "XK_ecircumflexacute",   /* U+1EBF LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE */
		0x1001ec0: "XK_Ecircumflexgrave",   /* U+1EC0 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE */
		0x1001ec1: "XK_ecircumflexgrave",   /* U+1EC1 LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE */
		0x1001ec2: "XK_Ecircumflexhook",   /* U+1EC2 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001ec3: "XK_ecircumflexhook",   /* U+1EC3 LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001ec4: "XK_Ecircumflextilde",   /* U+1EC4 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE */
		0x1001ec5: "XK_ecircumflextilde",   /* U+1EC5 LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE */
		0x1001ec6: "XK_Ecircumflexbelowdot",   /* U+1EC6 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW */
		0x1001ec7: "XK_ecircumflexbelowdot",   /* U+1EC7 LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW */
		0x1001ec8: "XK_Ihook",   /* U+1EC8 LATIN CAPITAL LETTER I WITH HOOK ABOVE */
		0x1001ec9: "XK_ihook",   /* U+1EC9 LATIN SMALL LETTER I WITH HOOK ABOVE */
		0x1001eca: "XK_Ibelowdot",   /* U+1ECA LATIN CAPITAL LETTER I WITH DOT BELOW */
		0x1001ecb: "XK_ibelowdot",   /* U+1ECB LATIN SMALL LETTER I WITH DOT BELOW */
		0x1001ecc: "XK_Obelowdot",   /* U+1ECC LATIN CAPITAL LETTER O WITH DOT BELOW */
		0x1001ecd: "XK_obelowdot",   /* U+1ECD LATIN SMALL LETTER O WITH DOT BELOW */
		0x1001ece: "XK_Ohook",   /* U+1ECE LATIN CAPITAL LETTER O WITH HOOK ABOVE */
		0x1001ecf: "XK_ohook",   /* U+1ECF LATIN SMALL LETTER O WITH HOOK ABOVE */
		0x1001ed0: "XK_Ocircumflexacute",   /* U+1ED0 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE */
		0x1001ed1: "XK_ocircumflexacute",   /* U+1ED1 LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE */
		0x1001ed2: "XK_Ocircumflexgrave",   /* U+1ED2 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE */
		0x1001ed3: "XK_ocircumflexgrave",   /* U+1ED3 LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE */
		0x1001ed4: "XK_Ocircumflexhook",   /* U+1ED4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001ed5: "XK_ocircumflexhook",   /* U+1ED5 LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE */
		0x1001ed6: "XK_Ocircumflextilde",   /* U+1ED6 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE */
		0x1001ed7: "XK_ocircumflextilde",   /* U+1ED7 LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE */
		0x1001ed8: "XK_Ocircumflexbelowdot",   /* U+1ED8 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND DOT BELOW */
		0x1001ed9: "XK_ocircumflexbelowdot",   /* U+1ED9 LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW */
		0x1001eda: "XK_Ohornacute",   /* U+1EDA LATIN CAPITAL LETTER O WITH HORN AND ACUTE */
		0x1001edb: "XK_ohornacute",   /* U+1EDB LATIN SMALL LETTER O WITH HORN AND ACUTE */
		0x1001edc: "XK_Ohorngrave",   /* U+1EDC LATIN CAPITAL LETTER O WITH HORN AND GRAVE */
		0x1001edd: "XK_ohorngrave",   /* U+1EDD LATIN SMALL LETTER O WITH HORN AND GRAVE */
		0x1001ede: "XK_Ohornhook",   /* U+1EDE LATIN CAPITAL LETTER O WITH HORN AND HOOK ABOVE */
		0x1001edf: "XK_ohornhook",   /* U+1EDF LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE */
		0x1001ee0: "XK_Ohorntilde",   /* U+1EE0 LATIN CAPITAL LETTER O WITH HORN AND TILDE */
		0x1001ee1: "XK_ohorntilde",   /* U+1EE1 LATIN SMALL LETTER O WITH HORN AND TILDE */
		0x1001ee2: "XK_Ohornbelowdot",   /* U+1EE2 LATIN CAPITAL LETTER O WITH HORN AND DOT BELOW */
		0x1001ee3: "XK_ohornbelowdot",   /* U+1EE3 LATIN SMALL LETTER O WITH HORN AND DOT BELOW */
		0x1001ee4: "XK_Ubelowdot",   /* U+1EE4 LATIN CAPITAL LETTER U WITH DOT BELOW */
		0x1001ee5: "XK_ubelowdot",   /* U+1EE5 LATIN SMALL LETTER U WITH DOT BELOW */
		0x1001ee6: "XK_Uhook",   /* U+1EE6 LATIN CAPITAL LETTER U WITH HOOK ABOVE */
		0x1001ee7: "XK_uhook",   /* U+1EE7 LATIN SMALL LETTER U WITH HOOK ABOVE */
		0x1001ee8: "XK_Uhornacute",   /* U+1EE8 LATIN CAPITAL LETTER U WITH HORN AND ACUTE */
		0x1001ee9: "XK_uhornacute",   /* U+1EE9 LATIN SMALL LETTER U WITH HORN AND ACUTE */
		0x1001eea: "XK_Uhorngrave",   /* U+1EEA LATIN CAPITAL LETTER U WITH HORN AND GRAVE */
		0x1001eeb: "XK_uhorngrave",   /* U+1EEB LATIN SMALL LETTER U WITH HORN AND GRAVE */
		0x1001eec: "XK_Uhornhook",   /* U+1EEC LATIN CAPITAL LETTER U WITH HORN AND HOOK ABOVE */
		0x1001eed: "XK_uhornhook",   /* U+1EED LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE */
		0x1001eee: "XK_Uhorntilde",   /* U+1EEE LATIN CAPITAL LETTER U WITH HORN AND TILDE */
		0x1001eef: "XK_uhorntilde",   /* U+1EEF LATIN SMALL LETTER U WITH HORN AND TILDE */
		0x1001ef0: "XK_Uhornbelowdot",   /* U+1EF0 LATIN CAPITAL LETTER U WITH HORN AND DOT BELOW */
		0x1001ef1: "XK_uhornbelowdot",   /* U+1EF1 LATIN SMALL LETTER U WITH HORN AND DOT BELOW */
		0x1001ef4: "XK_Ybelowdot",   /* U+1EF4 LATIN CAPITAL LETTER Y WITH DOT BELOW */
		0x1001ef5: "XK_ybelowdot",   /* U+1EF5 LATIN SMALL LETTER Y WITH DOT BELOW */
		0x1001ef6: "XK_Yhook",   /* U+1EF6 LATIN CAPITAL LETTER Y WITH HOOK ABOVE */
		0x1001ef7: "XK_yhook",   /* U+1EF7 LATIN SMALL LETTER Y WITH HOOK ABOVE */
		0x1001ef8: "XK_Ytilde",   /* U+1EF8 LATIN CAPITAL LETTER Y WITH TILDE */
		0x1001ef9: "XK_ytilde",   /* U+1EF9 LATIN SMALL LETTER Y WITH TILDE */
		0x10001a0: "XK_Ohorn",   /* U+01A0 LATIN CAPITAL LETTER O WITH HORN */
		0x10001a1: "XK_ohorn",   /* U+01A1 LATIN SMALL LETTER O WITH HORN */
		0x10001af: "XK_Uhorn",   /* U+01AF LATIN CAPITAL LETTER U WITH HORN */
		0x10001b0: "XK_uhorn",   /* U+01B0 LATIN SMALL LETTER U WITH HORN */




		0x10020a0: "XK_EcuSign",   /* U+20A0 EURO-CURRENCY SIGN */
		0x10020a1: "XK_ColonSign",   /* U+20A1 COLON SIGN */
		0x10020a2: "XK_CruzeiroSign",   /* U+20A2 CRUZEIRO SIGN */
		0x10020a3: "XK_FFrancSign",   /* U+20A3 FRENCH FRANC SIGN */
		0x10020a4: "XK_LiraSign",   /* U+20A4 LIRA SIGN */
		0x10020a5: "XK_MillSign",   /* U+20A5 MILL SIGN */
		0x10020a6: "XK_NairaSign",   /* U+20A6 NAIRA SIGN */
		0x10020a7: "XK_PesetaSign",   /* U+20A7 PESETA SIGN */
		0x10020a8: "XK_RupeeSign",   /* U+20A8 RUPEE SIGN */
		0x10020a9: "XK_WonSign",   /* U+20A9 WON SIGN */
		0x10020aa: "XK_NewSheqelSign",   /* U+20AA NEW SHEQEL SIGN */
		0x10020ab: "XK_DongSign",   /* U+20AB DONG SIGN */
		0x20ac: "XK_EuroSign",   /* U+20AC EURO SIGN */



		/* one, two and three are defined above. */
		0x1002070: "XK_zerosuperior",   /* U+2070 SUPERSCRIPT ZERO */
		0x1002074: "XK_foursuperior",   /* U+2074 SUPERSCRIPT FOUR */
		0x1002075: "XK_fivesuperior",   /* U+2075 SUPERSCRIPT FIVE */
		0x1002076: "XK_sixsuperior",   /* U+2076 SUPERSCRIPT SIX */
		0x1002077: "XK_sevensuperior",   /* U+2077 SUPERSCRIPT SEVEN */
		0x1002078: "XK_eightsuperior",   /* U+2078 SUPERSCRIPT EIGHT */
		0x1002079: "XK_ninesuperior",   /* U+2079 SUPERSCRIPT NINE */
		0x1002080: "XK_zerosubscript",   /* U+2080 SUBSCRIPT ZERO */
		0x1002081: "XK_onesubscript",   /* U+2081 SUBSCRIPT ONE */
		0x1002082: "XK_twosubscript",   /* U+2082 SUBSCRIPT TWO */
		0x1002083: "XK_threesubscript",   /* U+2083 SUBSCRIPT THREE */
		0x1002084: "XK_foursubscript",   /* U+2084 SUBSCRIPT FOUR */
		0x1002085: "XK_fivesubscript",   /* U+2085 SUBSCRIPT FIVE */
		0x1002086: "XK_sixsubscript",   /* U+2086 SUBSCRIPT SIX */
		0x1002087: "XK_sevensubscript",   /* U+2087 SUBSCRIPT SEVEN */
		0x1002088: "XK_eightsubscript",   /* U+2088 SUBSCRIPT EIGHT */
		0x1002089: "XK_ninesubscript",   /* U+2089 SUBSCRIPT NINE */
		0x1002202: "XK_partdifferential",   /* U+2202 PARTIAL DIFFERENTIAL */
		0x1002205: "XK_emptyset",   /* U+2205 NULL SET */
		0x1002208: "XK_elementof",   /* U+2208 ELEMENT OF */
		0x1002209: "XK_notelementof",   /* U+2209 NOT AN ELEMENT OF */
		0x100220B: "XK_containsas",   /* U+220B CONTAINS AS MEMBER */
		0x100221A: "XK_squareroot",   /* U+221A SQUARE ROOT */
		0x100221B: "XK_cuberoot",   /* U+221B CUBE ROOT */
		0x100221C: "XK_fourthroot",   /* U+221C FOURTH ROOT */
		0x100222C: "XK_dintegral",   /* U+222C DOUBLE INTEGRAL */
		0x100222D: "XK_tintegral",   /* U+222D TRIPLE INTEGRAL */
		0x1002235: "XK_because",   /* U+2235 BECAUSE */
		0x1002248: "XK_approxeq",   /* U+2245 ALMOST EQUAL TO */
		0x1002247: "XK_notapproxeq",   /* U+2247 NOT ALMOST EQUAL TO */
		0x1002262: "XK_notidentical",   /* U+2262 NOT IDENTICAL TO */
		0x1002263: "XK_stricteq",   /* U+2263 STRICTLY EQUIVALENT TO */          

		0xfff1: "XK_braille_dot_1", 
		0xfff2: "XK_braille_dot_2", 
		0xfff3: "XK_braille_dot_3", 
		0xfff4: "XK_braille_dot_4", 
		0xfff5: "XK_braille_dot_5", 
		0xfff6: "XK_braille_dot_6", 
		0xfff7: "XK_braille_dot_7", 
		0xfff8: "XK_braille_dot_8", 
		0xfff9: "XK_braille_dot_9", 
		0xfffa: "XK_braille_dot_10", 
		0x1002800: "XK_braille_blank",   /* U+2800 BRAILLE PATTERN BLANK */
		0x1002801: "XK_braille_dots_1",   /* U+2801 BRAILLE PATTERN DOTS-1 */
		0x1002802: "XK_braille_dots_2",   /* U+2802 BRAILLE PATTERN DOTS-2 */
		0x1002803: "XK_braille_dots_12",   /* U+2803 BRAILLE PATTERN DOTS-12 */
		0x1002804: "XK_braille_dots_3",   /* U+2804 BRAILLE PATTERN DOTS-3 */
		0x1002805: "XK_braille_dots_13",   /* U+2805 BRAILLE PATTERN DOTS-13 */
		0x1002806: "XK_braille_dots_23",   /* U+2806 BRAILLE PATTERN DOTS-23 */
		0x1002807: "XK_braille_dots_123",   /* U+2807 BRAILLE PATTERN DOTS-123 */
		0x1002808: "XK_braille_dots_4",   /* U+2808 BRAILLE PATTERN DOTS-4 */
		0x1002809: "XK_braille_dots_14",   /* U+2809 BRAILLE PATTERN DOTS-14 */
		0x100280a: "XK_braille_dots_24",   /* U+280a BRAILLE PATTERN DOTS-24 */
		0x100280b: "XK_braille_dots_124",   /* U+280b BRAILLE PATTERN DOTS-124 */
		0x100280c: "XK_braille_dots_34",   /* U+280c BRAILLE PATTERN DOTS-34 */
		0x100280d: "XK_braille_dots_134",   /* U+280d BRAILLE PATTERN DOTS-134 */
		0x100280e: "XK_braille_dots_234",   /* U+280e BRAILLE PATTERN DOTS-234 */
		0x100280f: "XK_braille_dots_1234",   /* U+280f BRAILLE PATTERN DOTS-1234 */
		0x1002810: "XK_braille_dots_5",   /* U+2810 BRAILLE PATTERN DOTS-5 */
		0x1002811: "XK_braille_dots_15",   /* U+2811 BRAILLE PATTERN DOTS-15 */
		0x1002812: "XK_braille_dots_25",   /* U+2812 BRAILLE PATTERN DOTS-25 */
		0x1002813: "XK_braille_dots_125",   /* U+2813 BRAILLE PATTERN DOTS-125 */
		0x1002814: "XK_braille_dots_35",   /* U+2814 BRAILLE PATTERN DOTS-35 */
		0x1002815: "XK_braille_dots_135",   /* U+2815 BRAILLE PATTERN DOTS-135 */
		0x1002816: "XK_braille_dots_235",   /* U+2816 BRAILLE PATTERN DOTS-235 */
		0x1002817: "XK_braille_dots_1235",   /* U+2817 BRAILLE PATTERN DOTS-1235 */
		0x1002818: "XK_braille_dots_45",   /* U+2818 BRAILLE PATTERN DOTS-45 */
		0x1002819: "XK_braille_dots_145",   /* U+2819 BRAILLE PATTERN DOTS-145 */
		0x100281a: "XK_braille_dots_245",   /* U+281a BRAILLE PATTERN DOTS-245 */
		0x100281b: "XK_braille_dots_1245",   /* U+281b BRAILLE PATTERN DOTS-1245 */
		0x100281c: "XK_braille_dots_345",   /* U+281c BRAILLE PATTERN DOTS-345 */
		0x100281d: "XK_braille_dots_1345",   /* U+281d BRAILLE PATTERN DOTS-1345 */
		0x100281e: "XK_braille_dots_2345",   /* U+281e BRAILLE PATTERN DOTS-2345 */
		0x100281f: "XK_braille_dots_12345",   /* U+281f BRAILLE PATTERN DOTS-12345 */
		0x1002820: "XK_braille_dots_6",   /* U+2820 BRAILLE PATTERN DOTS-6 */
		0x1002821: "XK_braille_dots_16",   /* U+2821 BRAILLE PATTERN DOTS-16 */
		0x1002822: "XK_braille_dots_26",   /* U+2822 BRAILLE PATTERN DOTS-26 */
		0x1002823: "XK_braille_dots_126",   /* U+2823 BRAILLE PATTERN DOTS-126 */
		0x1002824: "XK_braille_dots_36",   /* U+2824 BRAILLE PATTERN DOTS-36 */
		0x1002825: "XK_braille_dots_136",   /* U+2825 BRAILLE PATTERN DOTS-136 */
		0x1002826: "XK_braille_dots_236",   /* U+2826 BRAILLE PATTERN DOTS-236 */
		0x1002827: "XK_braille_dots_1236",   /* U+2827 BRAILLE PATTERN DOTS-1236 */
		0x1002828: "XK_braille_dots_46",   /* U+2828 BRAILLE PATTERN DOTS-46 */
		0x1002829: "XK_braille_dots_146",   /* U+2829 BRAILLE PATTERN DOTS-146 */
		0x100282a: "XK_braille_dots_246",   /* U+282a BRAILLE PATTERN DOTS-246 */
		0x100282b: "XK_braille_dots_1246",   /* U+282b BRAILLE PATTERN DOTS-1246 */
		0x100282c: "XK_braille_dots_346",   /* U+282c BRAILLE PATTERN DOTS-346 */
		0x100282d: "XK_braille_dots_1346",   /* U+282d BRAILLE PATTERN DOTS-1346 */
		0x100282e: "XK_braille_dots_2346",   /* U+282e BRAILLE PATTERN DOTS-2346 */
		0x100282f: "XK_braille_dots_12346",   /* U+282f BRAILLE PATTERN DOTS-12346 */
		0x1002830: "XK_braille_dots_56",   /* U+2830 BRAILLE PATTERN DOTS-56 */
		0x1002831: "XK_braille_dots_156",   /* U+2831 BRAILLE PATTERN DOTS-156 */
		0x1002832: "XK_braille_dots_256",   /* U+2832 BRAILLE PATTERN DOTS-256 */
		0x1002833: "XK_braille_dots_1256",   /* U+2833 BRAILLE PATTERN DOTS-1256 */
		0x1002834: "XK_braille_dots_356",   /* U+2834 BRAILLE PATTERN DOTS-356 */
		0x1002835: "XK_braille_dots_1356",   /* U+2835 BRAILLE PATTERN DOTS-1356 */
		0x1002836: "XK_braille_dots_2356",   /* U+2836 BRAILLE PATTERN DOTS-2356 */
		0x1002837: "XK_braille_dots_12356",   /* U+2837 BRAILLE PATTERN DOTS-12356 */
		0x1002838: "XK_braille_dots_456",   /* U+2838 BRAILLE PATTERN DOTS-456 */
		0x1002839: "XK_braille_dots_1456",   /* U+2839 BRAILLE PATTERN DOTS-1456 */
		0x100283a: "XK_braille_dots_2456",   /* U+283a BRAILLE PATTERN DOTS-2456 */
		0x100283b: "XK_braille_dots_12456",   /* U+283b BRAILLE PATTERN DOTS-12456 */
		0x100283c: "XK_braille_dots_3456",   /* U+283c BRAILLE PATTERN DOTS-3456 */
		0x100283d: "XK_braille_dots_13456",   /* U+283d BRAILLE PATTERN DOTS-13456 */
		0x100283e: "XK_braille_dots_23456",   /* U+283e BRAILLE PATTERN DOTS-23456 */
		0x100283f: "XK_braille_dots_123456",   /* U+283f BRAILLE PATTERN DOTS-123456 */
		0x1002840: "XK_braille_dots_7",   /* U+2840 BRAILLE PATTERN DOTS-7 */
		0x1002841: "XK_braille_dots_17",   /* U+2841 BRAILLE PATTERN DOTS-17 */
		0x1002842: "XK_braille_dots_27",   /* U+2842 BRAILLE PATTERN DOTS-27 */
		0x1002843: "XK_braille_dots_127",   /* U+2843 BRAILLE PATTERN DOTS-127 */
		0x1002844: "XK_braille_dots_37",   /* U+2844 BRAILLE PATTERN DOTS-37 */
		0x1002845: "XK_braille_dots_137",   /* U+2845 BRAILLE PATTERN DOTS-137 */
		0x1002846: "XK_braille_dots_237",   /* U+2846 BRAILLE PATTERN DOTS-237 */
		0x1002847: "XK_braille_dots_1237",   /* U+2847 BRAILLE PATTERN DOTS-1237 */
		0x1002848: "XK_braille_dots_47",   /* U+2848 BRAILLE PATTERN DOTS-47 */
		0x1002849: "XK_braille_dots_147",   /* U+2849 BRAILLE PATTERN DOTS-147 */
		0x100284a: "XK_braille_dots_247",   /* U+284a BRAILLE PATTERN DOTS-247 */
		0x100284b: "XK_braille_dots_1247",   /* U+284b BRAILLE PATTERN DOTS-1247 */
		0x100284c: "XK_braille_dots_347",   /* U+284c BRAILLE PATTERN DOTS-347 */
		0x100284d: "XK_braille_dots_1347",   /* U+284d BRAILLE PATTERN DOTS-1347 */
		0x100284e: "XK_braille_dots_2347",   /* U+284e BRAILLE PATTERN DOTS-2347 */
		0x100284f: "XK_braille_dots_12347",   /* U+284f BRAILLE PATTERN DOTS-12347 */
		0x1002850: "XK_braille_dots_57",   /* U+2850 BRAILLE PATTERN DOTS-57 */
		0x1002851: "XK_braille_dots_157",   /* U+2851 BRAILLE PATTERN DOTS-157 */
		0x1002852: "XK_braille_dots_257",   /* U+2852 BRAILLE PATTERN DOTS-257 */
		0x1002853: "XK_braille_dots_1257",   /* U+2853 BRAILLE PATTERN DOTS-1257 */
		0x1002854: "XK_braille_dots_357",   /* U+2854 BRAILLE PATTERN DOTS-357 */
		0x1002855: "XK_braille_dots_1357",   /* U+2855 BRAILLE PATTERN DOTS-1357 */
		0x1002856: "XK_braille_dots_2357",   /* U+2856 BRAILLE PATTERN DOTS-2357 */
		0x1002857: "XK_braille_dots_12357",   /* U+2857 BRAILLE PATTERN DOTS-12357 */
		0x1002858: "XK_braille_dots_457",   /* U+2858 BRAILLE PATTERN DOTS-457 */
		0x1002859: "XK_braille_dots_1457",   /* U+2859 BRAILLE PATTERN DOTS-1457 */
		0x100285a: "XK_braille_dots_2457",   /* U+285a BRAILLE PATTERN DOTS-2457 */
		0x100285b: "XK_braille_dots_12457",   /* U+285b BRAILLE PATTERN DOTS-12457 */
		0x100285c: "XK_braille_dots_3457",   /* U+285c BRAILLE PATTERN DOTS-3457 */
		0x100285d: "XK_braille_dots_13457",   /* U+285d BRAILLE PATTERN DOTS-13457 */
		0x100285e: "XK_braille_dots_23457",   /* U+285e BRAILLE PATTERN DOTS-23457 */
		0x100285f: "XK_braille_dots_123457",   /* U+285f BRAILLE PATTERN DOTS-123457 */
		0x1002860: "XK_braille_dots_67",   /* U+2860 BRAILLE PATTERN DOTS-67 */
		0x1002861: "XK_braille_dots_167",   /* U+2861 BRAILLE PATTERN DOTS-167 */
		0x1002862: "XK_braille_dots_267",   /* U+2862 BRAILLE PATTERN DOTS-267 */
		0x1002863: "XK_braille_dots_1267",   /* U+2863 BRAILLE PATTERN DOTS-1267 */
		0x1002864: "XK_braille_dots_367",   /* U+2864 BRAILLE PATTERN DOTS-367 */
		0x1002865: "XK_braille_dots_1367",   /* U+2865 BRAILLE PATTERN DOTS-1367 */
		0x1002866: "XK_braille_dots_2367",   /* U+2866 BRAILLE PATTERN DOTS-2367 */
		0x1002867: "XK_braille_dots_12367",   /* U+2867 BRAILLE PATTERN DOTS-12367 */
		0x1002868: "XK_braille_dots_467",   /* U+2868 BRAILLE PATTERN DOTS-467 */
		0x1002869: "XK_braille_dots_1467",   /* U+2869 BRAILLE PATTERN DOTS-1467 */
		0x100286a: "XK_braille_dots_2467",   /* U+286a BRAILLE PATTERN DOTS-2467 */
		0x100286b: "XK_braille_dots_12467",   /* U+286b BRAILLE PATTERN DOTS-12467 */
		0x100286c: "XK_braille_dots_3467",   /* U+286c BRAILLE PATTERN DOTS-3467 */
		0x100286d: "XK_braille_dots_13467",   /* U+286d BRAILLE PATTERN DOTS-13467 */
		0x100286e: "XK_braille_dots_23467",   /* U+286e BRAILLE PATTERN DOTS-23467 */
		0x100286f: "XK_braille_dots_123467",   /* U+286f BRAILLE PATTERN DOTS-123467 */
		0x1002870: "XK_braille_dots_567",   /* U+2870 BRAILLE PATTERN DOTS-567 */
		0x1002871: "XK_braille_dots_1567",   /* U+2871 BRAILLE PATTERN DOTS-1567 */
		0x1002872: "XK_braille_dots_2567",   /* U+2872 BRAILLE PATTERN DOTS-2567 */
		0x1002873: "XK_braille_dots_12567",   /* U+2873 BRAILLE PATTERN DOTS-12567 */
		0x1002874: "XK_braille_dots_3567",   /* U+2874 BRAILLE PATTERN DOTS-3567 */
		0x1002875: "XK_braille_dots_13567",   /* U+2875 BRAILLE PATTERN DOTS-13567 */
		0x1002876: "XK_braille_dots_23567",   /* U+2876 BRAILLE PATTERN DOTS-23567 */
		0x1002877: "XK_braille_dots_123567",   /* U+2877 BRAILLE PATTERN DOTS-123567 */
		0x1002878: "XK_braille_dots_4567",   /* U+2878 BRAILLE PATTERN DOTS-4567 */
		0x1002879: "XK_braille_dots_14567",   /* U+2879 BRAILLE PATTERN DOTS-14567 */
		0x100287a: "XK_braille_dots_24567",   /* U+287a BRAILLE PATTERN DOTS-24567 */
		0x100287b: "XK_braille_dots_124567",   /* U+287b BRAILLE PATTERN DOTS-124567 */
		0x100287c: "XK_braille_dots_34567",   /* U+287c BRAILLE PATTERN DOTS-34567 */
		0x100287d: "XK_braille_dots_134567",   /* U+287d BRAILLE PATTERN DOTS-134567 */
		0x100287e: "XK_braille_dots_234567",   /* U+287e BRAILLE PATTERN DOTS-234567 */
		0x100287f: "XK_braille_dots_1234567",   /* U+287f BRAILLE PATTERN DOTS-1234567 */
		0x1002880: "XK_braille_dots_8",   /* U+2880 BRAILLE PATTERN DOTS-8 */
		0x1002881: "XK_braille_dots_18",   /* U+2881 BRAILLE PATTERN DOTS-18 */
		0x1002882: "XK_braille_dots_28",   /* U+2882 BRAILLE PATTERN DOTS-28 */
		0x1002883: "XK_braille_dots_128",   /* U+2883 BRAILLE PATTERN DOTS-128 */
		0x1002884: "XK_braille_dots_38",   /* U+2884 BRAILLE PATTERN DOTS-38 */
		0x1002885: "XK_braille_dots_138",   /* U+2885 BRAILLE PATTERN DOTS-138 */
		0x1002886: "XK_braille_dots_238",   /* U+2886 BRAILLE PATTERN DOTS-238 */
		0x1002887: "XK_braille_dots_1238",   /* U+2887 BRAILLE PATTERN DOTS-1238 */
		0x1002888: "XK_braille_dots_48",   /* U+2888 BRAILLE PATTERN DOTS-48 */
		0x1002889: "XK_braille_dots_148",   /* U+2889 BRAILLE PATTERN DOTS-148 */
		0x100288a: "XK_braille_dots_248",   /* U+288a BRAILLE PATTERN DOTS-248 */
		0x100288b: "XK_braille_dots_1248",   /* U+288b BRAILLE PATTERN DOTS-1248 */
		0x100288c: "XK_braille_dots_348",   /* U+288c BRAILLE PATTERN DOTS-348 */
		0x100288d: "XK_braille_dots_1348",   /* U+288d BRAILLE PATTERN DOTS-1348 */
		0x100288e: "XK_braille_dots_2348",   /* U+288e BRAILLE PATTERN DOTS-2348 */
		0x100288f: "XK_braille_dots_12348",   /* U+288f BRAILLE PATTERN DOTS-12348 */
		0x1002890: "XK_braille_dots_58",   /* U+2890 BRAILLE PATTERN DOTS-58 */
		0x1002891: "XK_braille_dots_158",   /* U+2891 BRAILLE PATTERN DOTS-158 */
		0x1002892: "XK_braille_dots_258",   /* U+2892 BRAILLE PATTERN DOTS-258 */
		0x1002893: "XK_braille_dots_1258",   /* U+2893 BRAILLE PATTERN DOTS-1258 */
		0x1002894: "XK_braille_dots_358",   /* U+2894 BRAILLE PATTERN DOTS-358 */
		0x1002895: "XK_braille_dots_1358",   /* U+2895 BRAILLE PATTERN DOTS-1358 */
		0x1002896: "XK_braille_dots_2358",   /* U+2896 BRAILLE PATTERN DOTS-2358 */
		0x1002897: "XK_braille_dots_12358",   /* U+2897 BRAILLE PATTERN DOTS-12358 */
		0x1002898: "XK_braille_dots_458",   /* U+2898 BRAILLE PATTERN DOTS-458 */
		0x1002899: "XK_braille_dots_1458",   /* U+2899 BRAILLE PATTERN DOTS-1458 */
		0x100289a: "XK_braille_dots_2458",   /* U+289a BRAILLE PATTERN DOTS-2458 */
		0x100289b: "XK_braille_dots_12458",   /* U+289b BRAILLE PATTERN DOTS-12458 */
		0x100289c: "XK_braille_dots_3458",   /* U+289c BRAILLE PATTERN DOTS-3458 */
		0x100289d: "XK_braille_dots_13458",   /* U+289d BRAILLE PATTERN DOTS-13458 */
		0x100289e: "XK_braille_dots_23458",   /* U+289e BRAILLE PATTERN DOTS-23458 */
		0x100289f: "XK_braille_dots_123458",   /* U+289f BRAILLE PATTERN DOTS-123458 */
		0x10028a0: "XK_braille_dots_68",   /* U+28a0 BRAILLE PATTERN DOTS-68 */
		0x10028a1: "XK_braille_dots_168",   /* U+28a1 BRAILLE PATTERN DOTS-168 */
		0x10028a2: "XK_braille_dots_268",   /* U+28a2 BRAILLE PATTERN DOTS-268 */
		0x10028a3: "XK_braille_dots_1268",   /* U+28a3 BRAILLE PATTERN DOTS-1268 */
		0x10028a4: "XK_braille_dots_368",   /* U+28a4 BRAILLE PATTERN DOTS-368 */
		0x10028a5: "XK_braille_dots_1368",   /* U+28a5 BRAILLE PATTERN DOTS-1368 */
		0x10028a6: "XK_braille_dots_2368",   /* U+28a6 BRAILLE PATTERN DOTS-2368 */
		0x10028a7: "XK_braille_dots_12368",   /* U+28a7 BRAILLE PATTERN DOTS-12368 */
		0x10028a8: "XK_braille_dots_468",   /* U+28a8 BRAILLE PATTERN DOTS-468 */
		0x10028a9: "XK_braille_dots_1468",   /* U+28a9 BRAILLE PATTERN DOTS-1468 */
		0x10028aa: "XK_braille_dots_2468",   /* U+28aa BRAILLE PATTERN DOTS-2468 */
		0x10028ab: "XK_braille_dots_12468",   /* U+28ab BRAILLE PATTERN DOTS-12468 */
		0x10028ac: "XK_braille_dots_3468",   /* U+28ac BRAILLE PATTERN DOTS-3468 */
		0x10028ad: "XK_braille_dots_13468",   /* U+28ad BRAILLE PATTERN DOTS-13468 */
		0x10028ae: "XK_braille_dots_23468",   /* U+28ae BRAILLE PATTERN DOTS-23468 */
		0x10028af: "XK_braille_dots_123468",   /* U+28af BRAILLE PATTERN DOTS-123468 */
		0x10028b0: "XK_braille_dots_568",   /* U+28b0 BRAILLE PATTERN DOTS-568 */
		0x10028b1: "XK_braille_dots_1568",   /* U+28b1 BRAILLE PATTERN DOTS-1568 */
		0x10028b2: "XK_braille_dots_2568",   /* U+28b2 BRAILLE PATTERN DOTS-2568 */
		0x10028b3: "XK_braille_dots_12568",   /* U+28b3 BRAILLE PATTERN DOTS-12568 */
		0x10028b4: "XK_braille_dots_3568",   /* U+28b4 BRAILLE PATTERN DOTS-3568 */
		0x10028b5: "XK_braille_dots_13568",   /* U+28b5 BRAILLE PATTERN DOTS-13568 */
		0x10028b6: "XK_braille_dots_23568",   /* U+28b6 BRAILLE PATTERN DOTS-23568 */
		0x10028b7: "XK_braille_dots_123568",   /* U+28b7 BRAILLE PATTERN DOTS-123568 */
		0x10028b8: "XK_braille_dots_4568",   /* U+28b8 BRAILLE PATTERN DOTS-4568 */
		0x10028b9: "XK_braille_dots_14568",   /* U+28b9 BRAILLE PATTERN DOTS-14568 */
		0x10028ba: "XK_braille_dots_24568",   /* U+28ba BRAILLE PATTERN DOTS-24568 */
		0x10028bb: "XK_braille_dots_124568",   /* U+28bb BRAILLE PATTERN DOTS-124568 */
		0x10028bc: "XK_braille_dots_34568",   /* U+28bc BRAILLE PATTERN DOTS-34568 */
		0x10028bd: "XK_braille_dots_134568",   /* U+28bd BRAILLE PATTERN DOTS-134568 */
		0x10028be: "XK_braille_dots_234568",   /* U+28be BRAILLE PATTERN DOTS-234568 */
		0x10028bf: "XK_braille_dots_1234568",   /* U+28bf BRAILLE PATTERN DOTS-1234568 */
		0x10028c0: "XK_braille_dots_78",   /* U+28c0 BRAILLE PATTERN DOTS-78 */
		0x10028c1: "XK_braille_dots_178",   /* U+28c1 BRAILLE PATTERN DOTS-178 */
		0x10028c2: "XK_braille_dots_278",   /* U+28c2 BRAILLE PATTERN DOTS-278 */
		0x10028c3: "XK_braille_dots_1278",   /* U+28c3 BRAILLE PATTERN DOTS-1278 */
		0x10028c4: "XK_braille_dots_378",   /* U+28c4 BRAILLE PATTERN DOTS-378 */
		0x10028c5: "XK_braille_dots_1378",   /* U+28c5 BRAILLE PATTERN DOTS-1378 */
		0x10028c6: "XK_braille_dots_2378",   /* U+28c6 BRAILLE PATTERN DOTS-2378 */
		0x10028c7: "XK_braille_dots_12378",   /* U+28c7 BRAILLE PATTERN DOTS-12378 */
		0x10028c8: "XK_braille_dots_478",   /* U+28c8 BRAILLE PATTERN DOTS-478 */
		0x10028c9: "XK_braille_dots_1478",   /* U+28c9 BRAILLE PATTERN DOTS-1478 */
		0x10028ca: "XK_braille_dots_2478",   /* U+28ca BRAILLE PATTERN DOTS-2478 */
		0x10028cb: "XK_braille_dots_12478",   /* U+28cb BRAILLE PATTERN DOTS-12478 */
		0x10028cc: "XK_braille_dots_3478",   /* U+28cc BRAILLE PATTERN DOTS-3478 */
		0x10028cd: "XK_braille_dots_13478",   /* U+28cd BRAILLE PATTERN DOTS-13478 */
		0x10028ce: "XK_braille_dots_23478",   /* U+28ce BRAILLE PATTERN DOTS-23478 */
		0x10028cf: "XK_braille_dots_123478",   /* U+28cf BRAILLE PATTERN DOTS-123478 */
		0x10028d0: "XK_braille_dots_578",   /* U+28d0 BRAILLE PATTERN DOTS-578 */
		0x10028d1: "XK_braille_dots_1578",   /* U+28d1 BRAILLE PATTERN DOTS-1578 */
		0x10028d2: "XK_braille_dots_2578",   /* U+28d2 BRAILLE PATTERN DOTS-2578 */
		0x10028d3: "XK_braille_dots_12578",   /* U+28d3 BRAILLE PATTERN DOTS-12578 */
		0x10028d4: "XK_braille_dots_3578",   /* U+28d4 BRAILLE PATTERN DOTS-3578 */
		0x10028d5: "XK_braille_dots_13578",   /* U+28d5 BRAILLE PATTERN DOTS-13578 */
		0x10028d6: "XK_braille_dots_23578",   /* U+28d6 BRAILLE PATTERN DOTS-23578 */
		0x10028d7: "XK_braille_dots_123578",   /* U+28d7 BRAILLE PATTERN DOTS-123578 */
		0x10028d8: "XK_braille_dots_4578",   /* U+28d8 BRAILLE PATTERN DOTS-4578 */
		0x10028d9: "XK_braille_dots_14578",   /* U+28d9 BRAILLE PATTERN DOTS-14578 */
		0x10028da: "XK_braille_dots_24578",   /* U+28da BRAILLE PATTERN DOTS-24578 */
		0x10028db: "XK_braille_dots_124578",   /* U+28db BRAILLE PATTERN DOTS-124578 */
		0x10028dc: "XK_braille_dots_34578",   /* U+28dc BRAILLE PATTERN DOTS-34578 */
		0x10028dd: "XK_braille_dots_134578",   /* U+28dd BRAILLE PATTERN DOTS-134578 */
		0x10028de: "XK_braille_dots_234578",   /* U+28de BRAILLE PATTERN DOTS-234578 */
		0x10028df: "XK_braille_dots_1234578",   /* U+28df BRAILLE PATTERN DOTS-1234578 */
		0x10028e0: "XK_braille_dots_678",   /* U+28e0 BRAILLE PATTERN DOTS-678 */
		0x10028e1: "XK_braille_dots_1678",   /* U+28e1 BRAILLE PATTERN DOTS-1678 */
		0x10028e2: "XK_braille_dots_2678",   /* U+28e2 BRAILLE PATTERN DOTS-2678 */
		0x10028e3: "XK_braille_dots_12678",   /* U+28e3 BRAILLE PATTERN DOTS-12678 */
		0x10028e4: "XK_braille_dots_3678",   /* U+28e4 BRAILLE PATTERN DOTS-3678 */
		0x10028e5: "XK_braille_dots_13678",   /* U+28e5 BRAILLE PATTERN DOTS-13678 */
		0x10028e6: "XK_braille_dots_23678",   /* U+28e6 BRAILLE PATTERN DOTS-23678 */
		0x10028e7: "XK_braille_dots_123678",   /* U+28e7 BRAILLE PATTERN DOTS-123678 */
		0x10028e8: "XK_braille_dots_4678",   /* U+28e8 BRAILLE PATTERN DOTS-4678 */
		0x10028e9: "XK_braille_dots_14678",   /* U+28e9 BRAILLE PATTERN DOTS-14678 */
		0x10028ea: "XK_braille_dots_24678",   /* U+28ea BRAILLE PATTERN DOTS-24678 */
		0x10028eb: "XK_braille_dots_124678",   /* U+28eb BRAILLE PATTERN DOTS-124678 */
		0x10028ec: "XK_braille_dots_34678",   /* U+28ec BRAILLE PATTERN DOTS-34678 */
		0x10028ed: "XK_braille_dots_134678",   /* U+28ed BRAILLE PATTERN DOTS-134678 */
		0x10028ee: "XK_braille_dots_234678",   /* U+28ee BRAILLE PATTERN DOTS-234678 */
		0x10028ef: "XK_braille_dots_1234678",   /* U+28ef BRAILLE PATTERN DOTS-1234678 */
		0x10028f0: "XK_braille_dots_5678",   /* U+28f0 BRAILLE PATTERN DOTS-5678 */
		0x10028f1: "XK_braille_dots_15678",   /* U+28f1 BRAILLE PATTERN DOTS-15678 */
		0x10028f2: "XK_braille_dots_25678",   /* U+28f2 BRAILLE PATTERN DOTS-25678 */
		0x10028f3: "XK_braille_dots_125678",   /* U+28f3 BRAILLE PATTERN DOTS-125678 */
		0x10028f4: "XK_braille_dots_35678",   /* U+28f4 BRAILLE PATTERN DOTS-35678 */
		0x10028f5: "XK_braille_dots_135678",   /* U+28f5 BRAILLE PATTERN DOTS-135678 */
		0x10028f6: "XK_braille_dots_235678",   /* U+28f6 BRAILLE PATTERN DOTS-235678 */
		0x10028f7: "XK_braille_dots_1235678",   /* U+28f7 BRAILLE PATTERN DOTS-1235678 */
		0x10028f8: "XK_braille_dots_45678",   /* U+28f8 BRAILLE PATTERN DOTS-45678 */
		0x10028f9: "XK_braille_dots_145678",   /* U+28f9 BRAILLE PATTERN DOTS-145678 */
		0x10028fa: "XK_braille_dots_245678",   /* U+28fa BRAILLE PATTERN DOTS-245678 */
		0x10028fb: "XK_braille_dots_1245678",   /* U+28fb BRAILLE PATTERN DOTS-1245678 */
		0x10028fc: "XK_braille_dots_345678",   /* U+28fc BRAILLE PATTERN DOTS-345678 */
		0x10028fd: "XK_braille_dots_1345678",   /* U+28fd BRAILLE PATTERN DOTS-1345678 */
		0x10028fe: "XK_braille_dots_2345678",   /* U+28fe BRAILLE PATTERN DOTS-2345678 */
		0x10028ff: "XK_braille_dots_12345678",   /* U+28ff BRAILLE PATTERN DOTS-12345678 */


		/*
 * Sinhala (http://unicode.org/charts/PDF/U0D80.pdf)
 * http://www.nongnu.org/sinhala/doc/transliteration/sinhala-transliteration_6.html
 */


		0x1000d82: "XK_Sinh_ng",   /* U+0D82 SINHALA ANUSVARAYA */
		0x1000d83: "XK_Sinh_h2",   /* U+0D83 SINHALA VISARGAYA */
		0x1000d85: "XK_Sinh_a",   /* U+0D85 SINHALA AYANNA */
		0x1000d86: "XK_Sinh_aa",   /* U+0D86 SINHALA AAYANNA */
		0x1000d87: "XK_Sinh_ae",   /* U+0D87 SINHALA AEYANNA */
		0x1000d88: "XK_Sinh_aee",   /* U+0D88 SINHALA AEEYANNA */
		0x1000d89: "XK_Sinh_i",   /* U+0D89 SINHALA IYANNA */
		0x1000d8a: "XK_Sinh_ii",   /* U+0D8A SINHALA IIYANNA */
		0x1000d8b: "XK_Sinh_u",   /* U+0D8B SINHALA UYANNA */
		0x1000d8c: "XK_Sinh_uu",   /* U+0D8C SINHALA UUYANNA */
		0x1000d8d: "XK_Sinh_ri",   /* U+0D8D SINHALA IRUYANNA */
		0x1000d8e: "XK_Sinh_rii",   /* U+0D8E SINHALA IRUUYANNA */
		0x1000d8f: "XK_Sinh_lu",   /* U+0D8F SINHALA ILUYANNA */
		0x1000d90: "XK_Sinh_luu",   /* U+0D90 SINHALA ILUUYANNA */
		0x1000d91: "XK_Sinh_e",   /* U+0D91 SINHALA EYANNA */
		0x1000d92: "XK_Sinh_ee",   /* U+0D92 SINHALA EEYANNA */
		0x1000d93: "XK_Sinh_ai",   /* U+0D93 SINHALA AIYANNA */
		0x1000d94: "XK_Sinh_o",   /* U+0D94 SINHALA OYANNA */
		0x1000d95: "XK_Sinh_oo",   /* U+0D95 SINHALA OOYANNA */
		0x1000d96: "XK_Sinh_au",   /* U+0D96 SINHALA AUYANNA */
		0x1000d9a: "XK_Sinh_ka",   /* U+0D9A SINHALA KAYANNA */
		0x1000d9b: "XK_Sinh_kha",   /* U+0D9B SINHALA MAHA. KAYANNA */
		0x1000d9c: "XK_Sinh_ga",   /* U+0D9C SINHALA GAYANNA */
		0x1000d9d: "XK_Sinh_gha",   /* U+0D9D SINHALA MAHA. GAYANNA */
		0x1000d9e: "XK_Sinh_ng2",   /* U+0D9E SINHALA KANTAJA NAASIKYAYA */
		0x1000d9f: "XK_Sinh_nga",   /* U+0D9F SINHALA SANYAKA GAYANNA */
		0x1000da0: "XK_Sinh_ca",   /* U+0DA0 SINHALA CAYANNA */
		0x1000da1: "XK_Sinh_cha",   /* U+0DA1 SINHALA MAHA. CAYANNA */
		0x1000da2: "XK_Sinh_ja",   /* U+0DA2 SINHALA JAYANNA */
		0x1000da3: "XK_Sinh_jha",   /* U+0DA3 SINHALA MAHA. JAYANNA */
		0x1000da4: "XK_Sinh_nya",   /* U+0DA4 SINHALA TAALUJA NAASIKYAYA */
		0x1000da5: "XK_Sinh_jnya",   /* U+0DA5 SINHALA TAALUJA SANYOOGA NAASIKYAYA */
		0x1000da6: "XK_Sinh_nja",   /* U+0DA6 SINHALA SANYAKA JAYANNA */
		0x1000da7: "XK_Sinh_tta",   /* U+0DA7 SINHALA TTAYANNA */
		0x1000da8: "XK_Sinh_ttha",   /* U+0DA8 SINHALA MAHA. TTAYANNA */
		0x1000da9: "XK_Sinh_dda",   /* U+0DA9 SINHALA DDAYANNA */
		0x1000daa: "XK_Sinh_ddha",   /* U+0DAA SINHALA MAHA. DDAYANNA */
		0x1000dab: "XK_Sinh_nna",   /* U+0DAB SINHALA MUURDHAJA NAYANNA */
		0x1000dac: "XK_Sinh_ndda",   /* U+0DAC SINHALA SANYAKA DDAYANNA */
		0x1000dad: "XK_Sinh_tha",   /* U+0DAD SINHALA TAYANNA */
		0x1000dae: "XK_Sinh_thha",   /* U+0DAE SINHALA MAHA. TAYANNA */
		0x1000daf: "XK_Sinh_dha",   /* U+0DAF SINHALA DAYANNA */
		0x1000db0: "XK_Sinh_dhha",   /* U+0DB0 SINHALA MAHA. DAYANNA */
		0x1000db1: "XK_Sinh_na",   /* U+0DB1 SINHALA DANTAJA NAYANNA */
		0x1000db3: "XK_Sinh_ndha",   /* U+0DB3 SINHALA SANYAKA DAYANNA */
		0x1000db4: "XK_Sinh_pa",   /* U+0DB4 SINHALA PAYANNA */
		0x1000db5: "XK_Sinh_pha",   /* U+0DB5 SINHALA MAHA. PAYANNA */
		0x1000db6: "XK_Sinh_ba",   /* U+0DB6 SINHALA BAYANNA */
		0x1000db7: "XK_Sinh_bha",   /* U+0DB7 SINHALA MAHA. BAYANNA */
		0x1000db8: "XK_Sinh_ma",   /* U+0DB8 SINHALA MAYANNA */
		0x1000db9: "XK_Sinh_mba",   /* U+0DB9 SINHALA AMBA BAYANNA */
		0x1000dba: "XK_Sinh_ya",   /* U+0DBA SINHALA YAYANNA */
		0x1000dbb: "XK_Sinh_ra",   /* U+0DBB SINHALA RAYANNA */
		0x1000dbd: "XK_Sinh_la",   /* U+0DBD SINHALA DANTAJA LAYANNA */
		0x1000dc0: "XK_Sinh_va",   /* U+0DC0 SINHALA VAYANNA */
		0x1000dc1: "XK_Sinh_sha",   /* U+0DC1 SINHALA TAALUJA SAYANNA */
		0x1000dc2: "XK_Sinh_ssha",   /* U+0DC2 SINHALA MUURDHAJA SAYANNA */
		0x1000dc3: "XK_Sinh_sa",   /* U+0DC3 SINHALA DANTAJA SAYANNA */
		0x1000dc4: "XK_Sinh_ha",   /* U+0DC4 SINHALA HAYANNA */
		0x1000dc5: "XK_Sinh_lla",   /* U+0DC5 SINHALA MUURDHAJA LAYANNA */
		0x1000dc6: "XK_Sinh_fa",   /* U+0DC6 SINHALA FAYANNA */
		0x1000dca: "XK_Sinh_al",   /* U+0DCA SINHALA AL-LAKUNA */
		0x1000dcf: "XK_Sinh_aa2",   /* U+0DCF SINHALA AELA-PILLA */
		0x1000dd0: "XK_Sinh_ae2",   /* U+0DD0 SINHALA AEDA-PILLA */
		0x1000dd1: "XK_Sinh_aee2",   /* U+0DD1 SINHALA DIGA AEDA-PILLA */
		0x1000dd2: "XK_Sinh_i2",   /* U+0DD2 SINHALA IS-PILLA */
		0x1000dd3: "XK_Sinh_ii2",   /* U+0DD3 SINHALA DIGA IS-PILLA */
		0x1000dd4: "XK_Sinh_u2",   /* U+0DD4 SINHALA PAA-PILLA */
		0x1000dd6: "XK_Sinh_uu2",   /* U+0DD6 SINHALA DIGA PAA-PILLA */
		0x1000dd8: "XK_Sinh_ru2",   /* U+0DD8 SINHALA GAETTA-PILLA */
		0x1000dd9: "XK_Sinh_e2",   /* U+0DD9 SINHALA KOMBUVA */
		0x1000dda: "XK_Sinh_ee2",   /* U+0DDA SINHALA DIGA KOMBUVA */
		0x1000ddb: "XK_Sinh_ai2",   /* U+0DDB SINHALA KOMBU DEKA */
		0x1000ddc: "XK_Sinh_o2",   /* U+0DDC SINHALA KOMBUVA HAA AELA-PILLA*/
		0x1000ddd: "XK_Sinh_oo2",   /* U+0DDD SINHALA KOMBUVA HAA DIGA AELA-PILLA*/
		0x1000dde: "XK_Sinh_au2",   /* U+0DDE SINHALA KOMBUVA HAA GAYANUKITTA */
		0x1000ddf: "XK_Sinh_lu2",   /* U+0DDF SINHALA GAYANUKITTA */
		0x1000df2: "XK_Sinh_ruu2",   /* U+0DF2 SINHALA DIGA GAETTA-PILLA */
		0x1000df3: "XK_Sinh_luu2",   /* U+0DF3 SINHALA DIGA GAYANUKITTA */
		0x1000df4: "XK_Sinh_kunddaliya",   /* U+0DF4 SINHALA KUNDDALIYA */
	]);

	if (keysym in conv_table) {
		return conv_table[keysym];
	}
	return "XK_UNKNOWN";
}
