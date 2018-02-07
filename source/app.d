import event_string;
import event;
import init;

import xcb.xcb;
import std.stdio;
import std.conv;
import std.experimental.logger;

void main(string[] argv)
{

	auto ctx = init_wmderful();

	// event loop
	for (;;) {
		// block for event
		auto event = xcb_wait_for_event(ctx.conn);
		info(event.toString());
		switch (event.response_type&0x7f) {
		case XCB_MAP_REQUEST:
			// when window creation is requested
			auto e = cast(xcb_map_request_event_t*)event;
			on_map_request(ctx, e);
			break;
		case XCB_CONFIGURE_REQUEST:
			// when changing window information is requested
			auto e = cast(xcb_configure_request_event_t*)event;
			on_configure_request(ctx, e);
			break;
		case XCB_BUTTON_PRESS:
			// when mouse button pressed
			auto e = cast(xcb_button_press_event_t*)event;
			on_button_press(ctx, e);
			break;
		case XCB_MOTION_NOTIFY:
			// when mouse cursor dragged
			auto e = cast(xcb_motion_notify_event_t*)event;
			on_motion_notify(ctx, e);
			break;
		case XCB_BUTTON_RELEASE:
			// when mouse cursor dragged
			auto e = cast(xcb_button_release_event_t*)event;
			on_button_release(ctx, e);
			break;
		default:
			break;
		}
	}

}
