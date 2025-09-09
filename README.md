# vi-xournalpp

A Vi-like modal editing plugin for [Xournal++](https://github.com/xournalpp/xournalpp), version 1.1.x and 1.2.x.

## Branch Status - `my-nightly`

This is an actively maintained fork with enhanced features and modernized codebase. It's stable and production-ready for daily use, I have [lryffel/vi-xournalpp/issues/38](https://github.com/lryffel/vi-xournalpp/issues/38) opened to verify if I will be able to merge my code to the original plugin or not

**Key improvements over upstream:**

- **Modular architecture**: Clean separation into `api/`, `core/`, `keybindings/`, `config/` directories
- **CI/CD pipeline**: GitHub Actions with linting, formatting, and validation
- **New features**: Example is auto-loading Xournal++'s current palette with helper functions (`nextColor()`, `previousColor()`)
- **Enhanced ergonomics**: Mapping is targeting left hand for easier reach (opinionated)
- **Validation system**: Automatic keybinding conflict detection and validation
- **Better maintainability**: Split large files into focused modules

### Development Status

**Fully implemented modes:**

- **Tool Mode**: Complete tool switching, sizes, colors, and basic operations (designed that you don't need other modes)
- **Color Mode**: Dynamic palette loading, with grid like mapping
- **Shape Mode**: All shapes, rulers, and drawing tools
- **Edit Mode**: Selection tools, text, LaTeX, images
- **File Mode**: File operations, PDF handling, export functionality

**Partially implemented:** (original implementation or non yet)

- **Layer Mode**: Basic structure exists, core layer operations pending (see [API TODO](api/TODO.md))
- **Page Mode**: Page operations and background types  
- **Navigation Mode**: Scrolling, zooming, etc ...

## Installation

### From this fork (my-nightly branch)

**Linux:**

```bash
cd ~/.config/xournalpp/plugins
git clone -b my-nightly https://github.com/youssefadly237/vi-xournalpp
```

**Windows (PowerShell):**

```bash
cd $env:LOCALAPPDATA\xournalpp\plugins
git clone -b my-nightly https://github.com/youssefadly237/vi-xournalpp
```

### From original repository

**Linux:**

```bash
cd ~/.config/xournalpp/plugins
git clone https://github.com/lryffel/vi-xournalpp
```

**Windows (PowerShell):**

```bash
cd $env:LOCALAPPDATA\xournalpp\plugins
git clone https://github.com/lryffel/vi-xournalpp
```

**Activation:** In Xournal++, activate the plugin using the _Plugin Manager_ in the menu bar under _Plugin_.

vi-xournalpp is inspired by the modal editing popularized
by the text editor vi.
The two basic principles of the default keybindings of vi-xournalpp are

- They should be easy to remember mnemonically, although practically beats purity,
- They should be accessible by the left hand on a QWERTY keyboard.

The second principle is gold you may not break.

## Usage

vi-xournalpp centers around **modal editing** inspired by Vi/Vim. Different modes provide access to specialized keybindings, making many commands easily accessible from the left side of a QWERTY keyboard (ideal for stylus users).

**Quick start:**

- Press `Tab` to open the mode menu
- Select a mode (e.g., `c` for color, `s` for shape, `q` for page)
- Use mode-specific keybindings
- Press any key in tool mode to return, or `Shift+[mode]` for sticky mode

For complete keybinding reference, see [keybindings.md](keybindings.md).

## Configuration

### Modular Structure

The plugin is organized into focused modules for better maintainability:

- **`api/`**: Xournal++ API wrappers and integration
- **`core/`**: Core functionality (modes, handlers, utilities)
- **`keybindings/`**: Mode-specific keybinding definitions
- **`config/`**: Configuration files (colors, settings)

### Color Configuration

Color configuration is in `config/colors.lua`:

**For Xournal++ ≤ 1.2.2:** Define colors manually:

```lua
{ name = "Yellow", color = 0xf1fa8c, buttons = { "y" } }
```

**For newer versions:** Colors load dynamically from Xournal++'s palette with fallback to static definitions.

Use `Ctrl+R` in color mode to refresh the dynamic palette.

## Contributing

Interested in contributing? See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:

- Development setup and project structure
- Code style and testing procedures
- Adding new features, modes, and keybindings
- Contribution workflow and review process

**Quick start for contributors:**

- Fork and create feature branches
- Follow the modular structure
- Test with the validation system
- Keep PRs focused and well-documented

## License

MIT
