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
		default:
			break;
		}
	}

}
