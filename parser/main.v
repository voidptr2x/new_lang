module parser

pub struct B_Lang {
	pub mut:
		c_filepath 		string
		main_filename	string

		run_flag		bool

		file_data		string
		file_lines		[]string
		
		lang_types		[]string = ['str', 'int', 'bool']
		lang_keyword	[]string = ['interface', 'struct', 'fnc']

		vlang_data		string
}
