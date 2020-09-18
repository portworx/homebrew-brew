class PxcPxctl < Formula
  desc "Portworx pxc component which adds support for pxctl commands"
  homepage "https://github.com/portworx/pxc"
  url "https://github.com/portworx/pxc/archive/v0.31.0.tar.gz"
  sha256 "33b9c07eefbd2a753d9430a92560b0446838de9b8d2ccd35ca234acc0b98daaf"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc.git"

  depends_on "portworx/brew/pxc"

  def install
    bin.install "component/pxctl/pxc-pxctl"
  end

  def caveats
    <<~EOS
      Portworx pxc pxctl component installed. Example:

          kubectl pxc pxctl status

      See all your pxc components using:

          kubectl pxc component list

    EOS
  end

  test do
    assert_includes("pxc-pxctl", shell_output("#{bin}/pxc component list", 2))
  end
end
