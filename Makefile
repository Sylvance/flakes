.PHONY info
info:
	nix-shell -p nix-info --run "nix-info -m"

.PHONY setup
setup:
	sh <(curl -L https://nixos.org/nix/install)
