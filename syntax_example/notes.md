<div align="center">
<h1>B Programming Lanuage (Temporary name)</h1>
</div>

- C syntax features in B:
- Create variable and functions with data-types
- Use of semi-colons ; for end of code.
- Everything is public if you import its file. (no private/public code)

# Import libs:
```
Import o = lib(os); // no string search the lib folder for os lib
Import term = lib(“term/draw.b”); // search local file 
Import config = lib(“config/”); // uses all .b files in the dir
```

# Creating types:
```
type Response = string
```

# Enums:
```
Enum resp {
    object_here
}
```

# Structs:
Syntax/Example
```
struct Person
{
      str Name;
      int age;
      bool developer;
};
```

# Variables:
Syntax/Exmaple
```
str name = “bob”;
const str color = “blue”;
```

# Functions:
Syntax:
```
function_type function_name(funcion_arg: function_arg_type)
{
    
} (struct_name[optional]);
```
Exmaple:

Bringing C-like syntax back with some new minor things added to it
```
// Regular
str hello(n: str)
{
      return “hello ${n}”;
};

// Member Of Struct
str hello(n: str)
{

} Person;
```