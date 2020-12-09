class PxcPds < Formula
  desc "Portworx pxc component for Portworx Data Services (PDS)"
  homepage "https://github.com/portworx/pxc-pds"
  url "https://github.com/portworx/homebrew-brew/releases/download/0.0.1/pxc-pds-v0.0.3-7-ge5aa647.tar.gz"
  sha256 "765632e29d9b07bc137245d32c33cf7cbc348a2d55b0da34e22b9fce842352e2"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc-pds.git"

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
