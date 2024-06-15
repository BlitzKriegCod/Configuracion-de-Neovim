return {
"nvim-treesitter/nvim-treesitter",
build ="TSUpdate",
event ="VeryLazy",
main = "nvim-treesitter.config",
opts = {
   ensure_installed = {"koto", "solidity", "vimdoc","bash","c_sharp","c", "cpp", "python", "javascript", "typescript", "java", "angular", "css", "scss", "html", "lua"} ,
    highlight = {
    enable = true,
  additional_vim_regex_highlighting = false, },
  indent + {enable =true },
}


}
