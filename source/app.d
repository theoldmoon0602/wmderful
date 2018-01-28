import xcb.xcb;

import event_string;

import std.stdio;
import std.conv;
import std.experimental.logger;

void main(string[] argv)
{
	// xcb_connection_t* xcb_connect(const char* displayname, int* screenp);
	//
	// if displayname is null, uses the value of environment variable DISPLAY.
	// Its has format like <servername>:<displaynumber>. usually :0 (= localhost:0.0)
	//
	// return value is always non-null value
	auto conn = xcb_connect(null, null);  

	// 0 returns if non-error
	// otherwise returns error code which > 0
	int error_code = xcb_connection_has_error(conn);
	if (error_code > 0) {
		fatal("failed to connect X server.");
	}

	// this is an idiom to get screen and root window
	// confirmation required: in multiscreen environment
	auto screen = xcb_setup_roots_iterator(xcb_get_setup(conn)).data;
	auto root = screen.root;

	// check an existance of another window manager
	// only one application(=windowmanager) is able to set a SubstructureRedirect mask 
	// "checked" postfixed function is blocking. explicitly check for error by xcb_request_check
	//
	// xcb_request_check returns xcb_generic_error_t* type value if error occured
	// otherwise returns null
	uint ROOT_EVENT_MASK =
		XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT|  // ConfigureRequest, MapRequest
		XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY|  // ConfigureNotify, CreateNotify, DestroyNotify, MapNotify, UnmapNotify
		XCB_EVENT_MASK_KEY_PRESS|  // KeyPress
		XCB_EVENT_MASK_KEY_RELEASE;  // KeyRelease
	auto cookie = xcb_change_window_attributes_checked(conn, root, XCB_CW_EVENT_MASK, &ROOT_EVENT_MASK);
	if (xcb_request_check(conn, cookie) !is null) {
		fatal("another window manager is already running.");
	}
	info("wmderful started!");


	// event loop
	for (;;) {
		// block for event
		auto event = xcb_wait_for_event(conn);
		writeln(event.toString());
	}

}
