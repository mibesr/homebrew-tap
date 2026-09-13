cask "echomusic" do
  version "2.3.2-beta.3"
  sha256 :no_check

  url "https://github.com/hoowhoami/EchoMusic/releases/download/v#{version}/EchoMusic-#{version}-macOS-#{arch}.dmg",
      verified: "https://github.com"

  name "EchoMusic"
  desc "音乐播放器"
  homepage "https://github.com/hoowhoami/EchoMusic"

  on_intel do
    arch = "x64"
  end
  on_arm do
    arch = "arm64"
  end

  app "EchoMusic.app"

  zap trash: [
    "~/Library/Application Support/EchoMusic",
    "~/Library/Logs/EchoMusic",
    "~/Library/Preferences/cc.cd.echomusic.plist",
    "~/Library/Saved Application State/cc.cd.echomusic.savedState",
  ]
end
