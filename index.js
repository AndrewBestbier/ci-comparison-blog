const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => res.send('Hello World!'));

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

| Service        | Run Time           | Configuration Time           | 
| ------------- |:-------------:| :-------------:|
| CircleCI      | 2 min | 1 hour |
| GitLab      | 5 min 15 seconds      | 1 hour |
| Travis      | 3 min 7 seconds | 1 hour |
| Buddy | 1 min      |  10 minutes |  
| AWS CodePipeline | 3 min 14 seconds      | 30 minutes | 