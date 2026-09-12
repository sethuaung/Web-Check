// Probe for Docker's HEALTHCHECK, since the slim image has no curl or wget to hit /healthz with
const port = process.env.PORT || 3000;

try {
  const response = await fetch(`http://127.0.0.1:${port}/healthz`);
  const { ready } = await response.json();
  process.exit(response.ok && ready ? 0 : 1);
} catch {
  process.exit(1);
}
