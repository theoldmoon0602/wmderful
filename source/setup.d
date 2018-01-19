import xcb.xcb;
import xcb.keysyms;

import conf;

import std.experimental.logger;

void setup(Conf conf) {
	conf.screen = xcb_setup_roots_iterator(xcb_get_setup(conf.conn)).data;
	conf.root = conf.screen.root;

	conf.keysyms = xcb_key_symbols_alloc(conf.conn);

	// Xサーバを占有（邪魔されたくない）
	xcb_grab_server(conf.conn);
	uint root_event_mask = XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT|
		XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY|
		XCB_EVENT_MASK_ENTER_WINDOW|
		XCB_EVENT_MASK_LEAVE_WINDOW|
		XCB_EVENT_MASK_STRUCTURE_NOTIFY|
		XCB_EVENT_MASK_KEY_PRESS|
		XCB_EVENT_MASK_KEY_RELEASE|
		XCB_EVENT_MASK_BUTTON_PRESS|
		XCB_EVENT_MASK_BUTTON_RELEASE|
		XCB_EVENT_MASK_FOCUS_CHANGE|
		XCB_EVENT_MASK_PROPERTY_CHANGE;
	auto cookie = xcb_change_window_attributes_checked(conf.conn, conf.root, XCB_CW_EVENT_MASK, &root_event_mask);
	if (xcb_request_check(conf.conn, cookie) !is null) {
		fatal("another window manager is already running");		
	}

	xcb_flush(conf.conn);  // めっちゃいる

	// 解放できるならASAPで解放しないとほんとにだめ
	xcb_ungrab_server(conf.conn);
}

