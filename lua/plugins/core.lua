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
}
