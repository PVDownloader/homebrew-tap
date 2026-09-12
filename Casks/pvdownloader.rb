cask "pvdownloader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "e08b05d5653ef8c83b2b87684d9a258f430e3592e519e5fec1f7a5462f4e87ee",
         intel: "8efba793b45d67b5f3a8247153b13a1859cc59c925a7a1d14d99cf99ed5ac6ec"

  url "https://github.com/berkealp/pvdownloader/releases/download/v#{version}/PVDownloader-osx-#{arch}-Setup.pkg"
  name "PVDownloader"
  desc "High-speed, ad-free media archiving tool"
  homepage "https://pvdownloader.com"

  pkg "PVDownloader-osx-#{arch}-Setup.pkg"

  uninstall pkgutil: "com.pvdownloader.app"
end