return {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    dependencies = { "mason.nvim" },
    opts = {
        choose_target = function(targets)
            local preferred = { "IbiunaBackend.sln", "IbiunaInvestorsBackend.sln", "BotoBackend.sln" }
            for _, name in ipairs(preferred) do
                for _, target in ipairs(targets) do
                    if target:find(name, 1, true) then
                        return target
                    end
                end
            end
            return targets[1]
        end,
    },
    init = function()
        vim.lsp.config("roslyn", {
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_literal_parameters = false,
                    csharp_enable_inlay_hints_for_object_creation_parameters = false,
                    csharp_enable_inlay_hints_for_parameters = false,
                    dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                    dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                    dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                },
            },
        })
    end,
}
