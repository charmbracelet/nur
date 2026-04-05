# Nix User Repository

This repository contains Charm's [Nix User Repository](https://github.com/nix-community/NUR).

![Build and populate cache](https://github.com/charmbracelet/nur/workflows/Build%20and%20populate%20cache/badge.svg)

## Usage

### Packages

There are multiple ways to use packages from this repository:

#### NUR Path

First, configure NUR according to the [official instructions](https://github.com/nix-community/NUR#installation).

Then reference packages via the NUR namespace:

```nix
environment.systemPackages = [
  nur.repos.charmbracelet.packages.gum
  nur.repos.charmbracelet.packages.glow
  nur.repos.charmbracelet.packages.mods
];
```

#### Overlay

The overlay allows you to use packages directly from `pkgs` without the NUR namespace.

##### Via NUR

After setting up NUR, add the overlay:

```nix
nixpkgs.overlays = [
  nur.repos.charmbracelet.overlays.default
];

environment.systemPackages = [
  pkgs.gum
  pkgs.glow
  pkgs.mods
];
```

##### Via Flake

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    charmbracelet = {
      url = "github:charmbracelet/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, charmbracelet, ... }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          nixpkgs.overlays = [ charmbracelet.overlays.default ];
          environment.systemPackages = [
            pkgs.gum
            pkgs.glow
            pkgs.mods
          ];
        }
      ];
    };
  };
}
```

#### 3. Direct Flake Reference

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    charmbracelet.url = "github:charmbracelet/nur";
  };

  outputs = { self, nixpkgs, charmbracelet, ... }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          environment.systemPackages = [
            charmbracelet.packages.x86_64-linux.gum
            charmbracelet.packages.x86_64-linux.glow
            charmbracelet.packages.x86_64-linux.mods
          ];
        }
      ];
    };
  };
}
```

### Modules

This repository provides NixOS and Home Manager modules. Currently available:

- **crush**: Terminal-based AI assistant

#### Via NUR

First, configure NUR according to the [official instructions](https://github.com/nix-community/NUR#installation).

Then import the module:

**NixOS:**
```nix
imports = [
  nur.repos.charmbracelet.modules.nixos.crush
];

programs.crush.enable = true;
```

**Home Manager:**
```nix
imports = [
  nur.repos.charmbracelet.modules.homeManager.crush
];

programs.crush.enable = true;
```

#### Via Flake

**NixOS:**
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    charmbracelet = {
      url = "github:charmbracelet/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, charmbracelet, ... }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        charmbracelet.nixosModules.crush
        { programs.crush.enable = true; }
      ];
    };
  };
}
```

**Home Manager:**
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    charmbracelet = {
      url = "github:charmbracelet/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, charmbracelet, home-manager, ... }: {
    homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      modules = [
        charmbracelet.homeModules.crush
        { programs.crush.enable = true; }
      ];
    };
  };
}
```

#### Configuration Options

**programs.crush**

- `enable` (boolean): Enable the `crush` tool (default: `false`).
- `package` (package): Override the package used for `crush`. Defaults to the package provided by this repository.
- `settings` (attribute set): Additional configuration settings for `crush`.

**Example: Override Package**

```nix
programs.crush = {
  enable = true;
  package = pkgs.callPackage /path/to/custom/crush {};
};
```

## Available Packages

- charm
- confettysh
- crush
- freeze
- glow
- gum
- markscribe
- melt
- mods
- pop
- sequin
- skate
- soft-serve
- vhs
- wishlist

---

Part of [Charm](https://charm.sh).

<a href="https://charm.sh/"><img alt="The Charm logo" src="https://stuff.charm.sh/charm-badge.jpg" width="400"></a>

Charm热爱开源 • Charm loves open source
