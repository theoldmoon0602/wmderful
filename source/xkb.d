module xkb;

import context;

import xcb.xkb;
import xkbcommon.xkbcommon;
import std.experimental.logger;

void init_xkb(Context ctx)
{
	// request to use xkb extension
	auto xkb_extension_cookie = xcb_xkb_use_extension(ctx.conn,
			XCB_XKB_MAJOR_VERSION,
			XCB_XKB_MINOR_VERSION);
	auto reply = xcb_xkb_use_extension_reply(ctx.conn, xkb_extension_cookie, null);
	if (reply is null || !reply.supported) {
		warning("failed to setup xkb extension");
		return;
	}

	auto context = xkb_context_new(XKB_CONTEXT_NO_FLAGS);
	if (context is null) {
		warning("failed to get xkb context");
		return;
	}

	// get device id
	auto device_info_cookie = xcb_xkb_get_device_info(ctx.conn, XCB_XKB_ID_USE_CORE_KBD, 0, 0, 0, 0, 0, 0);
	auto device_info_reply = xcb_xkb_get_device_info_reply(ctx.conn, device_info_cookie, null);
	if (device_info_reply is null) {
		warning("failed to get xkb device id");
		return;
	}
	if (device_info_reply.deviceID == -1) {
		warning("failed to get xkb device id");
		return;
	}
	auto device_id = device_info_reply.deviceID;
}
