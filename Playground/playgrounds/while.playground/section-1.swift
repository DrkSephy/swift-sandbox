// David Leonard
// Playground for while loops

import UIKit

var i = 1;

while i < 5 {
    // println(i);
    i++;
}

/* Use a while loop to create the first 10 even numbers */

var j = 2;

while j <= 20 {
    // println(j);
    j += 2;
}

/* Using a while loop to loop over an array */
var arr = [6, 2, 9, 1, 7, 5];

var index = 0;

while index < arr.count {
    println(arr[index]);
    index++;
}

/* Challenge: Create an array with 6 numbers and use a while loop to decrease each number in the array by 1 */

var challengeArr = [1, 2, 3, 4, 5, 6];
var challengeIndex = 0;

while challengeIndex < challengeArr.count {
    challengeArr[challengeIndex] = challengeArr[challengeIndex] - 1;
    challengeIndex += 1;
}

println(challengeArr);