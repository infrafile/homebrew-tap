class Infrafile < Formula
  desc "Git-backed infrastructure ledger with credential references and read-only MCP"
  homepage "https://github.com/infrafile/infrafile"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.1.0/infrafile_0.1.0_darwin_arm64.tar.gz"
      sha256 "afee1a37bcd4d78c461b7ef8149563d362fb7d2647bf797118b40b370df5d6bc"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.1.0/infrafile_0.1.0_darwin_amd64.tar.gz"
      sha256 "4909d39f124e8e5f5748e679d125b9bb43ad86bb1d26a6276393bd8032f316ef"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.1.0/infrafile_0.1.0_linux_arm64.tar.gz"
      sha256 "18e0cad31c00dbb0e4312095700902761f158af717a60128277b47f3b1b8e31f"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.1.0/infrafile_0.1.0_linux_amd64.tar.gz"
      sha256 "fb2d2bcd636e270437766639cdd926e327d4905c15927f89b2d7ac9b11e64df4"
    end
  end

  def install
    bin.install "infrafile"
    bin.install_symlink "infrafile" => "ifl"
    pkgshare.install "examples", "docs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infrafile version")
    assert_equal shell_output("#{bin}/infrafile version"), shell_output("#{bin}/ifl version")
    system bin/"infrafile", "validate", pkgshare/"examples/homelab"
  end
end
