const fs = require('fs');
const readline = require('readline');
const path = require('path');

const read = fs.createReadStream(path.join(__dirname, '../csv/photos.csv'));
const write = fs.createWriteStream(path.join(__dirname, '../csv/photos-clean.csv'));

const rl = readline.createInterface({
  input: read,
  output: write,
});

const validate = (line) => {
  const columns = line.match(/(".*?"|[^",\s]+)(?=\s*,|\s*$)/g);
  const check0 = (string) => string;
  const check1 = (string) => string;
  const check2 = (string) => string;
  const check3 = (string) => string;
  if (check0(columns[0]) && check1(columns[1]) && check2(columns[2]) && check3(columns[3])) {
    write.write(`${columns[0]},${columns[1]},${columns[2]},${columns[3]}\n`);
  }
};

rl.on('line', (line) => {
  validate(line);
});

// let last = string.length;
// if (string[string.length - 1] === '"') {
//   last -= 1;
//   const thing = `"${string.slice(string.indexOf('http'), last)}"`;
//   return thing;
// }
// const thing = `"${string.slice(string.indexOf('http'), last)}"`;
// console.log(columns[0], thing);
// string = thing;
// return string;