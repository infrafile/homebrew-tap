class Infrafile < Formula
  desc "Git-backed infrastructure ledger with credential references and read-only MCP"
  homepage "https://github.com/infrafile/infrafile"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.2.0/infrafile_0.2.0_darwin_arm64.tar.gz"
      sha256 "4a017f0a9ba2fcca16cefa37c3c9da2d455822839a193ddc1fb6c5bd0dc995c1"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.2.0/infrafile_0.2.0_darwin_amd64.tar.gz"
      sha256 "d7b65495ca1c2aa9ec362e6a42faba2d839a204caba9ca463cb872c13e3631cd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.2.0/infrafile_0.2.0_linux_arm64.tar.gz"
      sha256 "835bf586f1dfbacccad20b661603e84c3ce76e8b7511f797f4866cdcc2ebe31a"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.2.0/infrafile_0.2.0_linux_amd64.tar.gz"
      sha256 "98861ec2638fea0398fbbdc5df42287422ba265d2ba37854824695dd620eee51"
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
