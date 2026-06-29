# Mapa Societario — MCP Server (Spanish Company Registry / BORME)

A hosted, **read-only**, **anonymous** [Model Context Protocol](https://modelcontextprotocol.io)
server that gives AI agents access to the Spanish company registry.

It exposes data derived from the official **BORME** (Boletín Oficial del Registro
Mercantil / Registro Mercantil) — **~3.1M companies and ~9.4M filings since 2009** —
so an assistant can search companies and directors and explore corporate
relationships directly.

- 🔎 Web app: **https://mapasocietario.es**
- ☁️ Connector URL: **`https://mcp.mapasocietario.es/mcp`** (Streamable HTTP, JSON-RPC)
- 🔓 Auth: none · **Rate limit:** 30 requests/min, 1,000/day per IP

## Tools

| Tool | Description |
|------|-------------|
| `search_companies` | Search Spanish companies by name (typo-tolerant, ranked) |
| `get_company` | Full record for one company — current officers, sole shareholder, dissolution status, NIF/capital/address |
| `search_officers` | Search directors / officers by name (accent-insensitive) |
| `get_company_network` | Related companies and shared officers as a graph (`owns` / `owned_by` / `shared_officer` edges) |

## Connect

**Claude clients with native remote-MCP support** — add a custom connector with the URL:

```
https://mcp.mapasocietario.es/mcp
```

**Claude Desktop (or any client) via the `mcp-remote` bridge:**

```json
{
  "mcpServers": {
    "mapa-societario": {
      "command": "npx",
      "args": ["mcp-remote", "https://mcp.mapasocietario.es/mcp"]
    }
  }
}
```

Health check: `curl -s https://mcp.mapasocietario.es/health` → `ok`.

## Data & limitations

- **Unofficial.** Derived from official BORME publications and provided **as-is**.
  For documented or critical use, consult the official BORME and the company's
  page on [mapasocietario.es](https://mapasocietario.es).
- **Ownership:** BORME records only the **sole shareholder** (*socio único*),
  not full shareholder / cap-table data.
- **Out of scope:** sanctions / PEP screening, annual accounts (*Cuentas
  Anuales*), AI analysis, and cross-company time-range / event queries.
- Every company result includes an `empresa_url` link back to its page on
  mapasocietario.es so results can be viewed and cited at source.

## License

[MIT](LICENSE) — documentation only. The server is hosted; this repository does
not contain the implementation.
