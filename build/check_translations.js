/* eslint-disable */

const lang1 = process.env.LANG_FROM || process.argv[2] || 'fi';
const lang2 = process.env.LANG_TO || process.argv[3] || 'nb';

console.log("Comparing translations between " + lang1 + " and " + lang2);

const UI_PATH = process.env.UI_PATH || '.';
const TRANSLATION_PATH = UI_PATH + '/app/translations/';

console.log("Using path: " + TRANSLATION_PATH);

fs = require('fs');

if (!fs.existsSync(TRANSLATION_PATH + lang1 + '.json')) {
  console.log(lang1 + ' does not exist in translations');
  process.exit();
}
if (!fs.existsSync(TRANSLATION_PATH + lang2 + '.json')) {
  console.log(lang2 + ' does not exist in translations');
  process.exit();
}

const lang_from = JSON.parse(fs.readFileSync(TRANSLATION_PATH + lang1 + '.json', 'utf8'));
const lang_to = JSON.parse(fs.readFileSync(TRANSLATION_PATH + lang2 + '.json', 'utf8'));

const keys_from = Object.keys(lang_from).sort();
const keys_to = Object.keys(lang_to).sort();

const difference = keys_from.filter(x => !keys_to.includes(x));

console.log("The following keys are missing in translation: '" + lang2 + "'");
console.log(difference);
