// Playground - noun: a place where people can play

import UIKit

/* Strings*/

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

/* Integers */

// Integers are useful when we know our input will only be whole numbers
var int = 4;
3 * int;

var a:Int = 5;
var b:Int = a * 5;

// Because we started with an integer 5, Swift infers that C will be an integer, 
// resulting in 2 and truncating the decimal.
// To fix this, we use a DOUBLE.
var c:Double = 5 / 2;
c * 2;