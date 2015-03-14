// David Leonard
// Swift playground, containing my notes as I go along in Swift

import UIKit

/* STRINGS */

// Create a variable
var str = "Hello, playground";

// Update the value of `str`
str = "Goodbye";

// Create new variable, with type declared as a String
// NOTE: Swift uses TYPE INFERENCE to figure out what type a variable is without giving it
// an explicit type.
var name:String = "David";

// Change name value
name = "Lisa";

var unknownString:String
unknownString = "3";

/* INTEGERS */

// Integers are useful when we know our input will only be whole numbers
var int = 4;
3 * int;

var a:Int = 5;
var b:Int = a * 5;

// Because we started with an integer 5, Swift infers that C will be an integer, 
// resulting in 2 and truncating the decimal.
// To fix this, we use a DOUBLE.
var c:Double = 5 / 2;

// Swift will not allow you to multiply an integer with a double
// c * int;

// Fix this by casting the variable int to a double:
c * Double(int);

// String concatenation
var longSentence = str + " " + name;

// Embed integer into a string
var newString = "My cat is \(int)";

/* Random exercise */
// Create 3 variables
var first:Double = 3.5;
var second:Int = 4;
var third:Double = first * Double(second);
// Make a sentence containing the numbers and the result
var multString = "\(first)" + " multipled by " + "\(second)" + " is equal to " + "\(third)";



