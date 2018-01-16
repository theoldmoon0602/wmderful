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
  info("wmDerful has been started");
}
