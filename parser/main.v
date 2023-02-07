module parser

pub struct B_Lang {
	c_filepath 		string
	main_filename	string

	run_flag		bool

	file_data		string
}

pub struct B_File {
	pub mut:
		filename		string

		// Real-Time parser info (While parser is running)
		current_line		int

		in_imports			bool
		in_global_var		bool
		in_expr				bool // In expression statement ex: '(4 + 4)' used for if statements etc
		in_function			bool
		in_struct			bool
		in_variable			bool
		in_type				bool

		all_structs		[]string
		all_functions	[]string
}

pub fn (mut b B_Lang) operate_code() {
	
}