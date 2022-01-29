class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://codeload.github.com/rosado/reframe.nim/zip/0.4.1"
  sha256 "d82a7e62b3c84a76e7d2807cfb6114cfce5c6cde02804d8645fb8e7de292e654"

  depends_on "nim" => [:build, :test]
  
  def install
    system "nimble", "build", "-d:release", "-y"
    system "mv", buildpath/"reframe", buildpath/"reframe-tool"
    system "mv", buildpath/"clojure_keyword_index", buildpath/"clojure-keyword-index"
    target = prefix/"reframe-tool/bin"
    # reframe tool
    target.install buildpath/"reframe-tool"
    bin.install_symlink target/"reframe-tool"
    # clojure keyword index
    target.install buildpath/"clojure-keyword-index"
    bin.install_symlink target/"clojure-keyword-index"
  end
end
