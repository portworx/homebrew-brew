class PxcUseradd < Formula
  desc "pxc component to add a user to Kubernetes"
  homepage "https://github.com/portworx/pxc/tree/master/component/useradd"
  url "https://github.com/portworx/pxc/archive/v0.31.0.tar.gz"
  sha256 "33b9c07eefbd2a753d9430a92560b0446838de9b8d2ccd35ca234acc0b98daaf"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc.git"

  depends_on "portworx/brew/pxc"

  def install
    bin.install "component/useradd/pxc-useradd"
  end

  def caveats
    <<~EOS
      Portworx example component installed. Type:

          kubectl pxc useradd --help

      for more information.

    EOS
  end

  test do
    assert_includes("pxc-useradd", shell_output("#{bin}/pxc component list", 2))
  end
end
