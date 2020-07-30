class PxcCm < Formula
  desc "Portworx Cluster Manager Example Compoment"
  homepage "https://github.com/portworx/pxc/tree/master/component/examples/golang"
  url "https://github.com/portworx/pxc/archive/v0.30.0.tar.gz"
  sha256 "f722188bea6a780e854e564f06a94efe285252896a8b10b4ba9894c310e7c8c7"
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
