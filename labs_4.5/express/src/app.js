const express = require('express');
const redis = require('redis');

const app = express();
const redisClient = redis.createClient({ host: 'redis', port: 6379 }); // Utilisation de redis

app.get('/', (req, res) => {
    redisClient.incr("hits", (err, hits) => {
        if (err) {
            res.status(500).send("Erreur Redis");
        } else {
            res.send(`Bonjour depuis Express.js ! Cette page a été vue ${hits} fois.`);
        }
    });
});

app.listen(3000, () => {
    console.log("Application Express en cours sur le port 3000!");
});