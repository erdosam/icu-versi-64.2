bplist00�_WebMainResource�	
_WebResourceMIMEType_WebResourceTextEncodingName^WebResourceURL_WebResourceFrameName_WebResourceDataZtext/plainUUTF-8_rhttps://raw.githubusercontent.com/Homebrew/homebrew-core/a806a621ed3722fb580a58000fb274a2f2d86a6d/Formula/icu4c.rbPO<html><head></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">class Icu4c &lt; Formula
  desc "C/C++ and Java libraries for Unicode and globalization"
  homepage "http://site.icu-project.org/home"
  url "https://github.com/unicode-org/icu/releases/download/release-64-2/icu4c-64_2-src.tgz"
  version "64.2"
  sha256 "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"

  bottle do
    cellar :any
    sha256 "e9ae7bb5a76b48e82f56bc744eaaa1e9bdb5ca49ea6b5a2e4d52f57ad331f063" =&gt; :catalina
    sha256 "e858556120acc0c2d52b8fb572b677856724cc28d24a7e1b2762d458a2977c8e" =&gt; :mojave
    sha256 "02afdd6a472c31351e46a3b2a38c1c77354f0cc9199c3dbd7e06bc171b3638a2" =&gt; :high_sierra
    sha256 "4270a558e2709b7cee1be047a8e890ee15bdb379825fd6dc81fdba74cd438c01" =&gt; :sierra
  end

  keg_only :provided_by_macos, "macOS provides libicucore.dylib (but nothing else)"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-samples
      --disable-tests
      --enable-static
      --with-library-bits=64
    ]

    cd "source" do
      system "./configure", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/gendict", "--uchars", "/usr/share/dict/words", "dict"
  end
end
</pre></body></html>    ( > \ k � � � �                           *