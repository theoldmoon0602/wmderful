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
			break;
		case XCB_DESTROY_NOTIFY:
			auto e = cast(xcb_destroy_notify_event_t*)ev;
			destroynotify(conf, e);
			break;
		case XCB_EXPOSE:
			auto e = cast(xcb_expose_event_t*)ev;
			expose(conf, e);
			break;
		case XCB_MAP_REQUEST:
			auto e = cast(xcb_map_request_event_t*)ev;
			maprequest(conf, e);
			break;
		case XCB_BUTTON_PRESS:
			auto e = cast(xcb_button_press_event_t*)ev;
			buttonpress(conf, e);
			break;
		case XCB_MOTION_NOTIFY:
			auto e = cast(xcb_motion_notify_event_t*)ev;
			motionnotify(conf, e);
			break;
		case XCB_BUTTON_RELEASE:
			auto e = cast(xcb_button_release_event_t*)ev;
			buttonrelease(conf, e);
			break;
		case XCB_ENTER_NOTIFY:
			auto e = cast(xcb_enter_notify_event_t*)ev;
			enternotify(conf, e);
			break;
		default:
			if (ev.response_type == conf.event_base_xkb) {
				handle_xkb_event(conf, ev);
			}
			break;
		}
	}

}
