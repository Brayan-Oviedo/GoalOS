#!/usr/bin/env node

/**
 * GoalOS MCP Server
 * 
 * Expone las exportaciones de GoalOS como herramientas MCP
 * que GitHub Copilot puede invocar directamente.
 * 
 * Funciones disponibles:
 * - export_to_html: Genera board HTML interactivo
 * - export_to_notion: Exporta roadmap a Notion
 * - export_to_miro: Exporta roadmap a Miro
 * - export_all: Exporta automáticamente a todas las plataformas con tokens
 */

import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Create MCP server
const server = new Server({
  name: 'goalos',
  version: '1.0.0',
}, {
  capabilities: {
    tools: {},
  },
});

/**
 * Herramienta: export_all
 * Exporta roadmap a HTML + Notion + Miro (según tokens disponibles)
 */
server.setRequestHandler('tools/list', async () => {
  return {
    tools: [
      {
        name: 'export_all',
        description: 'Exporta roadmap automáticamente a HTML (siempre) + Notion + Miro (si hay tokens configurados). Abre todos los boards en el navegador.',
        inputSchema: {
          type: 'object',
          properties: {
            roadmap_file: {
              type: 'string',
              description: 'Path al archivo roadmap.json (default: output/roadmap.json)',
              default: 'output/roadmap.json'
            },
            open_browser: {
              type: 'boolean',
              description: 'Abrir boards en navegador automáticamente (default: true)',
              default: true
            }
          }
        }
      },
      {
        name: 'export_to_html',
        description: 'Genera board HTML interactivo local (funciona offline, no requiere tokens)',
        inputSchema: {
          type: 'object',
          properties: {
            roadmap_file: {
              type: 'string',
              description: 'Path al archivo roadmap.json',
              default: 'output/roadmap.json'
            }
          },
          required: ['roadmap_file']
        }
      },
      {
        name: 'export_to_notion',
        description: 'Exporta roadmap a Notion (requiere NOTION_API_TOKEN y NOTION_PARENT_PAGE_ID)',
        inputSchema: {
          type: 'object',
          properties: {
            roadmap_file: {
              type: 'string',
              description: 'Path al archivo roadmap.json',
              default: 'output/roadmap.json'
            }
          },
          required: ['roadmap_file']
        }
      },
      {
        name: 'export_to_miro',
        description: 'Exporta roadmap a Miro (requiere MIRO_ACCESS_TOKEN)',
        inputSchema: {
          type: 'object',
          properties: {
            roadmap_file: {
              type: 'string',
              description: 'Path al archivo roadmap.json',
              default: 'output/roadmap.json'
            }
          },
          required: ['roadmap_file']
        }
      }
    ]
  };
});

/**
 * Handler para ejecutar herramientas
 */
server.setRequestHandler('tools/call', async (request) => {
  const { name, arguments: args } = request.params;
  
  try {
    switch (name) {
      case 'export_all':
        return await exportAll(args);
      case 'export_to_html':
        return await exportToHTML(args);
      case 'export_to_notion':
        return await exportToNotion(args);
      case 'export_to_miro':
        return await exportToMiro(args);
      default:
        throw new Error(`Unknown tool: ${name}`);
    }
  } catch (error) {
    return {
      content: [
        {
          type: 'text',
          text: `❌ Error: ${error.message}\n\nStack: ${error.stack}`
        }
      ],
      isError: true
    };
  }
});

/**
 * Export All: HTML + Notion + Miro (según tokens)
 */
async function exportAll(args) {
  const roadmapFile = args.roadmap_file || 'output/roadmap.json';
  const openBrowser = args.open_browser !== false;
  
  // Verificar que existe roadmap.json
  if (!fs.existsSync(roadmapFile)) {
    throw new Error(`Roadmap file not found: ${roadmapFile}`);
  }
  
  let output = '🚀 Exportando a todas las plataformas...\n\n';
  
  // 1. HTML (siempre)
  output += '📁 HTML: Generado en output/visual-board.html\n';
  if (openBrowser) {
    try {
      const platform = process.platform;
      const openCmd = platform === 'darwin' ? 'open' : platform === 'win32' ? 'start' : 'xdg-open';
      execSync(`${openCmd} output/visual-board.html`, { cwd: __dirname });
      output += '   ✅ Abierto en navegador\n';
    } catch (e) {
      output += '   ⚠️  No se pudo abrir automáticamente\n';
    }
  }
  output += '\n';
  
  // 2. Notion (si hay tokens)
  const hasNotion = process.env.NOTION_API_TOKEN && process.env.NOTION_PARENT_PAGE_ID;
  if (hasNotion) {
    output += '🚀 Exportando a Notion...\n';
    try {
      const result = execSync(`./goalos-notion "${roadmapFile}"`, { 
        cwd: __dirname,
        encoding: 'utf8',
        env: process.env
      });
      output += result + '\n';
    } catch (e) {
      output += `   ❌ Error: ${e.message}\n\n`;
    }
  } else {
    output += '⊘ Notion: No configurado (sin tokens)\n';
    output += '   Configura NOTION_API_TOKEN y NOTION_PARENT_PAGE_ID para exportar\n\n';
  }
  
  // 3. Miro (si hay token)
  const hasMiro = process.env.MIRO_ACCESS_TOKEN;
  if (hasMiro) {
    output += '🚀 Exportando a Miro...\n';
    try {
      const result = execSync(`./goalos-miro "${roadmapFile}"`, { 
        cwd: __dirname,
        encoding: 'utf8',
        env: process.env
      });
      output += result + '\n';
    } catch (e) {
      output += `   ❌ Error: ${e.message}\n\n`;
    }
  } else {
    output += '⊘ Miro: No configurado (sin token)\n';
    output += '   Configura MIRO_ACCESS_TOKEN para exportar\n\n';
  }
  
  output += '\n✅ Exportación completa\n';
  
  return {
    content: [
      {
        type: 'text',
        text: output
      }
    ]
  };
}

/**
 * Export to HTML only
 */
async function exportToHTML(args) {
  const roadmapFile = args.roadmap_file;
  
  if (!fs.existsSync(roadmapFile)) {
    throw new Error(`Roadmap file not found: ${roadmapFile}`);
  }
  
  return {
    content: [
      {
        type: 'text',
        text: `✅ HTML board generado: output/visual-board.html\n\nEl board HTML ya está generado por el agente Goal Architect.\nPuedes abrirlo con: open output/visual-board.html`
      }
    ]
  };
}

/**
 * Export to Notion only
 */
async function exportToNotion(args) {
  const roadmapFile = args.roadmap_file;
  
  if (!fs.existsSync(roadmapFile)) {
    throw new Error(`Roadmap file not found: ${roadmapFile}`);
  }
  
  if (!process.env.NOTION_API_TOKEN || !process.env.NOTION_PARENT_PAGE_ID) {
    throw new Error('NOTION_API_TOKEN y NOTION_PARENT_PAGE_ID requeridos.\nConfigúralos con: ./setup.sh');
  }
  
  try {
    const result = execSync(`./goalos-notion "${roadmapFile}"`, { 
      cwd: __dirname,
      encoding: 'utf8',
      env: process.env
    });
    
    return {
      content: [
        {
          type: 'text',
          text: result
        }
      ]
    };
  } catch (error) {
    throw new Error(`Notion export failed: ${error.message}`);
  }
}

/**
 * Export to Miro only
 */
async function exportToMiro(args) {
  const roadmapFile = args.roadmap_file;
  
  if (!fs.existsSync(roadmapFile)) {
    throw new Error(`Roadmap file not found: ${roadmapFile}`);
  }
  
  if (!process.env.MIRO_ACCESS_TOKEN) {
    throw new Error('MIRO_ACCESS_TOKEN requerido.\nConfigúralo con: ./setup.sh');
  }
  
  try {
    const result = execSync(`./goalos-miro "${roadmapFile}"`, { 
      cwd: __dirname,
      encoding: 'utf8',
      env: process.env
    });
    
    return {
      content: [
        {
          type: 'text',
          text: result
        }
      ]
    };
  } catch (error) {
    throw new Error(`Miro export failed: ${error.message}`);
  }
}

/**
 * Start server
 */
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  
  // Log to stderr (MCP uses stdout for communication)
  console.error('GoalOS MCP Server started');
}

main().catch((error) => {
  console.error('Fatal error:', error);
  process.exit(1);
});
