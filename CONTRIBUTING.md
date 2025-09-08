# Contributing to vi-xournalpp

Thank you for your interest in contributing to vi-xournalpp! This document provides guidelines for contributing to this fork (`my-nightly` branch).

## Project Overview

### Areas for Contribution

Nothing urgent the plugin is somehow fine, but if you want to add something to enhance the workflow that would be great

## Getting Started

### Prerequisites

- Xournal++ (version 1.1.x or 1.2.x)
- Lua 5.4+ (for local testing)
- Git

### Development Setup

1. **Install for testing:**

   ```bash
   # Linux - install directly to plugins directory
   cd ~/.config/xournalpp/plugins
   git clone -b my-nightly https://github.com/youssefadly237/vi-xournalpp
   
   # Windows (PowerShell)
   cd $env:LOCALAPPDATA\xournalpp\plugins
   git clone -b my-nightly https://github.com/youssefadly237/vi-xournalpp
   ```

2. **Install pre-commit**

   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Project Structure

```text
vi-xournalpp/
├── main.lua              # Plugin entry point and initialization
├── plugin.ini            # Plugin metadata
├── api/                  # Xournal++ API wrappers
│   ├── api.lua          # Main API functions
│   └── TODO.md          # Planned API implementations
├── core/                # Core functionality
│   ├── modes.lua        # Mode management
│   ├── handler.lua      # Event handling
│   └── utils.lua        # Helper functions
├── keybindings/         # Mode-specific keybindings
│   ├── init.lua         # Keybinding loader
│   ├── tools.lua        # Tool mode bindings
│   ├── colors.lua       # Color mode bindings
│   ├── shapes.lua       # Shape mode bindings
│   ├── edit.lua         # Edit mode bindings
│   ├── pages.lua        # Page mode bindings
│   ├── files.lua        # File mode bindings
│   ├── navigation.lua   # Navigation mode bindings
│   ├── layer.lua        # Layer mode bindings
│   └── mode_switching.lua # Mode transitions
├── config/              # Configuration
│   └── colors.lua       # Color definitions
├── .github/             # CI/CD and templates
│   └── workflows/ci.yml # GitHub Actions
└── validate_keybindings.lua # Validation system
```

## Development Guidelines

### Code Style

- **Formatting**: Use pre-commit hooks for consistent formatting
- **Comments**: Document complex logic and API interactions
- **Modules**: Keep modules focused and cohesive

### Keybinding Structure

Each keybinding follows this pattern:

```lua
keybindingName = {
  description = "Human readable description",
  buttons     = {"key", "alternative"},
  modes       = {"mode1", "mode2"},
  call        = function() api.SomeAction() end
}
```

**Fields:**

- `description`: Menu entry and terminal logging text
- `buttons`: Key combinations that trigger the action  
- `modes`: Which modes listen for these keys
- `call`: Function executed when triggered

### Adding New Features

#### New Modes

To add a new mode `newMode`:

1. Add `"newMode"` to `ALL_MODES` in `core/modes.lua`
2. Create `keybindings/newmode.lua` with keybinding definitions
3. Add mode switching keybinding in `keybindings/mode_switching.lua`
4. Import the new module in `keybindings/init.lua`

#### New Keybindings

To add a new keybinding:

1. Add API wrapper function in `api/api.lua` if needed
2. Define keybinding in appropriate `keybindings/*.lua` file
3. Run validation to check for conflicts

#### New API Functions

The plugin covers most of the Xournal++ API. To add new functionality:

1. Check [api/TODO.md](api/TODO.md) for planned implementations
2. Add wrapper function in `api/api.lua`
3. Create keybinding in appropriate mode file

## Testing

Run validation locally:

```bash
lua validate_keybindings.lua
```

Pre-commit hooks and CI automatically handle formatting and validation.

## Contribution Workflow

### 1. Plan Your Contribution

- **Check existing issues**: Look for related work or discussions
- **Small focused changes**: Keep PRs manageable and focused
- **Discuss major changes**: Open an issue for significant modifications

### 2. Development Process

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes and test
lua validate_keybindings.lua

# Commit (pre-commit handles formatting)
git commit -m "feat: add new navigation shortcuts"
```

### 3. Submission

- **Clear PR description**: Explain what and why
- **Small scope**: Focus on single feature/fix

### 4. Review Process

- **Automated checks**: CI must pass
- **Code review**: Address feedback promptly

## Code of Conduct

- **Be respectful**: Treat all contributors with respect
- **Be constructive**: Provide helpful feedback and suggestions
- **Be patient**: Allow time for review and iteration
- **Be collaborative**: Work together towards common goals

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to vi-xournalpp! Your efforts help make this plugin better for everyone.
