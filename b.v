import os

import parser

fn main() {
	args := os.args.clone()

	if args.len < 2 { 
		print("[!] Error, Invalid arguments provided\r\n")
		exit(0)
	}


	if args[1].ends_with(".b") || os.exists(args[1]) {
		mut current_path := os.execute("pwd").output
		mut file_path := args[1]

		mut data := os.read_file("${file_path}") or { "" }

		if data == "" { 
			print("[!] Error, Empty '.b' file")
			exit(0)
		}

		// Start to parse
		if file_path.contains("/") { file_path = file_path.split("/")[file_path.split("/").len-1] }
		
		mut b := parser.B_Lang{c_filepath: current_path, main_filename: file_path, file_data: data}
		line_num := 0
		
		for line in data.split("\n")
		{
			fixed_line := line.trim_space() // Trim space bc in C no one cares about where you place your code as long as its right
			if fixed_line.starts_with("struct")
			{

			}
			line_num++
		}
		if "run" in args { b.operate_code() }
	}
	print("[!] Error, Invalid '.b' file provided\r\n")
	exit(0)
}