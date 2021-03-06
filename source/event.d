import xcb.xcb;
import xkbcommon.xkbcommon;
import xkbcommon.keysyms;

import conf;
import keysymdef;
import client;

import std.experimental.logger;

string event_to_string(xcb_generic_event_t* event) {
	import std.conv;
	return (cast(XcbEventType)event.response_type).to!string();
}

// キーが押されたとき
void keypress(Conf conf, xcb_key_press_event_t* e) {
	import std.conv;

	auto keymap = xkb_state_get_keymap(conf.state);
	auto layout = xkb_state_key_get_layout(conf.state, e.detail);
	auto layout_str = xkb_keymap_layout_get_name(keymap, layout).to!string();
	info("keyboard layout: ", layout_str);

	auto sym = xkb_state_key_get_one_sym(conf.state, e.detail);
	info(keysym_to_string(sym));

	if (sym == XKB_KEY_q && (e.state &XCB_MOD_MASK_1) && conf.focusing !is null) {
		quit_cilent(conf, conf.focusing);
	}

	if (sym == XKB_KEY_space) {
		import std.process;
		spawnProcess("gnome-terminal");
		info("spawn process");
	}
}

void buttonpress(Conf conf, xcb_button_press_event_t* e) {
	if (e.detail == XCB_BUTTON_INDEX_1 && (e.state & XCB_MOD_MASK_1)) {  // Alt
		if (conf.focusing !is null && conf.is_moving is null) {
			auto geometry_c = xcb_get_geometry(conf.conn, conf.focusing.frame);
			auto geometry_r = xcb_get_geometry_reply(conf.conn, geometry_c, null);
			if (geometry_r is null) {
				warning("failed to get geometry");
				return;
			}

			conf.is_moving = conf.focusing;
			conf.oldx = geometry_r.x-e.root_x;
			conf.oldy = geometry_r.y-e.root_y;

			info("start to move window");
		}
	}
}
void motionnotify(Conf conf, xcb_motion_notify_event_t* e) {
	if (auto client = e.event in conf.clients) {
		if (*client == conf.is_moving) {
			uint[] values = [
				conf.oldx+e.root_x,
				conf.oldy+e.root_y,
			];
			xcb_configure_window(conf.conn, conf.focusing.frame, cast(ushort)(XCB_CONFIG_WINDOW_X|XCB_CONFIG_WINDOW_Y), values.ptr);
			xcb_flush(conf.conn);

			infof("moving to (%d, %d)", values[0], values[1]);
		}
	}
}
void buttonrelease(Conf conf, xcb_button_release_event_t* e) {
	if (e.detail == XCB_BUTTON_INDEX_1 || !(e.state & XCB_MOD_MASK_1)) {
		conf.is_moving = null;
		info("end to move window");
	}
}

void destroynotify(Conf conf, xcb_destroy_notify_event_t* e) {
	if (auto client = e.window in conf.clients) {
		quit_cilent(conf, *client);
		info("unmanage window: ", e.window);
	}
}

void maprequest(Conf conf, xcb_map_request_event_t* e) {
	if (e.window !in conf.clients) {
		map_new_client(conf, e);
	}
}

void enternotify(Conf conf, xcb_enter_notify_event_t* e) {
	if (auto client = e.event in conf.clients) {
		focus_client(conf, *client);
		info("focus in to: ", conf.focusing.window);
	}
}

void expose(Conf conf, xcb_expose_event_t* e) {
	auto attributes_c = xcb_get_window_attributes(conf.conn, e.window);
	auto attributes_r = xcb_get_window_attributes_reply(conf.conn, attributes_c, null);
	if (attributes_r is null) {
		warning("failed to get window attributes");
		return;
	}
	info("got attributes");

}

// XCB_EVENT as enum
enum XcbEventType {
  XCB_KEY_PRESS=2,
  XCB_KEY_RELEASE=3,
  XCB_BUTTON_PRESS=4,
  XCB_BUTTON_RELEASE=5,
  XCB_MOTION_NOTIFY=6,
  XCB_ENTER_NOTIFY=7,
  XCB_LEAVE_NOTIFY=8,
  XCB_FOCUS_IN=9,
  XCB_FOCUS_OUT=10,
  XCB_KEYMAP_NOTIFY=11,
  XCB_EXPOSE=12,
  XCB_GRAPHICS_EXPOSURE=13,
  XCB_NO_EXPOSURE=14,
  XCB_VISIBILITY_NOTIFY=15,
  XCB_CREATE_NOTIFY=16,
  XCB_DESTROY_NOTIFY=17,
  XCB_UNMAP_NOTIFY=18,
  XCB_MAP_NOTIFY=19,
  XCB_MAP_REQUEST=20,
  XCB_REPARENT_NOTIFY=21,
  XCB_CONFIGURE_NOTIFY=22,
  XCB_CONFIGURE_REQUEST=23,
  XCB_GRAVITY_NOTIFY=24,
  XCB_RESIZE_REQUEST=25,
  XCB_CIRCULATE_NOTIFY=26,
  XCB_CIRCULATE_REQUEST=27,
  XCB_PROPERTY_NOTIFY=28,
  XCB_SELECTION_CLEAR=29,
  XCB_SELECTION_REQUEST=30,
  XCB_SELECTION_NOTIFY=31,
  XCB_COLORMAP_NOTIFY=32,
  XCB_CLIENT_MESSAGE=33,
  XCB_MAPPING_NOTIFY=34,
  XCB_GE_GENERIC=35,
  XCB_REQUEST=1,
  XCB_VALUE=2,
  XCB_WINDOW=3,
  XCB_PIXMAP=4,
  XCB_ATOM=5,
  XCB_CURSOR=6,
  XCB_FONT=7,
  XCB_MATCH=8,
  XCB_DRAWABLE=9,
  XCB_ACCESS=10,
  XCB_ALLOC=11,
  XCB_COLORMAP=12,
  XCB_G_CONTEXT=13,
  XCB_ID_CHOICE=14,
  XCB_NAME=15,
  XCB_LENGTH=16,
  XCB_IMPLEMENTATION=17,
  XCB_CREATE_WINDOW=1,
  XCB_CHANGE_WINDOW_ATTRIBUTES=2,
  XCB_GET_WINDOW_ATTRIBUTES=3,
  XCB_DESTROY_WINDOW=4,
  XCB_DESTROY_SUBWINDOWS=5,
  XCB_CHANGE_SAVE_SET=6,
  XCB_REPARENT_WINDOW=7,
  XCB_MAP_WINDOW=8,
  XCB_MAP_SUBWINDOWS=9,
  XCB_UNMAP_WINDOW=10,
  XCB_UNMAP_SUBWINDOWS=11,
  XCB_CONFIGURE_WINDOW=12,
  XCB_CIRCULATE_WINDOW=13,
  XCB_GET_GEOMETRY=14,
  XCB_QUERY_TREE=15,
  XCB_INTERN_ATOM=16,
  XCB_GET_ATOM_NAME=17,
  XCB_CHANGE_PROPERTY=18,
  XCB_DELETE_PROPERTY=19,
  XCB_GET_PROPERTY=20,
  XCB_LIST_PROPERTIES=21,
  XCB_SET_SELECTION_OWNER=22,
  XCB_GET_SELECTION_OWNER=23,
  XCB_CONVERT_SELECTION=24,
  XCB_SEND_EVENT=25,
  XCB_GRAB_POINTER=26,
  XCB_UNGRAB_POINTER=27,
  XCB_GRAB_BUTTON=28,
  XCB_UNGRAB_BUTTON=29,
  XCB_CHANGE_ACTIVE_POINTER_GRAB=30,
  XCB_GRAB_KEYBOARD=31,
  XCB_UNGRAB_KEYBOARD=32,
  XCB_GRAB_KEY=33,
  XCB_UNGRAB_KEY=34,
  XCB_ALLOW_EVENTS=35,
  XCB_GRAB_SERVER=36,
  XCB_UNGRAB_SERVER=37,
  XCB_QUERY_POINTER=38,
  XCB_GET_MOTION_EVENTS=39,
  XCB_TRANSLATE_COORDINATES=40,
  XCB_WARP_POINTER=41,
  XCB_SET_INPUT_FOCUS=42,
  XCB_GET_INPUT_FOCUS=43,
  XCB_QUERY_KEYMAP=44,
  XCB_OPEN_FONT=45,
  XCB_CLOSE_FONT=46,
  XCB_QUERY_FONT=47,
  XCB_QUERY_TEXT_EXTENTS=48,
  XCB_LIST_FONTS=49,
  XCB_LIST_FONTS_WITH_INFO=50,
  XCB_SET_FONT_PATH=51,
  XCB_GET_FONT_PATH=52,
  XCB_CREATE_PIXMAP=53,
  XCB_FREE_PIXMAP=54,
  XCB_CREATE_GC=55,
  XCB_CHANGE_GC=56,
  XCB_COPY_GC=57,
  XCB_SET_DASHES=58,
  XCB_SET_CLIP_RECTANGLES=59,
  XCB_FREE_GC=60,
  XCB_CLEAR_AREA=61,
  XCB_COPY_AREA=62,
  XCB_COPY_PLANE=63,
  XCB_POLY_POINT=64,
  XCB_POLY_LINE=65,
  XCB_POLY_SEGMENT=66,
  XCB_POLY_RECTANGLE=67,
  XCB_POLY_ARC=68,
  XCB_FILL_POLY=69,
  XCB_POLY_FILL_RECTANGLE=70,
  XCB_POLY_FILL_ARC=71,
  XCB_PUT_IMAGE=72,
  XCB_GET_IMAGE=73,
  XCB_POLY_TEXT_8=74,
  XCB_POLY_TEXT_16=75,
  XCB_IMAGE_TEXT_8=76,
  XCB_IMAGE_TEXT_16=77,
  XCB_CREATE_COLORMAP=78,
  XCB_FREE_COLORMAP=79,
  XCB_COPY_COLORMAP_AND_FREE=80,
  XCB_INSTALL_COLORMAP=81,
  XCB_UNINSTALL_COLORMAP=82,
  XCB_LIST_INSTALLED_COLORMAPS=83,
  XCB_ALLOC_COLOR=84,
  XCB_ALLOC_NAMED_COLOR=85,
  XCB_ALLOC_COLOR_CELLS=86,
  XCB_ALLOC_COLOR_PLANES=87,
  XCB_FREE_COLORS=88,
  XCB_STORE_COLORS=89,
  XCB_STORE_NAMED_COLOR=90,
  XCB_QUERY_COLORS=91,
  XCB_LOOKUP_COLOR=92,
  XCB_CREATE_CURSOR=93,
  XCB_CREATE_GLYPH_CURSOR=94,
  XCB_FREE_CURSOR=95,
  XCB_RECOLOR_CURSOR=96,
  XCB_QUERY_BEST_SIZE=97,
  XCB_QUERY_EXTENSION=98,
  XCB_LIST_EXTENSIONS=99,
  XCB_CHANGE_KEYBOARD_MAPPING=100,
  XCB_GET_KEYBOARD_MAPPING=101,
  XCB_CHANGE_KEYBOARD_CONTROL=102,
  XCB_GET_KEYBOARD_CONTROL=103,
  XCB_BELL=104,
  XCB_CHANGE_POINTER_CONTROL=105,
  XCB_GET_POINTER_CONTROL=106,
  XCB_SET_SCREEN_SAVER=107,
  XCB_GET_SCREEN_SAVER=108,
  XCB_CHANGE_HOSTS=109,
  XCB_LIST_HOSTS=110,
  XCB_SET_ACCESS_CONTROL=111,
  XCB_SET_CLOSE_DOWN_MODE=112,
  XCB_KILL_CLIENT=113,
  XCB_ROTATE_PROPERTIES=114,
  XCB_FORCE_SCREEN_SAVER=115,
  XCB_SET_POINTER_MAPPING=116,
  XCB_GET_POINTER_MAPPING=117,
  XCB_SET_MODIFIER_MAPPING=118,
  XCB_GET_MODIFIER_MAPPING=119,
  XCB_NO_OPERATION=127,
}
