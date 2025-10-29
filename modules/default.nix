{
  # NixOS modules
  nixos = import ./nixos.nix;

  # Home Manager modules
  home = import ./home.nix;
}
