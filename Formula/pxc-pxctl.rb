class PxcPxctl < Formula
  desc "Portworx pxc component which adds support for pxctl commands"
  homepage "https://github.com/portworx/pxc"
  url "https://github.com/portworx/pxc/archive/v0.30.0.tar.gz"
  sha256 "f722188bea6a780e854e564f06a94efe285252896a8b10b4ba9894c310e7c8c7"
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
