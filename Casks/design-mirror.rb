cask "design-mirror" do
  version "1.1"
  sha256 "fb56c90b4384eaa8cc37fc43e0f6c6e0e182010971f33429a42ea50738fb096e"

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
