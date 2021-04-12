class PxcPds < Formula
  desc "Portworx pxc component for Portworx Data Services (PDS)"
  homepage "https://github.com/portworx/pxc-pds"
  url "https://github.com/portworx/homebrew-brew/releases/download/0.0.1/pxc-pds-0.0.4.tar.gz"
  sha256 "aec4d95fcecdef15c2c1820f72a4b84d0ee3d3654a5abba9611f5e3f9df45746"
  license "Apache-2.0"

  depends_on "portworx/brew/pxc"
  depends_on "helm"

  def install
    bin.install Dir["usr/local/bin/*"]
    pkgshare.install Dir["usr/local/share/pxc-pds/*"]
    pkgshare.install "VERSION"
    pkgshare.install "README.txt"
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
