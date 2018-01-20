import xcb.xcb;

import conf;

import std.experimental.logger;

class Client {
public:
	xcb_window_t window;
	xcb_window_t frame;
}


void map_new_client(Conf conf, xcb_map_request_event_t* e) {
	auto geometry_c = xcb_get_geometry(conf.conn, e.window);
	auto geometry_r = xcb_get_geometry_reply(conf.conn, geometry_c, null);
	if (geometry_r is null) {
		warning("failed to get geometry");
		return;
	}
	
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
	uint window_event = XCB_EVENT_MASK_STRUCTURE_NOTIFY | XCB_EVENT_MASK_PROPERTY_CHANGE|XCB_EVENT_MASK_FOCUS_CHANGE;
	xcb_change_window_attributes(conf.conn, e.window, XCB_CW_EVENT_MASK, &window_event);

	xcb_flush(conf.conn);


	auto new_client = new Client();
	new_client.window = e.window;
	// new_client.frame = frame_id;
	conf.clients[e.window] = new_client;
	conf.current = new_client;

	info("window mapped: ", e.window);
}
