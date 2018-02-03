import xcb.xcb;

import event_string;
import init;

import std.stdio;
import std.conv;

void main(string[] argv)
{

	auto ctx = init_wmderful();

	// event loop
	for (;;) {
		// block for event
		auto event = xcb_wait_for_event(ctx.conn);
		writeln(event.toString());
	}

}
