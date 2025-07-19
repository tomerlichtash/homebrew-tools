class Dotsnapshot < Formula
  desc "A CLI utility to create snapshots of dotfiles and configuration"
  homepage "https://github.com/tomerlichtash/dotsnapshot"
  version "1.2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomerlichtash/dotsnapshot/releases/download/v1.2.0/dotsnapshot-macos-arm64.tar.gz"
      sha256 "2a31019797dfe9bb6399b80c8c05109205cb4d4f51979d2052b90f967c42edce"
    else
      url "https://github.com/tomerlichtash/dotsnapshot/releases/download/v1.2.0/dotsnapshot-macos-x86_64.tar.gz"
      sha256 "426911e6bd0b1bb8f1cdb0ded2948cae12d500df3dd11ee61d6342f640f41dde"
    end
  end

  on_linux do
    url "https://github.com/tomerlichtash/dotsnapshot/releases/download/v1.2.0/dotsnapshot-linux-x86_64.tar.gz"
    sha256 "70dc8b5a890587e727190d3efca93ed27f5b9bb6ff2ea9858e4b057c8efaa0e3"
  end

  depends_on "rust" => :build

  def install
    # Install the binary
    bin.install "dotsnapshot"
    
    # Generate and install shell completions
    generate_completions_from_executable(bin/"dotsnapshot", "--completions")
    
    # Generate and install man page
    (man1/"dotsnapshot.1").write Utils.safe_popen_read(bin/"dotsnapshot", "--man")
  end

  test do
    # Test version command
    assert_match "dotsnapshot 1.2.0", shell_output("#{bin}/dotsnapshot --version")
    
    # Test info command
    output = shell_output("#{bin}/dotsnapshot --info")
    assert_match "dotsnapshot v1.2.0", output
    assert_match "A CLI utility to create snapshots of dotfiles and configuration", output
    
    # Test list command
    output = shell_output("#{bin}/dotsnapshot --list")
    assert_match "Available plugins:", output
    
    # Test help command
    output = shell_output("#{bin}/dotsnapshot --help")
    assert_match "Usage:", output
    
    # Test completions generation
    output = shell_output("#{bin}/dotsnapshot --completions bash")
    assert_match "_dotsnapshot()", output
    
    # Test man page generation
    output = shell_output("#{bin}/dotsnapshot --man")
    assert_match ".TH dotsnapshot 1", output
  end
end