class Infrafile < Formula
  desc "Git-backed infrastructure ledger with credential references and read-only MCP"
  homepage "https://github.com/infrafile/infrafile"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.3.0/infrafile_0.3.0_darwin_arm64.tar.gz"
      sha256 "a8f4a9e93fbca297f313c1698df118e7e4bba993d3881343bb3ea9cc674482a9"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.3.0/infrafile_0.3.0_darwin_amd64.tar.gz"
      sha256 "e22cb6ddfad9c0d0d4f02b2290019610b771ef33691e023584b0196c00ac3cca"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/infrafile/infrafile/releases/download/v0.3.0/infrafile_0.3.0_linux_arm64.tar.gz"
      sha256 "5e436bc177f968bd2310710f7a0384405232ce06c49930b7125655c9de037f89"
    end
    on_intel do
      url "https://github.com/infrafile/infrafile/releases/download/v0.3.0/infrafile_0.3.0_linux_amd64.tar.gz"
      sha256 "eb39f88ee6a34ceb51ddd2317184ae2f20bd6701b1225b13fad79c09823049d1"
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
