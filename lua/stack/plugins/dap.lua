return {
    "jay-babu/mason-nvim-dap.nvim",
    keys = {
        { "<leader>dp",  "<CMD>lua require('dap').toggle_breakpoint()<CR>" },
        { "<leader>dn",  "<CMD>lua require('dap').continue()<CR>" },
        { "<leader>dk",  "<CMD>lua require('dap').step_out()<CR>" },
        { "<leader>dj",  "<CMD>lua require('dap').step_over()<CR>" },
        { "<leader>dl",  "<CMD>lua require('dap').step_into()<CR>" },
        { "<leader>dr",  "<CMD>lua require('dap').restart()<CR>" },
        { "<leader>dt",  "<CMD>lua require('dap').terminate()<CR>" },
        { "<leader>dfv", "<CMD>Telescope dap variables<CR>" },
        { "<leader>dfc", "<CMD>Telescope dap configurations<CR>" },
        { "<leader>dfb", "<CMD>Telescope dap list_breakpoints<CR>" },
    },
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        require("mason-nvim-dap").setup({ handlers = {} })
        require("nvim-dap-virtual-text").setup()
        require("telescope").load_extension("dap")
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end
    end
}
