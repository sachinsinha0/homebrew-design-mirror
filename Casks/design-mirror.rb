cask "design-mirror" do
  version "1.3.0"
  sha256 "cb08f8b59c69e8c794f1a2f46d1352ea50d051118fa61e95b85eff9a9fa6c227"

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
