function soundMaker(sound, times) {
  "use strict";

  // closure
  function makeSound() {
    console.log(`${sound}`);
  }

  for (let i = 0; i < times; i++) {
    makeSound();
  }
}

// soundMaker("Woof", 5);

function summation(arr) {
  "use strict";
  let sum = 1;

  // closure
  function summer() {
    for (let i = 0; i < arr.length; i++) {
      sum *= arr[i];
    }
  }
  summer();
  return sum;
}

console.log(summation([1, 2, 3, 4]));
