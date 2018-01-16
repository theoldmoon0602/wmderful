import xcb.xcb;

import std.experimental.logger;

void main()
{
  auto conn = xcb_connect(null, null);  // displayname, screenp
  if (conn is null) {
    fatal("Unable to connect to the X server.");
  }
  info("wmDerful has been started");
}
