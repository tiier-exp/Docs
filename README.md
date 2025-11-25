# ONLYOFFICE Document Server with Custom Nginx Configuration

## 1. Overview

This project provides a Docker-based deployment for ONLYOFFICE Document Server, featuring a modified Nginx configuration. The primary customization allows the document server to be embedded within an `iframe` from any domain.

This is achieved by setting the `Content-Security-Policy` header to `frame-ancestors *` in the Nginx configuration.

---

## 2. Security Configuration

The default configuration is permissive and intended for development or testing purposes.

**For production environments, you must restrict the `frame-ancestors` directive to trusted domains.**

### Action Required for Production

1.  Fork this repository.
2.  Edit the `configs/ds-docservice.conf` file.
3.  Locate the `add_header Content-Security-Policy` directives.
4.  Replace `*` with your specific domain(s).

**Example:**

```nginx
# Restrict embedding to a specific domain
add_header Content-Security-Policy "frame-ancestors 'self' your-domain.com;";
```

---

## 3. Getting Started

You can either use the pre-built Docker image from the GitHub Container Registry (ghcr.io) or build the image from the source code.

### Option A: Use the Pre-built Image

Pull the image directly from the registry:

```bash
docker pull ghcr.io/tiier-exp/docs-service:latest
```

Then, run the container:

```bash
docker run -d -p 80:80 ghcr.io/tiier-exp/docs-service:latest
```

### Option B: Build from Source

Clone or fork this repository, then build the Docker image:

```bash
docker build -t custom-docs-service .
```

Run the container:

```bash
docker run -d -p 80:80 custom-docs-service
```
