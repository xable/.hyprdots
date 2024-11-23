return {
  "akinsho/bufferline.nvim",
  config = {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = ":bdelete! %d",
      right_mouse_command = ":bdelete! %d",
      offsets = {
        {
          filetype = "neo-tree",
          text = " File Explorer",
          highlight = "Directory",
          text_align = "center",
        }
      },
      indicator = {
        icon = "▎",
        style = "icon",
      },
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      separator_style = "thin",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
    },
    highlights = {
      buffer_selected = {
        bold = false,
        italic = false,
      },
      tab_selected = {
        bold = false,
        italic = false,
      },
    },
  },
}
