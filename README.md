# Create Docker Image

```bash
docker build .
```

# Run a Docker Container

```bash
docker run -d -p 8080:80 --name app app:1.0.0
```

# Access the App

http://localhost:8080

# Run the App Locally without Docker

```bash
# Install dependencies
pip install fastapi "uvicorn[standard]"

# Run the web server
uvicorn app:app --reload

# Access the app
http://localhost:8000
```

# Helper Commands

View running containers:

```bash
docker ps
```

View all containers (including the stopped ones):

```bash
docker ps -a
```

Log inside of the container:

```bash
docker exec -it app sh
```

Check the container logs:

```bash
docker logs -f app
```

Copy files inside of a container:

```bash
docker cp <FILE_NAME> app:/<FOLDER_THAT_EXISTS>/<FILE_NAME>
```

Find other Docker commands:

```bash
docker --help
```

Find information about specific Docker commands:

```bash
docker cp --help
```
