const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 }, () => {
  console.log('Server running on ws://localhost:8080');
});

wss.on('connection', (ws) => {
  console.log('New client connected');

  ws.on('message', (msg) => {
    console.log('Server received:', msg.toString());
    ws.send(`Server echo: ${msg.toString()}`);
  });

  ws.on('close', () => console.log('Client disconnected'));
});
