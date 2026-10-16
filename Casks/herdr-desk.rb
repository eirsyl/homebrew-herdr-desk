cask "herdr-desk" do
  arch arm: "arm64", intel: "x64"

  version "0.0.4"
  sha256 arm:   "1ffa362aa178eaea1f63034492848b84e4a899c0dfeea46d39ba6949b489daef",
         intel: "6d9525a2bac0ce5a4fe80188f9f7852089043719055d4403fb666afd65d0c57c"

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
  depends_on macos: ">= :ventura"

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
