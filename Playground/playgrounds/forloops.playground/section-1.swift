// David Leonard
// Playground for experimenting with for loops

import UIKit

/* Challenge: Display 3, 5, 7 */
for var i = 3; i < 8; i = i + 2 {
    // println(i);
}

for var j = 30; j > 8; j = j - 2 {
    // println(j);
}

/* Challenge: Print all multiples of 5 up to 50 */
for var z = 5; z < 51; z = z + 5 {
    // println(z);
}

/* Looping over an array */
var arr = [6, 3, 8, 1];
for x in arr {
    // x is immutable
    //println(x);
}

// Allows us to control the array
for (index, x) in enumerate(arr){
    arr[index] = x + 1;
}

println(arr);

/* Challenge: create array with 4 numbers, half each number in the array */

var challengeArr = [2, 4, 6, 8];
for (challengeIndex, challengeX) in enumerate(challengeArr) {
    challengeArr[challengeIndex] = challengeX / 2;
}

println(challengeArr);