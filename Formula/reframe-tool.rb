class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://github.com/rosado/reframe.nim/archive/0.1.0.zip"
  sha256 "5db236c21210e3f2e48967ab1172272dd8c44ec54232fd88c0119f6511f86b5b"

  def install
    system "nimble", "build"
    system "echo", "DONE!!!"
    #system "cp", "reframe", "/Users/roland/bin/other-utils/"
  end

  test do
    assert_equals true, 10 < shell_output("reframe index -r='/Users/roland/dev/edn.nim/test-data/src-a'").length
  end
end
