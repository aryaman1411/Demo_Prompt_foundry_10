Here is a simple example of a Dockerfile and a containerization script for a Node.js web application. You may need to adjust this example to fit your specific application and its dependencies.

Dockerfile:

```Dockerfile
# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle the app source inside the Docker image
COPY . .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run the app
CMD [ "node", "server.js" ]
```

Containerization script:

```bash
#!/bin/bash

# Build the Docker image
docker build -t my-ecommerce-app .

# Run the Docker container
docker run -p 8080:8080 -d my-ecommerce-app
```

To run the script, save it to a file (e.g., `run.sh`), give it execute permissions (`chmod +x run.sh`), and then run it (`./run.sh`).

Remember to replace `server.js` with the entry point to your application, and adjust the `EXPOSE` directive and the `-p` option in the `docker run` command if your application uses a different port. Also, replace `my-ecommerce-app` with the name you want to give to your Docker image and container.