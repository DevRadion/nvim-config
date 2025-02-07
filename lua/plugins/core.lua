local dashboard_header = require("misc.dashboard_header")

return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
    },
    --     "f-person/auto-dark-mode.nvim",
    --     opts = {
    --         update_interval = 1000,
    --         set_dark_mode = function()
    --             vim.api.nvim_set_option_value("background", "dark", {})
    --             vim.cmd("colorscheme onedark_dark")
    --         end,
    --         set_light_mode = function()
    --             vim.api.nvim_set_option_value("background", "light", {})
    --             vim.cmd("colorscheme onelight")
    --         end,
    --     },
    -- },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                go = { "gofmt" },
                zig = { "zigfmt" },
                rs = { "rustfmt" },
            },
        },
    },
    {
        "snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    header = dashboard_header,
                },
            },
        },
    },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
}
