" Configuración básica
set number          " Muestra números de línea
set relativenumber   " Muestra números de línea relativos
set autoindent      " Indentación automática
set tabstop=4       " Tamaño de tabulación
set shiftwidth=4    " Ancho de indentación
set expandtab       " Usa espacios en lugar de tabulaciones
set softtabstop=4   " Espacios antes y después de un tabulación
set wrap            " Habilita envoltura de texto
set linebreak       " Inserta saltos de línea en palabras largas
set clipboard+=unnamedplus " Copia al portapapeles

" Configuración de Neovim
let g:python3_host_prog = '/home/yulesky/.config/bin/python3'
let g:node_client_debug = 1



" Inicio de la configuración de plugins
call plug#begin('~/.config/nvim/plugged')

" Plugins de interfaz y utilidad
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
" Plugins de autocompletado y LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugins de JavaScript y TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

" Plugins de depuración
Plug 'mfussenegger/nvim-dap'


" Plugins de compilación y ejecución



" Plugins de gestión de tareas
Plug 'EthanJWright/vs-tasks.nvim'


" Integración con Herramientas Externas
Plug 'tpope/vim-fugitive'

call plug#end()

" Configuraciones adicionales
" NerdTree Config
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Gruvbox Config
set background=dark
let g:gruvbox_background='medium'
colorscheme github_dark


" Coc Config
source /home/yulesky/.config/nvim/Coc_conf.vim
let g:airline_section_a = '%{escape(coc#status(), "%")}'

" Emmet Config
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={'javascript':{'extends':'jsx'}}


" Commentary Config
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#buffer_nr_show = 1
let g:airline#extensions#left_sep = ' '
let g:airline#extensions#left_alt_sep = '|'

" Teclas de acceso rápido para navegar entre pestañas
nnoremap <F14> :tabnext<CR>
nnoremap <F15> :tabprev<CR>

" Configuraciones para Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Para Zeioth/compiler.nvim
nnoremap <F6> :CompilerOpen<cr>
nnoremap <S-F6> :CompilerStop<cr>:CompilerRedo<cr>
nnoremap <S-F7> :CompilerToggleResults<cr>

" Para Zeioth/makeit.nvim
nnoremap <F8> :MakeitOpen<cr>
nnoremap <S-F8> :MakeitToggleResults<cr>
nnoremap <F9> :MakeitRedo<cr>
nnoremap <S-F9> :MakeitStop<cr>>

"lazy.nvim
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local lazy = require("lazy")

lazy.setup({
    {
        "Zeioth/compiler.nvim",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        requires = {"stevearc/overseer.nvim", "nvim-telescope/telescope.nvim"}
    },
    {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        config = function()
          require('overseer').setup({
            task_list = {
              direction = 'bottom',
              min_height = 25,
              max_height = 25,
              default_detail = 1
            },
          })
        end
    },
    {
        "Zeioth/makeit.nvim",
        cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo"},
        requires = {"stevearc/overseer.nvim"},
        config = function()
          require('makeit').setup({})
        end
    },
    {
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo"},
        config = function()
          require('overseer').setup({
            task_list = {
              direction = 'bottom',
              min_height = 25,
              max_height = 25,
              default_detail = 1
            },
          })
        end
    },
            {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },    {"vim-airline/vim-airline"},
    {"vim-airline/vim-airline-themes"},
    {"ryanoasis/vim-devicons"},
    {"tpope/vim-commentary"},
    {"tpope/vim-surround"},
    {"preservim/nerdtree"},
    {"neoclide/coc.nvim", branch = "release"},
    {"pangloss/vim-javascript"},
    {"leafgarland/typescript-vim"},
    {"Quramy/vim-js-pretty-template"},
    {"maxmellon/vim-jsx-pretty"},
    {"mattn/emmet-vim"},
    {"morhetz/gruvbox"},
    {"projekt0n/github-nvim-theme"},
    {"mfussenegger/nvim-dap"},
    {"EthanJWright/vs-tasks.nvim"},
    {"tpope/vim-fugitive"}


})
EOF

