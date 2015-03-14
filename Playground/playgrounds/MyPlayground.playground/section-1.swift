// David Leonard
// Swift playground, containing my notes as I go along in Swift

import UIKit

/**************
*   STRINGS   *
**************/

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

/***************
*   INTEGERS   *
***************/

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

/****************
*    ARRAYS     *
****************/

// Define an array
var arr = [1, 2, 3, 4, 5];

// Arrays in Swift are 0th based
// Get element 4
arr[3];

// Append new element to end of array
arr.append(6);

// Remove value 3
arr.removeAtIndex(2);

// Remove last value
arr.removeLast();

// Remove a range of values
arr.removeRange(1...2);

// We can have an array with multiple types
var newArr = [1, 2.3, "David"];

// Declare empty array - we need to specify the type of values in the array
var emptyArr:[Int];

// So we cannot push wrongly typed values into the array
// var emptyArr.push(1.2)

// NOTE: An array is ordered, and a dictionary is not
var dict = ["name": "David", "age" : 24, "gender": "male"];
// Optional is a type meaning "this variable may/or may not have a value. 
// Swift doesn't know if dict["name"] will have a value at this point.
// We can unwrap it using ! to force Swift to return a value
println(dict["name"]!);

dict["hairColor"] = "black";
dict["age"] = 25;
println(dict);
dict["age"] = "old";
















