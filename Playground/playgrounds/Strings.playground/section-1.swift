// David Leonard
// Playground for experimenting with strings

import UIKit

var str = "Hello"

// String concatenation
var newString = str + " David";

for character in newString {
    println(character)
}

// newTypeString will now have the contents of newString, with type=string
var newTypeString = NSString(string: newString);

// Get first 5 characters
newTypeString.substringToIndex(5);

// Get string starting from a certain index
newTypeString.substringFromIndex(6);

// Get a substring starting from location, and get a string of a certain length
newTypeString.substringWithRange(NSRange(location: 2, length: 5));

// Check for containing string
newTypeString.containsString("David");

// Split up a string
newTypeString.componentsSeparatedByString(" ");

// Uppercase a string
newTypeString.uppercaseString

// Lowercase a string
newTypeString.lowercaseString

