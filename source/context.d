module context;

import xcb.xcb;

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
}
