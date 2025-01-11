const express = require('express');
const redis = require('redis');
const app = express();
const client = redis.createClient({ host: 'redis', port: 6379 });

app.get('/', (req, res) => {
    client.incr('hits', (error, hits) => {
        res.send(`Bonjour, le monde! Cette page a été vue ${hits} fois.`);
    });
});

app.listen(3000, () => console.log('L\'application démarre sur le port 3000.'));