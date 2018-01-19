import xcb.xcb;
import xcb.keysyms;
import xcb.xkb;
import keysymdef;
import xkbcommon.xkbcommon;
import xkbcommon.x11;

import conf;
import keyboard;
import event;

import std.experimental.logger;


void main()
{
	// 初期化する
	auto conf = new Conf();
	conf.conn = xcb_connect(null, null);
	if (conf.conn is null || xcb_connection_has_error(conf.conn) != 0) {
		fatal("failed to connect X server");
	}

	conf.x_setup();
	info("wmderful has started");

	conf.keyboard_setup();
	info("keybord setting up");


	// event-loop
	for (;;) {
		auto ev = xcb_wait_for_event(conf.conn);
		infof("EVENT: %s", event_to_string(ev));
		switch (ev.response_type & 0x7f) {
		case XCB_KEY_PRESS:
			auto e = cast(xcb_key_press_event_t*)ev;
			keypress(conf, e);
			info("XCB_BUTTON_PRESS");
			break;
		case XCB_MOTION_NOTIFY:
			info("XCB_MOTION_NOTIFY");
			break;
		case XCB_BUTTON_RELEASE:
			info("XCB_BUTTON_RELEASE");
			break;
		default:
			if (ev.response_type == conf.event_base_xkb) {
				handle_xkb_event(conf, ev);
			}
			break;
		}
	}

}
