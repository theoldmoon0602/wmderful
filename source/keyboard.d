import conf;

import xcb.xcb;
import xcb.xkb;
import xkbcommon.xkbcommon;
import xkbcommon.x11;

import std.experimental.logger;

void keyboard_setup(Conf conf) {
	// xkbは拡張モジュールなのでロードする
	auto xkb_extension_cookie = xcb_xkb_use_extension(conf.conn,
			XCB_XKB_MAJOR_VERSION,
			XCB_XKB_MINOR_VERSION);
	auto reply = xcb_xkb_use_extension_reply(conf.conn, xkb_extension_cookie, null);
	if (reply is null || !reply.supported) {
		fatal("failed to setup xkb extension");
	}

	conf.context = xkb_context_new(XKB_CONTEXT_NO_FLAGS);
	if (conf.context is null) {
		fatal("failed to get xkb context");
	}

	auto device_info_cookie = xcb_xkb_get_device_info(conf.conn, XCB_XKB_ID_USE_CORE_KBD, 0, 0, 0, 0, 0, 0);
	auto device_info_reply = xcb_xkb_get_device_info_reply(conf.conn, device_info_cookie, null);
	if (device_info_reply is null) {
		fatal("failed to get xkb device id");
	}
	if (device_info_reply.deviceID == -1) {
		fatal("failed to get xkb device id");
	}
	conf.device_id = device_info_reply.deviceID;

	// xkbのイベントを拾うためにやる
	select_xkb_events_for_device(conf);

	update_keymap(conf);
}

void update_keymap(Conf conf) {

	auto new_keymap = xkb_x11_keymap_new_from_device(conf.context, conf.conn, conf.device_id, XKB_KEYMAP_COMPILE_NO_FLAGS);
	if (new_keymap is null) {
		fatal("failed to get keymap from device");
	}

	auto new_state = xkb_x11_state_new_from_device(new_keymap, conf.conn, conf.device_id);
	if (new_state is null) {
		fatal("failed to get xkb state from device");
	}
	xkb_state_unref(conf.state);
	xkb_keymap_unref(conf.keymap);
	conf.state = new_state;
	conf.keymap = new_keymap;

	info("keymap updated");

}

/// xkbで拾うイベントを指定
void select_xkb_events_for_device(Conf conf) {
	ushort map = XCB_XKB_EVENT_TYPE_STATE_NOTIFY|
		XCB_XKB_EVENT_TYPE_MAP_NOTIFY|
		XCB_XKB_EVENT_TYPE_NEW_KEYBOARD_NOTIFY;
	ushort map_parts = XCB_XKB_MAP_PART_KEY_TYPES|
		XCB_XKB_MAP_PART_KEY_SYMS|
		XCB_XKB_MAP_PART_MODIFIER_MAP|
		XCB_XKB_MAP_PART_EXPLICIT_COMPONENTS|
		XCB_XKB_MAP_PART_KEY_ACTIONS|
		XCB_XKB_MAP_PART_KEY_BEHAVIORS|
		XCB_XKB_MAP_PART_VIRTUAL_MODS|
		XCB_XKB_MAP_PART_VIRTUAL_MOD_MAP;

	// 飛んでくるイベントを指定
	xcb_xkb_select_events(conf.conn, XCB_XKB_ID_USE_CORE_KBD, map, 0, map, map_parts, map_parts, null);

	// 拾えるように値を取得
	auto xkb_reply = xcb_get_extension_data(conf.conn, &xcb_xkb_id);   // xcb_xkb_idは定義されている
	if (xkb_reply !is null && xkb_reply.present != 0) {
		conf.event_base_xkb = xkb_reply.first_event;
	}
}

void handle_xkb_event(Conf conf, xcb_generic_event_t* event) {
	switch (event.pad0) {
	case XCB_XKB_NEW_KEYBOARD_NOTIFY:
		info("XCB_XKB_NEW_KEYBOARD_NOTIFY");
		update_keymap(conf);
		break;
	case XCB_XKB_MAP_NOTIFY:
		info("XCB_XKB_MAP_NOTIFY");
		update_keymap(conf);
		break;
	case XCB_XKB_STATE_NOTIFY:
		info("XCB_XKB_STATE_NOTIFY");
		auto state_notify = cast(xcb_xkb_state_notify_event_t*)event;
		xkb_state_update_mask(conf.state, state_notify.baseMods, state_notify.latchedMods, state_notify.lockedMods, state_notify.baseGroup, state_notify.latchedGroup, state_notify.lockedGroup);
		info("mask updated");
		break;
	default:
		info("XKB_EVENT");
		break;
	}
}
