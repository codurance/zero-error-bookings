# Start the Environment

```bash
docker compose up -d
```

# Open Keycloak

http://localhost:8080

# Cloud Beaver Connect

If you decide to connect CloudBeaver to MySQL you might need to update the following Driver Property as part of the connection details:

```bash
allowPublicKeyRetrieval: true
```

# Helper Commands

Run the Keycloak container individually (i.e., without Docker Compose; the command below assumes that there is a Postgres container running in a `zero-error-bookings_default` Docker network):

```bash
docker run \
  --name keycloak \
  -p 8080:8080 \
  --network mysql \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=password \
  quay.io/keycloak/keycloak:20.0.3 \
  --verbose \
  start \
    --hostname=localhost \
    --hostname-strict=false \
    --hostname-strict-https=false \
    --http-enabled=true \
    --db=mysql \
    --db-url=jdbc:mysql://mysql/db \
    --db-username=admin \
    --db-password=password
```
