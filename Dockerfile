# Bridge container for automated MCP introspection (e.g. Glama scoring).
#
# This repository documents a HOSTED remote MCP server; the implementation
# runs on Cloudflare at https://mcp.mapasocietario.es/mcp and is not in this
# repo. To let automated scanners start "a server" and introspect it, this
# image runs `mcp-remote`, which exposes the hosted endpoint over stdio and
# forwards `initialize` / `tools/list` to the live server.
#
# The endpoint is anonymous and read-only, so no auth/OAuth is involved.
FROM node:20-alpine

# Install the stdio<->remote bridge. Pin to a known-good version once the
# Glama check passes (replace @latest with the resolved version).
RUN npm install -g mcp-remote@latest

# Bridge stdio <-> the hosted Streamable-HTTP endpoint.
# If a scanner fails to negotiate, swap "http-only" for "http-first".
ENTRYPOINT ["mcp-remote", "https://mcp.mapasocietario.es/mcp", "--transport", "http-only"]
