module parser

pub struct Struct_Info {
	struct_name			string
	struct_line			int
	struct_objects		map[string][]string // {"object_name": ["object_type", "object_value"]}
	// Information about the struct incase of errors etc

	struct_file_path	string
	struct_line_on		int
}

pub fn parse_struct_line(line string) {
	line_args := line.split(" ")
	// struct struct_name {
	if line_args.len != 3 {
		// send to err handler
	}

	
}

pub fn parse_struct_objects() {

}