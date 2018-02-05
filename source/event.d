/// event handlers.
module event;

import context;

import xcb.xcb;

/// on map request event is catched
/// pass the arguments to xcb_map_window
void on_map_request(Context ctx, xcb_map_request_event_t* e)
{
	xcb_window_t window = e.window;  // target of request
	xcb_map_window(ctx.conn, window);
	xcb_flush(ctx.conn);
}

