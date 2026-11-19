cask "agent-awake" do
  version "1.1.0"
  sha256 "f4ae987b013b34a0385d5f453dceedf9a64acbca36c3a5d02779d549fffa0a37"

  url "https://github.com/emretufekci/agent-awake/releases/download/v#{version}/AgentAwake.zip"
  name "AgentAwake"
  desc "Keeps the computer awake until AI coding agents finish, then sleeps"
  homepage "https://github.com/emretufekci/agent-awake"

  depends_on :macos

  app "AgentAwake.app"

  uninstall launchctl: "local.agentawake",
            quit:      "local.agentawake"

  zap trash: [
    "~/Library/Application Support/AgentAwake",
    "~/Library/LaunchAgents/local.agentawake.plist",
    "~/Library/Logs/AgentAwake.log",
    "~/Library/Preferences/local.agentawake.plist",
  ]
end
