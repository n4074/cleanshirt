self: super:
with super.lib;
{
  neovim = super.neovim.override {
    configure = {
      customRC = readFile ./init.vim;

      packages._ = with self.pkgs.vimPlugins; {
        start = [
            vim-nix
            vim-toml
            nerdtree
            haskell-vim
        ];
        opt = [ ];
      };
    };
  };
}