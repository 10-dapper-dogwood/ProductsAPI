const fs = require('fs');
const readline = require('readline');
const path = require('path');

const read = fs.createReadStream(path.join(__dirname, '../csv/fake-photos.csv'));
const write = fs.createWriteStream(path.join(__dirname, '../csv/fake-photos-clean.csv'));

const rl = readline.createInterface({
  input: read,
  output: write,
});

const validate = (line) => {
  const columns = line.match(/(".*?"|[^",\s]+)(?=\s*,|\s*$)/g);
  write.write(`${columns[1]}\n`);
};

rl.on('line', (line) => {
  validate(line);
});
