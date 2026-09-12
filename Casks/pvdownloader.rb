cask "pvdownloader" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "e2baecbbcfd6a7e1b224f5f8475ba20553be167e5df7258f07da4b845a7ff1a1",
         intel: "501fd589765bca1bad6e210cf433613b54e49bf87c3d02b187880787843ff7e6"

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
