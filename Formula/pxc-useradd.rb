class PxcUseradd < Formula
  desc "pxc component to add a user to Kubernetes"
  homepage "https://github.com/portworx/pxc/tree/master/component/useradd"
  url "https://github.com/portworx/pxc/archive/v0.31.1.tar.gz"
  sha256 "a25ef8825f3e141330e9b03aae0dd117e692969ad0ff8e9d564806b157b1077b"
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
