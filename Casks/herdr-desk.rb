cask "herdr-desk" do
  arch arm: "arm64", intel: "x64"

  version "0.0.2"
  sha256 arm:   "3dadb14526ddbc133ee950857db231067827cef55e177cfc6fa0195f5263c428",
         intel: "39042a0797030310a5f5d4c0915d092dfa7c8aa1c7d99d49b44b4376b5aef5fb"

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
