return {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {
        config = {
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
        },
        choose_target = function(targets)
            -- Auto-select IbiunaBackend.sln if present
            for _, target in ipairs(targets) do
                if target:find("IbiunaBackend.sln") then
                    return target
                end
            end
            return targets[1]
        end,
    },
}
