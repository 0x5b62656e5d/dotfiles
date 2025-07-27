return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    vim.api.nvim_set_hl(0, "Line1", { fg = "#ff80fb" })
    vim.api.nvim_set_hl(0, "Line2", { fg = "#f985ff" })
    vim.api.nvim_set_hl(0, "Line3", { fg = "#f28aff" })
    vim.api.nvim_set_hl(0, "Line4", { fg = "#ec8fff" })
    vim.api.nvim_set_hl(0, "Line5", { fg = "#e693ff" })
    vim.api.nvim_set_hl(0, "Line6", { fg = "#df97ff" })
    vim.api.nvim_set_hl(0, "Line7", { fg = "#d89cff" })
    vim.api.nvim_set_hl(0, "Line8", { fg = "#d2a1ff" })
    vim.api.nvim_set_hl(0, "Line9", { fg = "#cba4ff" })
    vim.api.nvim_set_hl(0, "Line10", { fg = "#c5a8ff" })
    vim.api.nvim_set_hl(0, "Line11", { fg = "#c0abff" })
    vim.api.nvim_set_hl(0, "Line12", { fg = "#bbaeff" })
    vim.api.nvim_set_hl(0, "Line13", { fg = "#b6b1ff" })
    vim.api.nvim_set_hl(0, "Line14", { fg = "#b1b3ff" })
    vim.api.nvim_set_hl(0, "Line15", { fg = "#acb5ff" })
    vim.api.nvim_set_hl(0, "Line16", { fg = "#a8b8ff" })
    vim.api.nvim_set_hl(0, "Line17", { fg = "#a4baff" })
    vim.api.nvim_set_hl(0, "Line18", { fg = "#a1bcff" })
    vim.api.nvim_set_hl(0, "Line19", { fg = "#9ebeff" })
    vim.api.nvim_set_hl(0, "Line20", { fg = "#9cc0ff" })
    vim.api.nvim_set_hl(0, "Line21", { fg = "#9ac1ff" })
    vim.api.nvim_set_hl(0, "Greeting", { fg = "#99c3ff" })
    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = "          _____                    _____                   _______                   _____                    _____                    _____          ",
        opts = { hl = "Line1", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         /\\    \\                  /\\    \\                 /::\\    \\                 /\\    \\                  /\\    \\                  /\\    \\         ",
        opts = { hl = "Line2", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "        /::\\____\\                /::\\    \\               /::::\\    \\               /::\\____\\                /::\\    \\                /::\\____\\        ",
        opts = { hl = "Line3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "       /::::|   |               /::::\\    \\             /::::::\\    \\             /:::/    /                \\:::\\    \\              /::::|   |        ",
        opts = { hl = "Line4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "      /:::::|   |              /::::::\\    \\           /::::::::\\    \\           /:::/    /                  \\:::\\    \\            /:::::|   |        ",
        opts = { hl = "Line5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "     /::::::|   |             /:::/\\:::\\    \\         /:::/~~\\:::\\    \\         /:::/    /                    \\:::\\    \\          /::::::|   |        ",
        opts = { hl = "Line6", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "    /:::/|::|   |            /:::/__\\:::\\    \\       /:::/    \\:::\\    \\       /:::/____/                      \\:::\\    \\        /:::/|::|   |        ",
        opts = { hl = "Line7", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   /:::/ |::|   |           /::::\\   \\:::\\    \\     /:::/    / \\:::\\    \\      |::|    |                       /::::\\    \\      /:::/ |::|   |        ",
        opts = { hl = "Line8", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "  /:::/  |::|   | _____    /::::::\\   \\:::\\    \\   /:::/____/   \\:::\\____\\     |::|    |     _____    ____    /::::::\\    \\    /:::/  |::|___|______  ",
        opts = { hl = "Line9", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " /:::/   |::|   |/\\    \\  /:::/\\:::\\   \\:::\\    \\ |:::|    |     |:::|    |    |::|    |    /\\    \\  /\\   \\  /:::/\\:::\\    \\  /:::/   |::::::::\\    \\ ",
        opts = { hl = "Line10", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "/:: /    |::|   /::\\____\\/:::/__\\:::\\   \\:::\\____\\|:::|____|     |:::|    |    |::|    |   /::\\____\\/::\\   \\/:::/  \\:::\\____\\/:::/    |:::::::::\\____\\",
        opts = { hl = "Line11", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "\\::/    /|::|  /:::/    /\\:::\\   \\:::\\   \\::/    / \\:::\\    \\   /:::/    /     |::|    |  /:::/    /\\:::\\  /:::/    \\::/    /\\::/    / ~~~~~/:::/    /",
        opts = { hl = "Line12", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " \\/____/ |::| /:::/    /  \\:::\\   \\:::\\   \\/____/   \\:::\\    \\ /:::/    /      |::|    | /:::/    /  \\:::\\/:::/    / \\/____/  \\/____/      /:::/    / ",
        opts = { hl = "Line13", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         |::|/:::/    /    \\:::\\   \\:::\\    \\        \\:::\\    /:::/    /       |::|____|/:::/    /    \\::::::/    /                       /:::/    /  ",
        opts = { hl = "Line14", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         |::::::/    /      \\:::\\   \\:::\\____\\        \\:::\\__/:::/    /        |:::::::::::/    /      \\::::/____/                       /:::/    /   ",
        opts = { hl = "Line15", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         |:::::/    /        \\:::\\   \\::/    /         \\::::::::/    /         \\::::::::::/____/        \\:::\\    \\                      /:::/    /    ",
        opts = { hl = "Line16", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         |::::/    /          \\:::\\   \\/____/           \\::::::/    /           ~~~~~~~~~~               \\:::\\    \\                    /:::/    /     ",
        opts = { hl = "Line17", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         /:::/    /            \\:::\\    \\                \\::::/    /                                      \\:::\\    \\                  /:::/    /      ",
        opts = { hl = "Line18", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "        /:::/    /              \\:::\\____\\                \\::/____/                                        \\:::\\____\\                /:::/    /       ",
        opts = { hl = "Line19", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "        \\::/    /                \\::/    /                 ~~                                               \\::/    /                \\::/    /        ",
        opts = { hl = "Line20", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "         \\/____/                  \\/____/                                                                    \\/____/                  \\/____/         ",
        opts = { hl = "Line21", shrink_margin = false, position = "center" },
      },
      {
        type = "padding",
        val = 1,
      },
      {
        type = "text",
        val = "Hello 0x5b62656e5d",
        opts = { hl = "Greeting", shrink_margin = false, position = "center" },
      },
    }

    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> lua LazyVim.pick()() <cr>"),
      dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button("r", " " .. " Recent files",    [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
      dashboard.button("g", " " .. " Find text",       [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
      dashboard.button("c", " " .. " Config",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
      dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }

    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#c59eff" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#6ff276" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#f5b469" })

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}