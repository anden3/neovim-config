return {
    "ethanholz/nvim-lastplace",
    "lambdalisue/suda.vim",
    { "nvim-telescope/telescope-fzf-native.nvim",
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "Saecki/crates.nvim", tag = "v0.3.0", event = "BufRead Cargo.toml",
        dependencies = { "nvim-lua/plenary.nvim" } },
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    { "antosha417/nvim-lsp-file-operations", dependencies = {
        "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" }},

    { "windwp/nvim-autopairs", event = "InsertEnter" },
    "danilamihailov/beacon.nvim",
    { "phaazon/hop.nvim", branch = "v2", config = true },
}

