module context;

import xcb.xcb;
import xkbcommon.xkbcommon;

/// containing variables which many times referenced 
class Context
{
public:
	// constants
	static const uint ROOT_EVENT_MASK =
		XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT|  // ConfigureRequest, MapRequest
		XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY|  // ConfigureNotify, CreateNotify, DestroyNotify, MapNotify, UnmapNotify
		XCB_EVENT_MASK_KEY_PRESS|  // KeyPress
		XCB_EVENT_MASK_KEY_RELEASE;  // KeyRelease

	// variables
	xcb_connection_t* conn;  /// connection to the X server
	xcb_screen_t* screen;   /// default screen
	XkbContext xkb;
}

class XkbContext
{
public:
	xkb_context* ctx;
	xkb_state* state;
	xkb_keymap* keymap;
	int device_id;  /// ?
	ubyte event_base_xkb;  /// use for determine that is event related with xkb
}
