cask "design-mirror" do
  version "1.4.1"
  sha256 "8a8dd128234ffa273139d4256a23c53d117dfe8d7145241fee51e1b5135ceaa6"

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
