cask "pvdownloader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "e08b05d5653ef8c83b2b87684d9a258f430e3592e519e5fec1f7a5462f4e87ee",
         intel: "8efba793b45d67b5f3a8247153b13a1859cc59c925a7a1d14d99cf99ed5ac6ec"

  url "https://github.com/Berke-Alp/pvdownloader-releases/releases/download/v#{version}/PVDownloader-osx-#{arch}-Setup.pkg"
  name "PVDownloader"
  desc "High-speed, ad-free media archiving tool"
  homepage "https://pvdownloader.com"

  # Velopack updates the app by itself. Without this, Homebrew treats the pin
  # below as the installed version forever: `brew outdated` always lists the
  # cask, and `brew upgrade --cask` reinstalls 1.0.0 over whatever the app has
  # already updated itself to.

  auto_updates true

  # The minimum stated on pvdownloader.com. Declared so an older Mac gets a
  # clear refusal instead of a bundle that will not launch.

  depends_on macos: ">= :monterey"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "PVDownloader-osx-#{arch}-Setup.pkg"

  # Confirmed on an installed machine: `pkgutil --pkgs | grep -i pv` prints
  # exactly this. It is NOT the id Velopack derives on its own — that would be
  # "com.<packAuthors>.<packId>" — so the build is passing an explicit bundle
  # id, and this line should not be "corrected" back to the derived form.

  uninstall pkgutil: "com.pvdownloader.app"
end
