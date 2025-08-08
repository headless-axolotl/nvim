local function adapters(dap)
    dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
    }
    dap.adapters.lldb = {
        -- type = "executable",
        -- name = "lldb",
        -- command = "/usr/bin/lldb-dap",
        type = "server",
        port = "${port}",
        executable = {
            command = "/usr/bin/lldb-dap",
            args = { "--port", "${port}" },
        }
    }
end

local function configurations(dap)
    dap.configurations.c = {
        {
            name = "gdb",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
        },
        -- {
        --     name = "gdb: Select and attach to process",
        --     type = "gdb",
        --     request = "attach",
        --     program = function()
        --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --     end,
        --     pid = function()
        --         local name = vim.fn.input('Executable name (filter): ')
        --         return require("dap.utils").pick_process({ filter = name })
        --     end,
        --     cwd = '${workspaceFolder}'
        -- },
        -- {
        --     name = 'gdb: Attach to server :1234',
        --     type = 'gdb',
        --     request = 'attach',
        --     target = 'localhost:1234',
        --     program = function()
        --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --     end,
        --     cwd = '${workspaceFolder}'
        -- },
    }
    dap.configurations.cpp = dap.configurations.c
    -- dap.configurations.zig = dap.configurations.c
    dap.configurations.zig = {
        {
            name = "lldb",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {}, -- why??
        },
        table.unpack(dap.configurations.c),
    }
    dap.configurations.rust = {
        {
            name = "gdb: Rust Auto",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
        },
        table.unpack(dap.configurations.c)
    }
end

local nvim_dap = {
    "mfussenegger/nvim-dap",
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set('n', '<leader>ds', dap.continue, {})
        vim.keymap.set('n', '<leader>do', dap.step_over, {})
        vim.keymap.set('n', '<leader>di', dap.step_into, {})
        vim.keymap.set('n', '<leader>du', dap.step_out, {})
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<leader>dk', function() require("dap.ui.widgets").hover() end, { desc = 'hover' })

        adapters(dap)

        configurations(dap)

        dapui.setup({})
    end,
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
        }
    }
}

return {
    nvim_dap
}
