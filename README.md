# Flakes Collection

This repository contains a collection of Nix flakes, each providing different packages and configurations. Each subdirectory is named after its primary package and contains its own `flake.nix`.

## Structure



## Usage

You can use individual flakes directly:

```nix
{
  inputs.obsidian-cli.url = "github:bibijeebi/flakes?dir=obsidian-cli";
  # ...
}
```

Or import multiple flakes through the root flake:

```nix
{
  inputs.bibijeebi-flakes.url = "github:bibijeebi/flakes";
  # ...
}
```

## Available Flakes

- `obsidian-cli`: CLI tools for Obsidian
- (More flakes will be added here as they are created)

## Contributing

Feel free to open issues or submit pull requests for new flakes or improvements to existing ones.