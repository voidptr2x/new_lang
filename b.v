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
		
		mut b := parser.B_Lang{c_filepath: current_path, main_filename: file_path, file_data: data, file_lines: data.split("\n")}
		
		for i in 0..(b.file_lines).len
		{
			tline := b.file_lines[i].trim_space() // Trim space bc in C no one cares about where you place your code as long as its right
			line_args := tline.split(" ")
			if tline == "" { continue }
			if tline.starts_with("struct")
			{
				mut code := []string{}
				if line_args.len < 2 || line_args.len > 3 {
					print("[!] Error, Invalid syntax\r\n")
					exit(0)
				}
				
				code << b.file_lines[i].trim_space()
				for line_n in i..(b.file_lines).len
				{
					print(b.file_lines[line_n].trim_space())
					if b.file_lines[line_n] == "};" {
						b.vlang_data += b.parse_struct(code) + "\n"
						break
					} else if b.file_lines[line_n].trim_space().split(" ")[0] in b.lang_types {
						code << b.file_lines[line_n].trim_space()
					} else if b.file_lines[line_n] != "};" && line_n != i && b.file_lines[line_n] != "{" {
						print("[!] Error, Invalid code.....\n")
						exit(0)
					}
				}
				print("${b.vlang_data}\n")
			} else {
				print("[!] Error, Broken Code\r\n")
				exit(0)
			}
		}
	}
	exit(0)
}
