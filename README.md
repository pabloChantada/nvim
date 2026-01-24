## Requisitos Previos

* **Neovim >= 0.10.0**: Obligatorio para el funcionamiento de `nvim-treesitter-context` y caracteristicas modernas de LSP.
* **Nerd Font**: Se requiere una fuente parcheada (ej. JetBrainsMono Nerd Font) para visualizar los iconos.
* **Terminal**: Configurado para Ghostty (recomendado) o Kitty.

## Instalacion

1. Respalda tu configuracion actual (opcional):
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clona este repositorio:
```bash
git clone [URL_DE_TU_REPO] ~/.config/nvim
```

3. Instala las dependencias del sistema (ver seccion abajo).

4. Inicia Neovim:
```bash
nvim
```


El gestor de plugins `lazy.nvim` se iniciara automaticamente. Espera a que termine la instalacion y reinicia el editor.

## Dependencias del Sistema (Ubuntu/Debian)

Para que el portapapeles, las busquedas y los servidores de lenguaje funcionen correctamente, es necesario instalar las siguientes herramientas:
```bash
# Actualizar repositorios
sudo apt update

# Herramientas base y compiladores (para Treesitter)
sudo apt install build-essential

# Buscadores para Telescope
sudo apt install ripgrep fd-find

# Soporte de Portapapeles (Instalar segun tu sistema grafico)
# Para Wayland (Ubuntu 22.04+ por defecto):
sudo apt install wl-clipboard
# Para X11 (Sistemas antiguos):
sudo apt install xclip

# Entorno para Mason (Instalacion de LSPs de JS/TS/HTML/CSS)
sudo apt install nodejs npm

# Entorno Python (Para LSPs y herramientas virtuales)
sudo apt install python3-venv pipx
pipx ensurepath
```

## Servidores de Lenguaje (LSP)

Los servidores se gestionan mediante `Mason`. Puedes ver el estado escribiendo `:Mason` dentro de Neovim.

* **Python**: `pyright`, `ruff` (linter/formateador). Requiere configurar el entorno virtual.
* **Rust**: `rust-analyzer` (gestionado via plugin `rustaceanvim`).
* **Web**: `html`, `cssls`, `ts_ls`, `jsonls`.
* **Lua**: `lua_ls`.

## Configuracion de Terminal (Ghostty)

Para mantener la consistencia visual y la transparencia, utiliza la siguiente configuracion en `~/.config/ghostty/config`.

```ini
# --- Fuente ---
font-family = "Hack Nerd Font"
font-size = 11

# --- Tema Kanagawa Dragon ---
background = #181820
foreground = #c5c9c5
cursor-color = #c8c093
selection-background = #2d4f67
selection-foreground = #c8c093

# Paleta de colores ANSI
palette = 0=#0d0c0c
palette = 1=#c4746e
palette = 2=#8a9a7b
palette = 3=#c4b28a
palette = 4=#8ba4b1
palette = 5=#a292a3
palette = 6=#8ea4a2
palette = 7=#C8C093
palette = 8=#a6a69c
palette = 9=#E46876
palette = 10=#87a987
palette = 11=#E6C384
palette = 12=#7FB4CA
palette = 13=#938AA9
palette = 14=#7AA89F
palette = 15=#c5c9c5

# --- Integracion ---
# Transparencia (Coincide con la config de Neovim)
background-opacity = 0.9
background-blur-radius = 20

# Ajustes de ventana
window-decoration = true
window-padding-x = 4
window-padding-y = 4
confirm-close-surface = false

# Variable de entorno para detectar colores correctamente
env = TERM=xterm-ghostty
```

## Atajos de Teclado Principales

La tecla lider es `<Espacio>`.

### Archivos y Navegacion

* `<Espacio>pv`: Abrir explorador de archivos nativo (Netrw).
* `<Espacio>e`: Abrir/Cerrar arbol de archivos (NvimTree).
* `<Espacio>ff`: Buscar archivos por nombre (Telescope).
* `<Espacio>ps`: Buscar texto dentro de archivos (Grep).
* `<Espacio>u`: Historial de deshacer (Undotree).

### Git
* `<Espacio>gg`: Abrir LazyGit (interfaz flotante).

### Harpoon (Navegacion Rapida)

* `<Espacio>a`: Añadir archivo a la lista.
* `<Ctrl>e`: Menu rapido de archivos.
* `<Ctrl>1-4`: Navegar a los archivos marcados.

### Edicion

* `<Espacio>r`: Reemplazar la palabra bajo el cursor en todo el archivo.
* `<Espacio>f`: Formatear buffer actual.
