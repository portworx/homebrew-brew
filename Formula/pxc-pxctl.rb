class PxcPxctl < Formula
  desc "Portworx pxc component which adds support for pxctl commands"
  homepage "https://github.com/portworx/pxc"
  url "https://github.com/portworx/pxc/archive/v0.28.0.tar.gz"
  sha256 "f3bf2d058a507fd0d64e41aea85ca6cdba994a4725ca1538976b3efef2ee641a"
  license "Apache-2.0"

  depends_on "portworx/brew/pxc"

  def install
    bin.install "component/pxctl/pxc-pxctl"
  end

  test do
    assert_includes("pxc-pxctl", shell_output("#{bin}/pxc component list", 2))
  end
end
