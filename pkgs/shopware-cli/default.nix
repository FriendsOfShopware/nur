# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "05rxbjxlny6ybjy9n9c1pakm1lspvjyjd6idrlr6lhwb1bhlbip6";
    aarch64-linux = "0v1y0jhdana10lx18l8xka4r5ixvlhm1prqyvdsb2jhab89bcfvc";
    x86_64-darwin = "1np7qd415hbyh50f680v3gx1qiqmpmdlq61f1rwqab6ang4ypiqn";
    aarch64-darwin = "0xzkc60y7zkxrgiw2jawqrz3nmma9hrx0b2sb889x3rq8xig7y3c";
  };

  urlMap = {
    x86_64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.5.7/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.5.7/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.5.7/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.5.7/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.5.7";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./shopware-cli $out/bin/shopware-cli
  '';
  postInstall = ''
    installShellCompletion --cmd shopware-cli \
    --bash <($out/bin/shopware-cli completion bash) \
    --zsh <($out/bin/shopware-cli completion zsh) \
    --fish <($out/bin/shopware-cli completion fish)
  '';

  system = system;

  meta = {
    description = "Command line tool for Shopware 6";
    homepage = "https://sw-cli.fos.gg";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
