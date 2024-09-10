const http = require('http');
const jokes = [
  'Why did the scarecrow win an award? Because he was outstanding in his field!',
  'Why don’t skeletons fight each other? They don’t have the guts.',
  'What do you call fake spaghetti? An impasta!',
  'Why was the math book sad? Because it had too many problems.',
];
http.createServer((req, res) => {
  const joke = jokes[Math.floor(Math.random() * jokes.length)];
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end(joke);
}).listen(80, () => console.log('Joke API running on port 80...'));
