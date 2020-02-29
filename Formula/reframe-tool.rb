class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://codeload.github.com/rosado/reframe.nim/zip/0.2.0"
  sha256 "35a2083249a2753229fd9c901515a9011c1f539161f0a954eafbe308a0892fed"

  depends_on "nim" => [:build, :test]
  
  def install
    system "nimble", "build", "-d:release", "-y"
    system "mv", buildpath/"reframe", buildpath/"reframe-tool"
    system "mv", builpath/"clojure_keyword_index", buildpath/"clojure-keyword-index"
    target = prefix/"reframe-tool/bin"
    # reframe tool
    target.install buildpath/"reframe-tool"
    bin.install_symlink target/"reframe-tool"
    # clojure keyword index
    target.install buildpath/"clojure-keyword-index"
    bin.install_symlink target/"clojure-keyword-index"
  end
end
