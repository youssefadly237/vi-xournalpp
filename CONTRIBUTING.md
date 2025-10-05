# Contributing to vi-xournalpp

Thank you for your interest in contributing to vi-xournalpp!

## Prerequisites

- Xournal++ nightly build
- Lua 5.4+ (for local testing)
- Git

## Development Setup

1. **Clone for development:**

   ```bash
   # Linux
   cd ~/.config/xournalpp/plugins
   git clone https://github.com/youssefadly237/vi-xournalpp

   # Windows (PowerShell)
   cd $env:LOCALAPPDATA\xournalpp\plugins
   git clone https://github.com/youssefadly237/vi-xournalpp
   ```

2. **Install pre-commit hooks:**

   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Project Structure

```text
vi-xournalpp/
├── main.lua              # Plugin entry point
├── plugin.ini            # Plugin metadata
├── api/                  # Xournal++ API wrappers
├── core/                 # Mode management and handlers
├── keybindings/          # Mode-specific bindings
├── config/               # Configuration files
└── validate_keybindings.lua # Validation system
```

## Code Standards

- **Formatting**: Automated via pre-commit hooks
- **Modularity**: Keep files focused and cohesive
- **Documentation**: Comment complex logic and API usage

## Adding Features

### New Keybindings

Each keybinding follows this structure:

```lua
keybindingName = {
  description = "Human readable description",
  buttons     = {"key", "alternative"},
  modes       = {"mode1", "mode2"},
  call        = function() api.SomeAction() end
}
```

**To add a keybinding:**

1. Add wrapper in `api/api.lua` if needed
2. Define binding in appropriate `keybindings/*.lua` file
3. Run validation to check for conflicts

### New Modes

1. Add mode name to `ALL_MODES` in `core/modes.lua`
2. Create `keybindings/newmode.lua`
3. Add mode switch binding in `keybindings/mode_switching.lua`
4. Import module in `keybindings/init.lua`

## Testing

Run validation locally:

```bash
lua validate_keybindings.lua
```

CI automatically validates all commits.

## Contribution Workflow

1. **Fork and branch:**

   ```bash
   git checkout -b feature/your-feature
   ```

2. **Develop and test:**

   ```bash
   lua validate_keybindings.lua
   ```

3. **Commit:**

   ```bash
   git commit -m "feat: description"
   ```

   (Pre-commit handles formatting automatically)

4. **Submit PR:**
   - Clear description of changes
   - Focused scope (single feature/fix)
   - Passing CI checks

## Guidelines

- **Check existing issues** before starting work
- **Keep PRs small** and focused
- **Discuss major changes** in an issue first
- **Be respectful** and constructive

## License

Contributions are licensed under the project's MIT license.

---

Questions? Open an issue for discussion.
