# Parallex as an app, from parallex.mandip.dev. The tap is
# github.com/mandipadk/homebrew-parallex:
#
#   brew install --cask mandipadk/parallex/parallex
#
# `make cask` updates the version and checksum after a release, and
# `make tap` copies this file to the tap.
cask "parallex" do
  version "3.3.0"
  sha256 "fd2d65a141c6c5bc0a9516e546dc0aeeb41f509b5e06ad8422710a11782d318d"

  url "https://parallex.mandip.dev/download/#{version}/Parallex-#{version}.zip"
  name "Parallex"
  desc "Run separate instances of apps side by side"
  homepage "https://parallex.mandip.dev/"

  # /download/latest/Parallex.zip redirects to the newest release's zip.
  livecheck do
    url "https://parallex.mandip.dev/download/latest/Parallex.zip"
    regex(/Parallex[._-]v?(\d+(?:\.\d+)+)\.zip/i)
    strategy :header_match
  end

  # Parallex updates itself (signed updates, checked against its own key).
  auto_updates true
  depends_on macos: :sonoma

  app "Parallex.app"
  binary "#{appdir}/Parallex.app/Contents/Resources/parallex"

  # Parallex isn't notarized yet, so macOS would stop it on first open and
  # send you to System Settings › Open Anyway. The download is checked
  # against the checksum above instead, as the Terminal installer does.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Parallex.app"]
  end

  # Only Parallex's own settings: your instances and their data are kept.
  zap trash: [
    "~/Library/Caches/com.parallex.app",
    "~/Library/Preferences/com.parallex.app.plist",
  ]

  caveats <<~EOS
    Before uninstalling, turn off link routing in Parallex › Settings › Links,
    so your default browser and sign-in links go back to the apps you had.
  EOS
end
