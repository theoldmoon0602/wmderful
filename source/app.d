import xcb.xcb;
import xcb_event;

import std.experimental.logger;
import std.conv;

class Xcb {
private:

  static Xcb instance;
  xcb_connection_t* conn;
  xcb_screen_t* screen;

  this(xcb_connection_t* conn, xcb_screen_t* screen) {
    this.conn = conn;
    this.screen = screen;
  }
  
public:
  static this() {
    this.instance = null;
  }
  static Xcb create() {
    if (this.instance !is null) {
      return this.instance;
    }
    
    auto conn = xcb_connect(null, null);  // displayname, screenp
    if (conn is null) {
      fatal("Unable to connect to the X server.");
    }
    auto screen = xcb_setup_roots_iterator(xcb_get_setup(conn)).data;
    
    this.instance = new this(conn, screen);
    return this.instance;
  }

  void set_handling_event(uint event_mask) {
    auto cookie = xcb_change_window_attributes_checked(this.conn, this.screen.root, XCB_CW_EVENT_MASK, &event_mask);
    if (auto error = xcb_request_check(this.conn, cookie)) {
      fatal("another window manager is already running (can't select SubstructureRedirect)");
    }
  }

  xcb_generic_event_t* wait_for_event() {
    return xcb_wait_for_event(this.conn);
  }
}

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
  Xcb xcb = Xcb.create();

  // xcb_grab_server(conn);
  // SubstructureRedirectはroot windowにのみ設定できる
  uint select_input_val =
    XCB_EVENT_MASK_KEY_PRESS|
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT| // CirtulateRequest, ConfigureRequest, MapRequest
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY; // CirculateNotify, ConfigureNotify, DestroyNotify, GraviyNotify, MapNotify, ReparentNotify, UnmapNotify
  xcb.set_handling_event(select_input_val);
  // xcb_ungrab_server(conn);
  info("wmDerful has been started");

  // event loop
 eventloop: for (;;) {
    auto event = xcb.wait_for_event();
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
