cask "echomusic" do
  arch arm: "arm64", intel: "x64"

  version "2.3.2-beta.4"
  sha256 :no_check

  url "https://github.com/hoowhoami/EchoMusic/releases/download/v#{version}/EchoMusic-#{version}-macOS-#{arch}.dmg"
  name "EchoMusic"
  desc "A simple and powerful third-party music player"
  homepage "https://github.com/hoowhoami/EchoMusic"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:[._-](?:alpha|beta|rc)\.?\d+)?)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  app "EchoMusic.app"

  zap trash: [
    "~/Library/Application Support/EchoMusic",
    "~/Library/Logs/EchoMusic",
    "~/Library/Preferences/cc.cd.echomusic.plist",
    "~/Library/Saved Application State/cc.cd.echomusic.savedState",
  ]
end
