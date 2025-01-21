local dashboard_header = require("misc.dashboard_header")

return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                go = { "gofmt" },
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
}
