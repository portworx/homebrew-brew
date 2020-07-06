class Pxc < Formula
  desc "Portworx Client"
  url "file:///home/lpabon/git/golang/src/github.com/portworx/pxc/pxc-0.28.0.tar.gz"
  sha256 "f3bf2d058a507fd0d64e41aea85ca6cdba994a4725ca1538976b3efef2ee641a"
  license "Apache-2.0"
  version "0.28.0"

  depends_on "go" => :build

  def install
    # Necessary to build a golang program. Not sure why this is not
    # part of brew
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/portworx").mkpath
    ln_sf buildpath, buildpath/"src/github.com/portworx/pxc"

    system "make", "VERSION=#{version}", "pxc", "kubectl-pxc"
    bin.install "pxc"
    bin.install "kubectl-pxc"
  end

  test do
    assert_includes(version.to_s, shell_output("#{bin}/pxc version", 2))
  end
end
