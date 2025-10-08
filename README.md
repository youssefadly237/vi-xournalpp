# vi-xournalpp

Vi-inspired modal editing for [Xournal++](https://github.com/xournalpp/xournalpp).

## Overview

🚧 **Under active development, some features may not work as expected.**

This is a modernized fork of the original vi-xournalpp plugin,
refactored for Xournal++'s **nightly builds** using the new plugin API.
The original plugin targets stable releases and relies on deprecated APIs
that still function in nightly but will be removed in future versions.

**Why this fork exists:**

- Built against the **modern plugin API** (nightly builds only)
- Architectural improvements for maintainability and extensibility
- Enhanced features and ergonomics
- Active development and CI/CD integration

> **Note:** This fork is not compatible with stable Xournal++ releases. Use the
[original plugin](https://github.com/lryffel/vi-xournalpp) for stable versions.

## Features

### Core Improvements

- **Modern API foundation**: Written for Xournal++'s current plugin architecture
- **Modular codebase**: Clean separation (`api/`, `core/`, `keybindings/`, `config/`)
- **Automated validation**: Conflict detection and keybinding validation
- **CI/CD pipeline**: Linting, formatting, and automated checks
- **Dynamic palette integration**: Auto-loads colors from Xournal++'s current palette

### Modal System

**Production-ready modes:**

- **Tool Mode** — Primary interface for tool switching, sizes, colors, basic operations
- **Color Mode** — Grid-based palette navigation with dynamic loading
- **Shape Mode** — Geometric shapes, rulers, drawing tools
- **Edit Mode** — Selection, text, LaTeX, image insertion
- **File Mode** — Document operations, PDF handling, export

**In development:**

- **Layer Mode** — Layer management (API implementation pending, see [api/TODO.md](api/TODO.md))
- **Page Mode** — Page operations and backgrounds
- **Navigation Mode** — Viewport control and zoom

## Installation

### Requirements

- Xournal++ **nightly build** (this plugin is incompatible with stable releases)
- Git

### Linux

```bash
cd ~/.config/xournalpp/plugins
git clone https://github.com/youssefadly237/vi-xournalpp
```

### Windows

```powershell
cd $env:LOCALAPPDATA\xournalpp\plugins
git clone https://github.com/youssefadly237/vi-xournalpp
```

### Activation

1. Launch Xournal++
2. Navigate to **Plugin** → **Plugin Manager**
3. Enable `vi-xournalpp`

## Usage

vi-xournalpp implements modal editing principles inspired by Vi/Vim:

- **Mnemonic keybindings** — Commands are easy to remember
- **Left-hand optimization** — Primary bindings accessible on QWERTY left side
(ideal for stylus use)

### Quick Start

1. Press `Tab` to open the mode menu
2. Select a mode (`c` = color, `s` = shape, `q` = page, etc.)
3. Execute mode-specific commands
4. Return to tool mode by pressing any tool key,
or use `Shift+[mode key]` for sticky mode

**Complete keybinding reference:** [keybindings.md](keybindings.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for:

- Development environment setup
- Architecture and coding standards
- Testing and validation procedures
- Pull request guidelines

**Contribution workflow:**

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Follow the modular architecture
4. Run validation tests
5. Submit a focused, well-documented PR

## License

MIT License — see [LICENSE](LICENSE) for details.

## Acknowledgments

Based on the original [vi-xournalpp](https://github.com/lryffel/vi-xournalpp)
by lryffel.
