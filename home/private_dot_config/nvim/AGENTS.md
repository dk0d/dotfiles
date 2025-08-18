AGENTS guide for this Neovim config repo

Build/Lint/Test
- Dependencies: Neovim >= 0.10, lazy.nvim bootstraps plugins on first run.
- Format (Lua): stylua per .stylua.toml (2-space, Spaces). Run: stylua .
- Lint (Lua): luacheck per .luacheckrc (globals: vim, bit; ignore 631, 212/_.*). Run: luacheck .
- Static analysis (Lua): selene per selene.toml (std=neovim, several leniencies). Run: selene .
- Tests: this repo has no unit tests; neotest plugin mappings exist to run project tests inside Neovim for Python (pytest) and Rust. Single test examples:
  - Python (pytest): pytest path/to/test_file.py::TestClass::test_name
  - Rust: cargo test test_name -- --exact

Code Style
- Imports/Requires: group std libs first, third-party next, local modules last; prefer local cached requires at top: local x = require("x"). Avoid dynamic require paths.
- Formatting: run stylua before committing; keep inline "-- stylua: ignore" only where necessary.
- Types/Docs: prefer typed-like annotations in comments and clear table shapes; keep function signatures small; document side effects.
- Naming: snake_case for variables/functions; PascalCase for modules with constructors; ALL_CAPS for constants; prefix intentionally-unused args with _ per luacheck.
- Errors: return nil, err for recoverable issues; use vim.notify for user-facing errors; avoid pcall swallowing—log context; prefer assert for programmer errors.
- Neovim APIs: use vim.api/vim.fn sparingly; prefer vim.keymap.set, vim.opt, vim.g; avoid deprecated APIs.
- Plugins: keep plugin specs under lua/plugins/*.lua; one plugin per file when possible; options via opts keys; do not hardcode user paths.
- Performance: avoid heavy work on startup; defer require within functions when possible; use lazy-loading/events.
- File layout: config in lua/config, LSP in lua/lsp, utilities in lua/utils. Keep public utils under utils/init.lua with clear names.

AI assistant rules
- If Cursor/Copilot rules exist: none found (.cursor/rules/, .cursorrules, .github/copilot-instructions.md not present). If added later, follow and mirror here.
- Before commits, run: stylua ., luacheck ., selene .. For Lua-only edits, ensure no new globals.
