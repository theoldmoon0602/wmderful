import xcb.xcb;
import xcb_event;

import std.experimental.logger;
import std.conv;


string toString(xcb_generic_event_t* event) {
  import std.conv;
  return (cast(XcbEventType)event.type()).to!string;
}
uint type(xcb_generic_event_t* event) {
  return event.response_type & 0x7f;
}

void main()
{
  // start
  auto conn = xcb_connect(null, null);  // displayname, screenp
  if (conn is null) {
    fatal("Unable to connect to the X server.");
  }
  auto screen = xcb_setup_roots_iterator(xcb_get_setup(conn)).data;

  // xcb_grab_server(conn);
  // SubstructureRedirectはroot windowにのみ設定できる
  uint select_input_val =
    XCB_EVENT_MASK_KEY_PRESS|
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT| // CirtulateRequest, ConfigureRequest, MapRequest
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY; // CirculateNotify, ConfigureNotify, DestroyNotify, GraviyNotify, MapNotify, ReparentNotify, UnmapNotify
  
  auto cookie = xcb_change_window_attributes_checked(conn, screen.root, XCB_CW_EVENT_MASK, &select_input_val);
  if (auto error = xcb_request_check(conn, cookie)) {
    fatal("another window manager is already running (can't select SubstructureRedirect)");
  }
  // xcb_ungrab_server(conn);
  info("wmDerful has been started");

  // event loop
 eventloop: for (;;) {
    auto event = xcb_wait_for_event(conn);
    if (event is null) {
      fatal("I/O error detected");
    }
    switch (event.type()) {
    case XCB_KEY_PRESS:
      info("button pressed");
      break eventloop;
    default:
      infof("got event: %s", event.toString());
      break;
    }
  }
}
