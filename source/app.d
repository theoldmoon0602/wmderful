import xcb.xcb;

import std.experimental.logger;

void main()
{
  // start
  auto conn = xcb_connect(null, null);  // displayname, screenp
  if (conn is null) {
    fatal("Unable to connect to the X server.");
  }
  auto screen = xcb_setup_roots_iterator(xcb_get_setup(conn)).data;

  // SubstructureRedirectはroot windowにのみ設定できる
  uint select_input_val =
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT| // CirtulateRequest, ConfigureRequest, MapRequest
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY; // CirculateNotify, ConfigureNotify, DestroyNotify, GraviyNotify, MapNotify, ReparentNotify, UnmapNotify
  auto cookie = xcb_change_window_attributes_checked(conn, screen.root, XCB_CW_EVENT_MASK, &select_input_val);
  if (auto error = xcb_request_check(conn, cookie)) {
    fatal("another window manager is already running (can't select SubstructureRedirect)");
  }

  info("wmDerful has been started");
}
