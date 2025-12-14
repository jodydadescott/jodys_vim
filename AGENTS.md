# AGENTS.md

## Project Overview

This is **Jody's Vim Profile** - a personal vim configuration forked from [The Ultimate Vim Configuration](https://github.com/amix/vimrc). It provides a comprehensive vim setup with customized keybindings, plugin configurations, and language-specific settings.

**Repository Location**: `~/.vimprofile` (typical installation path)

## Installation & Setup

### Initial Installation
```bash
git clone https://github.com/jodydadescott/jodys_vim.git ~/.vimprofile
cd ~/.vimprofile
./install.sh
```

### What Install Does
The `install.sh` script creates `~/.vimrc` with the following structure:
```vim
set runtimepath+=$PWD
source $PWD/vimrcs/basic.vim
source $PWD/vimrcs/filetypes.vim
source $PWD/vimrcs/plugins_config.vim
source $PWD/vimrcs/extended.vim
source $PWD/vimrcs/main.vim
```

This loads vim configuration files in a specific order, each with distinct responsibilities.

## Repository Structure

```
.vimprofile/
├── README.md              # Basic setup instructions
├── install.sh             # Installation script (creates ~/.vimrc)
├── autoload/
│   └── pathogen.vim       # Pathogen plugin manager (v2.3)
├── vimrcs/
│   ├── basic.vim          # Core vim settings and keybindings
│   ├── extended.vim       # Extended features (GUI, undo, compile/run, search)
│   ├── filetypes.vim      # Language-specific configurations
│   ├── plugins_config.vim # Plugin configurations
│   └── main.vim           # User customizations (loaded last)
└── sources_forked/        # Forked/customized plugins
    ├── peaksea/           # Peaksea color scheme
    ├── set_tabline/       # Tab line customization
    ├── vim-irblack-forked/ # IR Black color scheme
    └── vim-peepopen/      # PeepOpen plugin
```

### Configuration File Hierarchy

1. **basic.vim** (9,641 bytes) - Foundation settings
2. **filetypes.vim** (2,303 bytes) - Language-specific configs
3. **plugins_config.vim** (6,338 bytes) - Plugin settings
4. **extended.vim** (7,492 bytes) - Advanced features
5. **main.vim** (1,232 bytes) - Final user overrides

## Core Configuration Details

### Leader Key
- Leader key is `,` (comma)
- Used for most custom commands

### Indentation & Spacing
- **Spaces, not tabs**: `set expandtab`
- **Default**: 4 spaces per indent (from basic.vim)
- **Override**: 2 spaces per indent (in main.vim - takes precedence)
- YAML files: 2 spaces (explicitly set in filetypes.vim)

### Key Configuration Settings

From **basic.vim**:
- History: 500 lines
- Case-insensitive search with smart case
- Incremental search with highlighting
- No backup files, no swap files (`nobackup`, `nowb`, `noswapfile`)
- Auto-read files changed externally
- UTF-8 encoding
- Unix line endings preferred
- Folding disabled (in main.vim)
- Mouse support enabled (in main.vim)

From **main.vim**:
- Dark background with 256 colors
- Folding disabled: `set nofoldenable`
- Mouse enabled: `set mouse=a`
- Terminal paste mode fix for xterm
- Custom F1/F2 key labels for iTerm2

## Essential Keybindings

### General Navigation
- `<leader>w` - Save file (fast save)
- `:W` - Save with sudo
- `<space>` - Search (mapped to `/`)
- `<C-space>` - Backward search (mapped to `?`)
- `<leader><cr>` - Clear search highlighting
- `0` - Jump to first non-blank character (remapped from `^`)

### Window Management
- `<C-j>`, `<C-k>`, `<C-h>`, `<C-l>` - Navigate between windows

### Buffer Management
- `<leader>bd` - Close current buffer
- `<leader>ba` - Close all buffers
- `<leader>l` - Next buffer
- `<leader>h` - Previous buffer
- `<leader>o` - Open BufExplorer

### Tab Management
- `<leader>tn` - New tab
- `<leader>to` - Close all other tabs
- `<leader>tc` - Close current tab
- `<leader>tm` - Move tab
- `<leader>t<leader>` - Next tab
- `<leader>tl` - Toggle to last accessed tab
- `<leader>te` - Open tab with current buffer's path

### File/Directory Operations
- `<leader>cd` - Change directory to current buffer's path
- `<leader>f` - Most Recently Used files (MRU)
- `<leader>j` - CtrlP fuzzy finder
- `<leader>b` - CtrlP buffer list

### NERDTree
- `<leader>nn` - Toggle NERDTree
- `<leader>nb` - Open NERDTree from bookmark
- `<leader>nf` - Find current file in NERDTree
- NERDTree positioned on the right side
- Window size: 35 columns
- Ignores: `*.pyc`, `__pycache__`

### Searching (Ack/Grep)
- `<leader>g` - Open Ack search (uses ripgrep or ag if available)
- `gv` - Ack search for selected text (visual mode)
- `<leader>r` - Search and replace selected text (visual mode)
- `<leader>cc` - Open cope (results window)
- `<leader>n` - Next search result
- `<leader>p` - Previous search result

### Spell Checking
- `<leader>ss` - Toggle spell check
- `<leader>sn` - Next misspelling
- `<leader>sp` - Previous misspelling
- `<leader>sa` - Add word to dictionary
- `<leader>s?` - Spelling suggestions

### Code Execution (F5)
- `<F5>` - Compile and run current file (works in normal, insert, visual mode)
- Supported languages:
  - C: gcc compiler
  - C++: g++ compiler
  - Java: javac
  - Shell: bash
  - Python: python3
  - Go: go build && go run
  - HTML: opens in browser (macOS: open, Linux: xdg-open)
  - Matlab: octave

### Other Useful Mappings
- `<F1>` - Save and quit (`:x!`)
- `<F2>` - Quit without saving (`:q!`)
- `<leader>q` - Open scratch buffer (`~/buffer`)
- `<leader>x` - Open markdown scratch buffer (`~/buffer.md`)
- `<leader>pp` - Toggle paste mode
- `<leader>m` - Remove Windows ^M characters
- `<leader>z` - Toggle Goyo (distraction-free mode)
- `<leader>d` - Toggle GitGutter
- `<leader>a` - Next ALE error/warning
- `<leader>v` - Copy Git link to line (fugitive GBrowse)
- `<M-j>` / `<M-k>` - Move line up/down (Mac: `<D-j>` / `<D-k>`)

## Plugin Configuration

### Plugin Manager
- Uses **Pathogen** (v2.3) for plugin management
- Loads from: `sources_forked/{}`, `sources_non_forked/{}`, `my_plugins/{}` (relative to repo root)

### Configured Plugins

#### CtrlP (Fuzzy Finder)
- Trigger: `<C-f>` or `<leader>j`
- Buffer mode: `<leader>b`
- Max height: 20
- Ignores: `node_modules`, `.DS_Store`, `.git`, `.coffee`
- Working path mode: 0 (disabled)

#### BufExplorer
- Default help disabled
- Show relative paths
- Find active buffer
- Sort by name
- Trigger: `<leader>o`

#### YankStack
- Yank keys: `y`, `d`
- Cycle older paste: `<C-p>`
- Cycle newer paste: `<C-n>`

#### ALE (Linter)
- JavaScript: eslint
- Python: flake8
- Go: go, golint, errcheck
- Next error: `<leader>a`
- Highlighting disabled
- Only lints on save (not on text change)
- Virtual text disabled

#### Git Integration
- **GitGutter**: Toggle with `<leader>d` (disabled by default)
- **Fugitive**: Git commands, `<leader>v` for GBrowse

#### NERDTree
See keybindings section above

#### Lightline (Status Bar)
- Colorscheme: wombat
- Shows: mode, paste status, fugitive (git), readonly, filename, modified
- Right side: line info, percentage
- Custom separators

#### Other Plugins
- **Emmet**: Enabled in all modes
- **snipMate**: Trigger with `<TAB>` or `<C-j>`, snippet version 1
- **Goyo**: Distraction-free mode, width 100, margins 2
- **EditorConfig**: Enabled, excludes fugitive paths
- **vim-multiple-cursors**: DEPRECATED (use Ctrl-V visual block instead)
- **Surround.vim**: Visual `Si` for surrounding with functions

## Language-Specific Configurations

### Python
- Highlight all syntax elements
- Keywords: `True`, `None`, `False`, `self`
- File associations: `.jinja` → htmljinja, `.mako` → mako
- Shortcuts:
  - `$r` → `return `
  - `$i` → `import `
  - `$p` → `print `
  - `$f` → `# --- `
  - `<leader>1` → search for `class`
  - `<leader>2` → search for `def`
  - `<leader>C` → backward search for `class`
  - `<leader>D` → backward search for `def`
  - `F` → Set fold method to indent
- Auto-cleanup trailing whitespace on save for `.py` files

### JavaScript/TypeScript
- JavaScript folding enabled
- Shortcuts:
  - `<C-t>` → `console.log();` (insert mode)
  - `<C-a>` → `alert();` (insert mode)
  - `$r` → `return `
  - `$f` → `// --- PH` (comment placeholder)
- Auto-cleanup trailing whitespace on save for `.js` files
- No cindent

### Go
- ALE linters: go, golint, errcheck

### YAML
- Tab settings: 2 spaces

### CoffeeScript
- Fold method: indent

### Shell
- Terminal GUI colors enabled in tmux
- Auto-cleanup trailing whitespace on save for `.sh` files

### Twig
- `.twig` files → HTML syntax

### Markdown
- Folding disabled

### Git Commit
- Cursor positioned at line 1, column 1 on open

### Other
- Auto-cleanup trailing whitespace on save for: `.txt`, `.wiki`, `.coffee`

## Color Schemes

### Available
- `desert` (default in basic.vim)
- `peaksea` (default in extended.vim for GUI)
- `ir_black` (available in sources_forked)

### Current Setup
- Terminal: desert (dark background, 256 colors)
- GUI: peaksea (dark background)
- Configurable in main.vim (currently commented out)

## Search & Replace Patterns

### Ack/Ripgrep Integration
- Prefers `rg` (ripgrep) if available
- Falls back to `ag` (the_silver_searcher)
- Falls back to `ack`
- Smart case enabled
- Vimgrep format

### Vim Grep
- Skips directories: RCS, CVS, SCCS, .svn, generated
- Uses system `grep -nH` if available

## Auto-Commands

### File Type Detection
- Enabled with plugin support and indentation

### On Save
- Clean trailing whitespace for: `*.txt`, `*.js`, `*.py`, `*.wiki`, `*.sh`, `*.coffee`

### On File Open
- Return to last edit position (if valid)

### Terminal-Specific
- iTerm2 function key labels (F1, F2)
- Paste mode fix for xterm terminals

### GUI-Specific
- Disable visual bell
- Custom font preferences (IBM Plex Mono, Hack, Source Code Pro, etc.)

## Gotchas & Important Notes

### Paste Mode Issues
- **Problem**: Terminal paste can insert escape sequences as literal text (e.g., `^[`, `^[OA`, `^[:q!`)
- **Root cause**: Bracketed paste mode not properly handled in some terminals
- **Solution 1**: Use `<leader>pp` to toggle paste mode before/after pasting
- **Solution 2**: Modern Vim (8.0.0238+) has built-in bracketed paste support
- **Current fix**: `main.vim` detects Vim version and uses appropriate paste handling
- **Status line indicator**: Shows `PASTE MODE` when paste mode is active
- If paste mode gets stuck, run `:set nopaste` to return to normal

### Tab Width Override
- `basic.vim` sets 4 spaces
- `main.vim` overrides to 2 spaces (loaded last)
- **When editing**: Assume 2-space indentation is the active setting

### Forked Plugins
- Some plugins in `sources_forked/` are customized versions
- Don't assume they match upstream behavior
- Check the specific plugin directory if behavior seems off

### Plugin Loading Paths
- Expects `sources_non_forked/{}` and `my_plugins/{}` directories
- These may not exist in a fresh clone
- Won't cause errors, but plugins won't be found there

### Mouse Support
- Enabled globally (`set mouse=a`)
- May interfere with terminal selection - use visual mode instead

### F5 Compile & Run
- Assumes compilers are installed (gcc, g++, javac, go, python3)
- Uses `time` command (not available on all systems)
- Runs in foreground - long-running programs will block vim

### Search Tool Dependencies
- Ack commands work best with `rg` or `ag` installed
- Falls back to standard `ack` or `grep`

### Persistent Undo
- Tries to use `~/.vim_runtime/temp_dirs/undodir`
- May fail silently if directory doesn't exist

### Leader Key Conflicts
- Many `<leader>` combos are used
- Check existing bindings before adding new ones
- Common prefixes: `t` (tabs), `s` (spell), `n` (NERDTree), `b` (buffers)

### Special Terminal Fixes
- Xterm paste mode fix may not work in all terminals
- iTerm2-specific key label commands (may show escape codes in other terminals)

## Testing

No automated tests present. Testing is manual:
1. Run `./install.sh`
2. Open vim
3. Verify configuration loads without errors
4. Test key bindings manually
5. Test plugin functionality

## Style & Conventions

### VimScript Style
- Functions use PascalCase or camelCase
- Custom commands use PascalCase (`:W`, `:Bclose`)
- Comments use `"` for full-line comments
- Helper functions often use `<SID>` prefix for script-local scope
- Lots of inline documentation

### File Organization
- Clear section headers with comment boxes
- Sections grouped by functionality
- Credits and original source references preserved

### Customization Pattern
- Base configuration in `basic.vim` and `extended.vim`
- User overrides in `main.vim` (loaded last)
- Language-specific settings isolated in `filetypes.vim`
- Plugin configs isolated in `plugins_config.vim`

## Common Workflows

### Adding a New Plugin
1. Clone/copy plugin to `sources_forked/`, `sources_non_forked/`, or `my_plugins/`
2. Add configuration to `vimrcs/plugins_config.vim`
3. Restart vim or `:source ~/.vimrc`

### Customizing Settings
1. Edit `vimrcs/main.vim` for personal settings
2. These load last and override everything else
3. Alternatively, create `~/.vim_runtime/my_configs.vim` (referenced but not present)

### Finding Files
1. `<leader>j` for CtrlP fuzzy search
2. `<leader>f` for recent files
3. `<leader>nn` to open NERDTree

### Searching Code
1. `<leader>g` to start Ack search
2. Or select text and press `gv` in visual mode
3. Navigate results with `<leader>n` and `<leader>p`

### Working with Git
1. Use fugitive commands (`:Git`, `:Gstatus`, etc.)
2. `<leader>v` to copy GitHub link to current line
3. `<leader>d` to toggle diff gutter

## Git Workflow

- This is a personal configuration repo
- Commits should be descriptive
- Recent history shows simple messages ("modernized", "updated", "init")
- No specific commit message format enforced

## Dependencies & External Tools

### Required
- Vim 7.4+ (for most features)

### Optional (Enhance Functionality)
- `git` - for fugitive plugin
- `rg` (ripgrep) - for fast search
- `ag` (the_silver_searcher) - for fast search (fallback)
- `ack` - for search (fallback)
- `ctags` - for code navigation
- Compilers/interpreters for F5 functionality:
  - `gcc`, `g++` - C/C++
  - `javac`, `java` - Java
  - `python3` - Python
  - `go` - Go
  - `bash` - Shell scripts
  - `octave` - Matlab
- `eslint` - JavaScript linting
- `flake8` - Python linting
- `golint`, `errcheck` - Go linting

## Files to Never Edit

- `autoload/pathogen.vim` - Third-party plugin manager, managed upstream
- Plugins in `sources_forked/` - Edit only if you understand the customizations

## Files to Edit for Customization

- `vimrcs/main.vim` - Primary customization file
- `vimrcs/plugins_config.vim` - Plugin settings
- `vimrcs/filetypes.vim` - Language-specific settings
- `install.sh` - Installation behavior

## Performance Considerations

- Lazy redraw enabled for macro performance
- Swap files disabled - may lose unsaved work on crash
- Backups disabled - commit frequently to git
- ALE only lints on save, not during typing
- Pathogen loads all plugins on startup - more plugins = slower startup

## Security Notes

- Sudo save command (`:W`) executes `sudo tee` - be careful
- F5 compile/run executes code directly - verify before running
- Auto-read external changes - be aware of file modifications

## Future Agents: Key Takeaways

1. **Tab width is 2 spaces** (despite basic.vim saying 4)
2. **Leader key is comma** - most custom commands use it
3. **No tests** - manual verification required
4. **Forked from amix/vimrc** - some references may still point there
5. **Plugin manager is Pathogen** - not vim-plug, Vundle, or native packages
6. **main.vim loads last** - use it for overrides
7. **Git-aware** - repository is version controlled
8. **Personal config** - not a team/shared configuration
9. **F5 runs code** - language detection by filetype
10. **Search with Ack** - but prefers ripgrep/ag if installed

## Additional Context

- Owner: Jody (jodydadescott)
- Repository may be referenced as `jodys_vim` on GitHub
- Designed for terminal vim, with some GUI support
- MacOS-specific features (iTerm2 key labels, Command key mappings)
- Emphasis on developer productivity (quick file navigation, search, compilation)
