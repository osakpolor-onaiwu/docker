const express = require('express');
const app = express();
const app_config = require('./config/app_config');
require('./config/mongoose_config');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.post('/endpoint', (req, res) => {
  const requestData = req.body;
  console.log('Received POST data:', requestData);

  res.json({ 
    message: 'Data received successfully', 
    data: requestData 
  });
});

app.listen(app_config.port, () => {
  console.log(`Server is running at http://localhost:${app_config.port}`);
});
