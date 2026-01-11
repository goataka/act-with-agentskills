const { greet } = require('./index.js');

function test() {
  const result = greet('World');
  const expected = 'Hello, World!';
  
  if (result === expected) {
    console.log('✓ Test passed');
    process.exit(0);
  } else {
    console.error('✗ Test failed');
    console.error(`Expected: ${expected}`);
    console.error(`Got: ${result}`);
    process.exit(1);
  }
}

test();
