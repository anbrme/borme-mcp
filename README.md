# borme-mcp
Mapa Societario

# Mapa Societario — MCP Server (Spanish Company Registry / BORME)

  A hosted, **read-only**, **anonymous** [Model Context Protocol](https://modelcontextprotocol.io)
  server that gives AI agents access to the Spanish company registry.

  It exposes data derived from the official **BORME** (Boletín Oficial del Registro
  Mercantil / Registro Mercantil) — **~3.1M companies and ~9.4M filings since 2009** —
  so an assistant can search companies and directors and explore corporate
  relationships directly.

  🔎 Web app: **https://mapasocietario.es**
  ☁️  Endpoint: **https://mcp.mapasocietario.es**

  ## Tools

  | Tool | Description |
  |------|-------------|
  | `search_companies` | Search Spanish companies by name |
  | `search_officers` | Search directors / officers |
  | `get_company` | Full record for one company |
  | `get_company_network` | Officers and related companies as a graph |

  ## Connect

  **Claude Desktop / clients via the remote bridge:**
  ```json
  {
    "mcpServers": {
      "mapa-societario": {
        "command": "npx",
        "args": ["mcp-remote", "https://mcp.mapasocietario.es"]
      }
    }
  }

  Clients with native remote-MCP support: add the URL
  https://mcp.mapasocietario.es directly.

  Data & limitations

  - Unofficial. Derived from official BORME publications and provided as-is.
  For documented or critical use, consult the official BORME and the
  registry.
  - Ownership: BORME records only the sole shareholder (socio único),
  not full shareholder / cap-table data.
  - Cross-company time-range queries (e.g. all registry transfers in a window)
  are not supported.
  - Every company result includes a link back to its page on mapasocietario.es
  so results can be viewed and cited at source.

  License

  MIT (documentation only — the server is hosted; this repo does not
  contain the implementation).
