class PxcCm < Formula
  desc "Portworx Cluster Manager Example Compoment"
  homepage "https://github.com/portworx/pxc/tree/master/component/examples/golang"
  url "https://github.com/portworx/pxc/archive/v0.31.1.tar.gz"
  sha256 "a25ef8825f3e141330e9b03aae0dd117e692969ad0ff8e9d564806b157b1077b"
  license "Apache-2.0"
  head "https://github.com/portworx/pxc.git"

  depends_on "go" => :build
  disable! date: "2021-07-01", because: "removed brew installation support"

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
