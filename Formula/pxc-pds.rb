class PxcPds < Formula
  desc "Portworx pxc component for Portworx Data Services (PDS)"
  homepage "https://github.com/portworx/pxc-pds"
  url "https://github.com/portworx/homebrew-brew/releases/download/0.0.1/pxc-pds-v0.0.3-4-g23337e4.tar.gz"
  sha256 "ca6147c83877a7aec40ceedbb87c8241c3da2770077f1308e325d23f70c20b32"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc-pds.git"

  depends_on "portworx/brew/pxc"
  depends_on "helm"

  def install
    bin.install Dir["usr/local/bin/*"]
    pkgshare.install Dir["usr/local/share/pxc-pds/*"]
  end

  def caveats
    <<~EOS
      Portworx pxc pds and app components installed. Example:

          kubectl pxc pds --help
          kubectl pxc app --help

      See all your pxc components using:

          kubectl pxc component list

    EOS
  end

  test do
    assert_includes("pxc-app", shell_output("#{bin}/pxc component list", 2))
    assert_includes("pxc-pds", shell_output("#{bin}/pxc component list", 2))
  end
end
