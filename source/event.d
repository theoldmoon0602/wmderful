/// event handlers.
module event;

import context;

import xcb.xcb;

/// handling map request event
/// pass the arguments to xcb_map_window
void on_map_request(Context ctx, xcb_map_request_event_t* e)
{
	xcb_window_t window = e.window;  // target of request
	xcb_map_window(ctx.conn, window);
	xcb_grab_button(ctx.conn, 1, // 1: tell event to window, 0: not
			window,
			XCB_EVENT_MASK_BUTTON_PRESS|
			XCB_EVENT_MASK_BUTTON_RELEASE|
			XCB_EVENT_MASK_POINTER_MOTION,
			XCB_GRAB_MODE_ASYNC, // pointer mode
			XCB_GRAB_MODE_ASYNC, // keyboard mode
			XCB_NONE, XCB_NONE, // confine_to, cursor,
			XCB_BUTTON_INDEX_ANY,  // any buttons (left, right, middle and...)
			XCB_MOD_MASK_ANY // any key combinations
	);
	xcb_flush(ctx.conn);
}

/// handling configure request event
/// pass the arguments to xcb_configure_window
void on_configure_request(Context ctx, xcb_configure_request_event_t* e)
{
	xcb_window_t window = e.window;  // target of request
	ushort value_mask = 0;
	uint[] value_list;

	// check mask and set value
	// (copied from awesome/event.c)
	if (e.value_mask & XCB_CONFIG_WINDOW_X) {
		value_mask |= XCB_CONFIG_WINDOW_X;
		value_list ~= e.x;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_Y) {
		value_mask |= XCB_CONFIG_WINDOW_Y;
		value_list ~= e.y;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_WIDTH) {
		value_mask |= XCB_CONFIG_WINDOW_WIDTH;
		value_list ~= e.width;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_HEIGHT) {
		value_mask |= XCB_CONFIG_WINDOW_HEIGHT;
		value_list ~= e.height;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_BORDER_WIDTH) {
		value_mask |= XCB_CONFIG_WINDOW_BORDER_WIDTH;
		value_list ~= e.border_width;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_SIBLING) {
		value_mask |= XCB_CONFIG_WINDOW_SIBLING;
		value_list ~= e.sibling;
	}
	if (e.value_mask & XCB_CONFIG_WINDOW_STACK_MODE) {
		value_mask |= XCB_CONFIG_WINDOW_STACK_MODE;
		value_list ~= e.stack_mode;
	}

	xcb_configure_window(ctx.conn, window, value_mask, value_list.ptr);
	xcb_flush(ctx.conn);
}
