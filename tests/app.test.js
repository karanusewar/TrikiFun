const fs = require('fs');
const path = require('path');

describe('Static Site Structure Checks', () => {
  test('index.html should exist', () => {
    const filePath = path.join(__dirname, '../index.html');
    expect(fs.existsSync(filePath)).toBe(true);
  });

  test('index.html should contain child friendly magic title', () => {
    const filePath = path.join(__dirname, '../index.html');
    const content = fs.readFileSync(filePath, 'utf8');
    expect(content).toContain('TrikiFun');
    expect(content).toContain('Athens');
  });
});
