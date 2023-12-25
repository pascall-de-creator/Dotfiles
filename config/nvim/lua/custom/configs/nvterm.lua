local options = {
    terminals = {
        shell = "nu",
        type_opts = {
            float = {
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.7,
            },
            horizontal = { split_ratio = .35 },
            vertical = { split_ratio = .5 },
        }
    },
}

return options
