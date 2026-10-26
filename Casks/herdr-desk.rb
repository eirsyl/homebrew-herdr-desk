cask "herdr-desk" do
  arch arm: "arm64", intel: "x64"

  version "0.0.16"
  sha256 arm:   "373c9c468d8d3f3f622178884f03f10f13b27f2a6fb9364ce8fa48a0d550e2a7",
         intel: "7d2513b420b375692bb864ccc680819a1d019bf3c2510f914a49e67bc53322b4"

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
