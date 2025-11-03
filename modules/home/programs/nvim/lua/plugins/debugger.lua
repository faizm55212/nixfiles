return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "console"},
            },
            size = 10,
            position = "bottom",
          },
          {
            elements = {
              { id = "scopes"},
            },
            size = 40,
            position = "right",
          },
        },
        controls = {
          enabled = true,
          element = "console",
        },
      })

      -- Auto open / close
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

      -- Adapter setup
      dap.adapters.codelldb = {
        type = "server",
        port = "1337",
        executable = {
          command = "codelldb",
          args = { "--port", "1337" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.expand("%:p:r")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          console = "integratedTerminal",
        },
      }
    end,
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debugger Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Debugger continue",
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
        end,
        desc = "Debugger terminate",
      },
    },
  },
}
