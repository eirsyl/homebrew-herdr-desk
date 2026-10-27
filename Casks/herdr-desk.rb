cask "herdr-desk" do
  arch arm: "arm64", intel: "x64"

  version "0.0.18"
  sha256 arm:   "274b70e5e276ee9a5f85589b5e297a6219b9d086a7846e4f47cd9591e0ce913a",
         intel: "fcd1d55cd14dc684622e4c51933c4937f8cb64ac498ef29cbe1f6edc253c2c3a"

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
