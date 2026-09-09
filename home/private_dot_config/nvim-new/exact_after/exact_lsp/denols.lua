return {
  root_markers = { "deno.json", "deno.jsonc", "deno.lock" },
  workspace_required = true,
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = { ["https://deno.land"] = true, ["https://cdn.nest.land"] = true, ["https://crux.land"] = true },
      },
    },
  },
}
