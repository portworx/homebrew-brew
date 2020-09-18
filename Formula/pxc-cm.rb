class PxcCm < Formula
  desc "Portworx Cluster Manager Example Compoment"
  homepage "https://github.com/portworx/pxc/tree/master/component/examples/golang"
  url "https://github.com/portworx/pxc/archive/v0.31.0.tar.gz"
  sha256 "33b9c07eefbd2a753d9430a92560b0446838de9b8d2ccd35ca234acc0b98daaf"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc.git"

  depends_on "go" => :build

  def install
    # Necessary to build a golang program. Not sure why this is not
    # part of brew
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/portworx").mkpath
    ln_sf buildpath, buildpath/"src/github.com/portworx/pxc"

    cd "component/examples/golang" do
      system "make", "VERSION=#{version}", "pxc-cm"
      bin.install "pxc-cm"
    end
  end

  def caveats
    <<~EOS
      Portworx example component installed. Type:

          kubectl pxc cm --help

      for more information.

    EOS
  end

  test do
    assert_includes(version.to_s, shell_output("#{bin}/pxc-cm version", 2))
  end
end
