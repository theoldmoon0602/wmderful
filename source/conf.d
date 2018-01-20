import xcb.xcb;
import xcb.xkb;
import xcb.keysyms;
import xkbcommon.xkbcommon;

import client;

import std.experimental.logger;

class Conf {
public:
	const uint ROOT_EVENT_MASK = XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT|
		XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY|
		XCB_EVENT_MASK_STRUCTURE_NOTIFY|
		XCB_EVENT_MASK_EXPOSURE|
		XCB_EVENT_MASK_ENTER_WINDOW|
		XCB_EVENT_MASK_LEAVE_WINDOW|
		XCB_EVENT_MASK_POINTER_MOTION|
		// XCB_EVENT_MASK_POINTER_MOTION_HINT|
		XCB_EVENT_MASK_KEY_PRESS|
		XCB_EVENT_MASK_KEY_RELEASE|
		XCB_EVENT_MASK_BUTTON_PRESS|
		XCB_EVENT_MASK_BUTTON_RELEASE|
		XCB_EVENT_MASK_FOCUS_CHANGE|
		XCB_EVENT_MASK_PROPERTY_CHANGE;
	const uint NO_EVENT_MASK = XCB_EVENT_MASK_NO_EVENT;

	xcb_connection_t* conn;
	xcb_screen_t* screen;
	xcb_window_t root;

	xcb_key_symbols_t* keysyms;

	xkb_state* state;
	xkb_context* context;
	xkb_keymap* keymap;
	int device_id;
	ubyte event_base_xkb;  // 飛んできたイベントがxkbに関連するものかどうかを識別するのに使う

	Client[xcb_window_t] clients;
	Client current;

	Client dragging = null;
	int oldx, oldy;
	int winx, winy;

}

// atomic な動作が必要になったらxcb_grab_serverを思い出して
void x_setup(Conf conf) {
	conf.screen = xcb_setup_roots_iterator(xcb_get_setup(conf.conn)).data;
	conf.root = conf.screen.root;

	conf.keysyms = xcb_key_symbols_alloc(conf.conn);

	auto cookie = xcb_change_window_attributes_checked(conf.conn, conf.root, XCB_CW_EVENT_MASK, &conf.ROOT_EVENT_MASK);
	if (xcb_request_check(conf.conn, cookie) !is null) {
		fatal("another window manager is already running");		
	}

	xcb_flush(conf.conn);  // めっちゃいる
}

