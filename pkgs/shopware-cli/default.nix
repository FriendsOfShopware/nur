# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    x86_64-linux = "0w9cydf4w824swfj7qs0c0nd8d22l3lqwwp8mxr6pvls1mr9ypj8";
    aarch64-linux = "0qcv6prgnam294915l0kh3pmah4xnzmbn5idrb5ivzlh8axl5420";
    x86_64-darwin = "1al3xh1jqxwh0cr4lksxxiwbg02i3yb17wp37khzzcqnk4vj96g2";
    aarch64-darwin = "1hh3ghq3gis310blphcdq9vl18aclxn9j8yiq0yiyrpmfi4iy4dl";
  };

  urlMap = {
    x86_64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.12/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.12/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.12/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.12/shopware-cli_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "shopware-cli";
  version = "0.4.12";
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
