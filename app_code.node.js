Here is a basic starter code for your e-commerce web application using Node.js and Express. This code includes a simple server setup and a few routes for displaying products and managing customer orders.

```javascript
// Import required modules
const express = require('express');
const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Route to get all products
app.get('/products', (req, res) => {
    // Code to fetch and return all products from the database goes here
    res.send('All products');
});

// Route to get a specific product
app.get('/products/:id', (req, res) => {
    // Code to fetch and return a specific product from the database goes here
    res.send(`Product with ID: ${req.params.id}`);
});

// Route to create a new order
app.post('/orders', (req, res) => {
    // Code to create a new order in the database goes here
    res.send('Order created');
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server running on port ${port}`));
```

To deploy this code to GitHub, you need to initialize a new Git repository in your project directory, commit your code, and then push it to a new GitHub repository. Here are the commands you need to run in your terminal:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/yourrepository.git
git push -u origin master
```

Replace `https://github.com/yourusername/yourrepository.git` with the URL of your GitHub repository.

Please note that this is a very basic setup and doesn't include any database connection or error handling. You'll need to add those parts yourself according to your specific needs and the Azure resources you're planning to use.