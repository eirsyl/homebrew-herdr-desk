cask "herdr-desk" do
  arch arm: "arm64", intel: "x64"

  version "0.0.8"
  sha256 arm:   "1ff52bcf9c8f18484d5739092ecc2f70b7ad7fc7e433937793a9b92470c58784",
         intel: "48dfc6198d91df5b7e9b32b73b4a85174037e806d7ba0dfa8c70620c7f58a74c"

  url "https://github.com/eirsyl/homebrew-herdr-desk/releases/download/v#{version}/Herdr-Desk-#{version}-#{arch}.dmg"
  name "Herdr Desk"
  desc "Desktop app for Herdr, the agent multiplexer"
  homepage "https://github.com/eirsyl/homebrew-herdr-desk"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself; brew leaves it alone rather than fighting the updater.
  auto_updates true
  depends_on macos: :ventura

  app "Herdr Desk.app"
  binary "#{appdir}/Herdr Desk.app/Contents/Resources/bin/herdr-desk"

  uninstall quit: "no.sylliaas.herdr-desk"

  zap trash: [
    "~/.herdr-desk",
    "~/Library/Application Support/Herdr Desk",
    "~/Library/Caches/no.sylliaas.herdr-desk",
    "~/Library/Logs/Herdr Desk",
    "~/Library/Preferences/no.sylliaas.herdr-desk.plist",
    "~/Library/Saved Application State/no.sylliaas.herdr-desk.savedState",
  ]
end
