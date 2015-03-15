// David Leonard
// Playground for experimenting with testing primality

import UIKit

// Test number
var number = 3;
// Begin with assuming that a number is prime
var isPrime = true;

if number == 1 {
    isPrime = false;
}

if number != 2 && number != 1 {
    for var i = 2; i < number; i++ {
        if number % i == 0 {
            isPrime = false
        }
    }
}

println(isPrime);
    