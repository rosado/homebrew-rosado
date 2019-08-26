class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://github.com/rosado/reframe.nim/archive/0.1.0.zip"
  sha256 "5db236c21210e3f2e48967ab1172272dd8c44ec54232fd88c0119f6511f86b5b"

  depends_on "nim" => [:build, :test]
  
  def install
    system "nimble", "build", "-y"
    system "mv", buildpath/"reframe", buildpath/"reframe-tool"
    target = prefix/"reframe-tool/bin"
    target.install buildpath/"reframe-tool"
    bin.install_symlink target/"reframe-tool"
  end

  test do
    assert_equals true, 10 < shell_output("reframe index -r='/Users/roland/dev/edn.nim/test-data/src-a'").length
  end
end
