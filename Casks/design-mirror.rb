cask "design-mirror" do
  version "1.2.2"
  sha256 "713ac9f28829d60fa60aa60751ea9ef7824e7f17118179dabd196a1e1050dda4"

  url "https://github.com/sachinsinha0/design-mirror/releases/download/v#{version}/Design.Mirror.dmg"
  name "Design Mirror"
  desc "Mirror your web pages into Figma"
  homepage "https://github.com/sachinsinha0/design-mirror"

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
