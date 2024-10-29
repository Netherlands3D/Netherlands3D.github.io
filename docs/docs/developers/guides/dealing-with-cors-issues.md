# Dealing with CORS issues during development

When using external web services (e.g., WFS, WMS, 3D Tiles) with Netherlands3D, 
[Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) restrictions can disrupt 
development. To avoid waiting on backend adjustments from a DevOps team, you can use a local CORS proxy like 
`local-cors-proxy`, which circumvents these issues while developing.

!!! info "What is CORS, and Why Does It Affect Web Applications?"

    CORS (Cross-Origin Resource Sharing) is a security feature in web browsers that restricts web applications from 
    making requests to a different domain than the one that served the initial page. This policy prevents unauthorized 
    access to sensitive data from other origins (e.g., servers) that didn’t explicitly permit the connection. Desktop 
    applications, unlike web applications, aren’t bound by browser-enforced CORS rules, which is why they can access 
    multiple origins without restrictions.

---

### Step 1: Install Node.js and NPM

If you don’t already have Node.js, [download and install it from Node.js](https://nodejs.org/en/download/package-manager).

---

### Step 2: Install `local-cors-proxy`

Open your terminal (or PowerShell in Windows) and install 
[local-cors-proxy](https://www.npmjs.com/package/local-cors-proxy) globally:

```bash
npm install -g local-cors-proxy
```

---

### Step 3: Start the Local CORS Proxy

To start, run the following command, where `<TARGET_WEBSERVICE_URL>` is the service URL you need to access:

```bash
lcp --proxyUrl <TARGET_WEBSERVICE_URL>
```

By default, this will run on port `8010`. For a custom port, specify it as `--port <PORT_NUMBER>`.

---

### Step 4: Handling Self-Signed Certificates

If the target service uses a self-signed certificate, you may need to disable SSL verification by setting the
`NODE_TLS_REJECT_UNAUTHORIZED` environment variable to `0`.

=== "Linux / macOS"

    ```bash
    export NODE_TLS_REJECT_UNAUTHORIZED=0
    ```

=== "Windows PowerShell"

    ```powershell
    $env:NODE_TLS_REJECT_UNAUTHORIZED=0
    ```

This setting should be applied before running the proxy.

---

### Step 5: Pass Proxied URLs in Netherlands3D

Point service requests to the proxy URL, e.g., `http://localhost:8010/<original_service_url_path>`, allowing requests to
pass through the proxy for CORS management. This includes importing services by URL in the layers panel.

---

### Step 6: Test the Setup

Run Netherlands3D, confirming that requests are passing through the proxy. Use browser developer tools or monitor the
terminal to check for successful CORS handling.
