cask "agent-awake" do
  version "1.1.0"
  sha256 "f4ae987b013b34a0385d5f453dceedf9a64acbca36c3a5d02779d549fffa0a37"

  url "https://github.com/emretufekci/agent-awake/releases/download/v#{version}/AgentAwake.zip"
  name "AgentAwake"
  desc "Keep your Mac awake until your AI coding agents finish, then sleep"
  homepage "https://github.com/emretufekci/agent-awake"

  depends_on macos: ">= :big_sur"

  app "AgentAwake.app"

  # The app is ad-hoc signed (not notarized); remove the quarantine flag so it opens.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentAwake.app"]
  end

  uninstall quit:      "local.agentawake",
            launchctl: "local.agentawake"

  zap trash: [
    "~/Library/Application Support/AgentAwake",
    "~/Library/LaunchAgents/local.agentawake.plist",
    "~/Library/Logs/AgentAwake.log",
    "~/Library/Preferences/local.agentawake.plist",
  ]
end
