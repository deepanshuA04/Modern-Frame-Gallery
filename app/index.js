const http = require('http');
const PORT = process.env.PORT || 8080;
const COLOR = process.env.APP_COLOR || 'BLUE';

const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type':'text/plain'});
  res.end(`Hello from Modern Frame Gallery - ${COLOR}`);
});

server.listen(PORT, () => console.log(`App running as ${COLOR} on ${PORT}`));
