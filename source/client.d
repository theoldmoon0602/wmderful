import xcb.xcb;

import conf;

import std.experimental.logger;

class Client {
public:
	xcb_window_t window;
	xcb_window_t frame;
}

auto get_window_geometry(Conf conf, xcb_window_t window) {
	auto geometry_c = xcb_get_geometry(conf.conn, window);
	auto geometry_r = xcb_get_geometry_reply(conf.conn, geometry_c, null);
	if (geometry_r is null) {
		warning("failed to get geometry");
		return null;
	}
	return geometry_r;
}


void map_new_client(Conf conf, xcb_map_request_event_t* e) {
	auto attributes_c = xcb_get_window_attributes(conf.conn, e.window);
	auto attributes_r = xcb_get_window_attributes_reply(conf.conn, attributes_c, null);
	if (attributes_r is null) {
		warning("failed to get window attributes");
		return;
	}


	// xcb_change_window_attributes(conf.conn, conf.root, XCB_CW_EVENT_MASK, &conf.NO_EVENT_MASK);

	//  uint frame_id = xcb_generate_id(conf.conn);
	//  uint mask = XCB_CW_BACK_PIXEL|XCB_CW_BORDER_PIXEL|XCB_CW_BIT_GRAVITY|XCB_CW_WIN_GRAVITY|
	//  	XCB_CW_OVERRIDE_REDIRECT|XCB_CW_EVENT_MASK|XCB_CW_COLORMAP;
	//
	//  uint event_mask = XCB_EVENT_MASK_STRUCTURE_NOTIFY|
	//  	XCB_EVENT_MASK_ENTER_WINDOW|
	//  	XCB_EVENT_MASK_LEAVE_WINDOW|
	//  	XCB_EVENT_MASK_EXPOSURE|
	//  	XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT|
	//  	XCB_EVENT_MASK_POINTER_MOTION|
	//  	XCB_EVENT_MASK_BUTTON_PRESS|
	//  	XCB_EVENT_MASK_BUTTON_RELEASE;
	//
	//  uint[] values = [
	//  	conf.screen.white_pixel,  // BACK_PIXEL
	//  	conf.screen.white_pixel,  // BORDER_PIXEL
	//  	XCB_GRAVITY_NORTH_WEST,  // BIT_GRAVITY
	//  	XCB_GRAVITY_NORTH_WEST,  // WIN_GRAVITY
	//  	1,  // OVERRIDE_REDIRECT
	//  	event_mask,  // EVENT_MASK
	//  	XCB_COPY_FROM_PARENT  // COLORMAP
	//  ];
	//
	//  xcb_create_window(conf.conn,
	//  		cast(ubyte)XCB_COPY_FROM_PARENT,
	//  		frame_id, 
	//  		conf.root,
	//  		geometry_r.x, geometry_r.y, geometry_r.width, geometry_r.height,
	//  		5,
	//  		XCB_COPY_FROM_PARENT,
	//  		conf.screen.root_visual,
	//  		mask,
	//  		values.ptr);
	//
	//  xcb_reparent_window(conf.conn, e.window, frame_id, 0, 0);
	// xcb_map_window(conf.conn, frame_id);
	xcb_map_window(conf.conn, e.window);
	// xcb_change_window_attributes(conf.conn, conf.root, XCB_CW_EVENT_MASK, &conf.ROOT_EVENT_MASK);

	xcb_flush(conf.conn);

	xcb_grab_button(conf.conn, 1, e.window,
			XCB_EVENT_MASK_BUTTON_PRESS|XCB_EVENT_MASK_BUTTON_RELEASE|XCB_EVENT_MASK_POINTER_MOTION,
			XCB_GRAB_MODE_ASYNC,
			XCB_GRAB_MODE_ASYNC,
			e.window, XCB_NONE,
			XCB_BUTTON_INDEX_1,  // LEFT BUTTON
			XCB_MOD_MASK_ANY);  // Super
	uint window_event = XCB_EVENT_MASK_STRUCTURE_NOTIFY|
		XCB_EVENT_MASK_PROPERTY_CHANGE|
		XCB_EVENT_MASK_ENTER_WINDOW;//|
		// XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT;
	xcb_change_window_attributes(conf.conn, e.window, XCB_CW_EVENT_MASK, &window_event);
	uint[] values = [5];
	xcb_configure_window(conf.conn, e.window, XCB_CONFIG_WINDOW_BORDER_WIDTH, values.ptr);

	xcb_flush(conf.conn);


	auto new_client = new Client();
	new_client.window = e.window;
	// new_client.frame = frame_id;
	conf.clients[e.window] = new_client;
	focus_client(conf, new_client);

	info("window mapped: ", e.window);
}

void change_border_color(Conf conf, Client client, int color) {
	auto geometry = get_window_geometry(conf, client.window);
	if (geometry is null) {
		return;
	}

	// create pixmap
	xcb_pixmap_t pixmap = xcb_generate_id(conf.conn);
	xcb_create_pixmap(conf.conn, conf.screen.root_depth, pixmap, conf.root,
			cast(ushort)(geometry.width + 10),
			cast(ushort)(geometry.height + 10));

	// create graphic contxt
	xcb_gcontext_t gc = xcb_generate_id(conf.conn);
	xcb_create_gc(conf.conn, gc, pixmap, 0, null);

	// change color
	uint[] values = [color];
	xcb_change_gc(conf.conn, gc, XCB_GC_FOREGROUND,  values.ptr);
	
	// draw rectangle
	xcb_rectangle_t[] rectangles = [xcb_rectangle_t(0,0, cast(ushort)(geometry.width+10), cast(ushort)(geometry.height+10))];
	xcb_poly_fill_rectangle(conf.conn, pixmap, gc, 1, rectangles.ptr);

	// apply to window
	values = [pixmap];
	xcb_change_window_attributes(conf.conn, client.window, XCB_CW_BORDER_PIXMAP, values.ptr);

	xcb_free_pixmap(conf.conn, pixmap);
	xcb_free_gc(conf.conn, gc);

	xcb_flush(conf.conn);
}

void focus_client(Conf conf, Client client) {

	unfocus_client(conf);

	uint[] values = [XCB_STACK_MODE_ABOVE];
	xcb_configure_window(conf.conn, client.window, XCB_CONFIG_WINDOW_STACK_MODE, values.ptr);
	xcb_flush(conf.conn);

	change_border_color(conf, client, 0xf0ca4d);

	conf.focusing = client;
}

void unfocus_client(Conf conf) {
	if (conf.focusing is null) {
		return;
	}

	change_border_color(conf, conf.focusing, 0x324d5c);
	conf.focusing = null;
}
