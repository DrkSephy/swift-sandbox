// David Leonard
// Playground for if/else

import UIKit

var myName = "David";

var time = 15;

if myName == "David" && time < 12 {
    println("Good morning David");
} else if myName == "David" && time > 12 {
    println("Good afternoon David");
} else {
    println("Who are you?");
}

if myName == "David" || time < 20 {
    println("One statement is true");
}

var remainder = 9 % 2;

/* CHALLENGE */

var x:Int = 4;

if x % 2 == 0 {
    println("Value is even!")
} else {
    println("Value is odd!");
}