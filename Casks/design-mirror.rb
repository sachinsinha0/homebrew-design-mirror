cask "design-mirror" do
  version "1.4.2"
  sha256 "41f96c8b07da216c923634b2ba0ed9bf9e84aa7dabea86c2a775e3fb529dfd69"

  url "https://github.com/sachinsinha0/design-mirror-releases/releases/download/v#{version}/Design.Mirror.dmg"
  name "Design Mirror"
  desc "Mirror your web pages into Figma"
  homepage "https://github.com/sachinsinha0/design-mirror-releases"

  app "Design Mirror.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Design Mirror.app"]
  end

  uninstall quit: "com.designmirror.app"

  zap trash: [
    "~/Library/Application Support/Design Mirror",
    "~/Library/Preferences/com.designmirror.app.plist",
    "/tmp/figma-pusher-runtime",
  ]
end
