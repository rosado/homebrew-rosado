class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://codeload.github.com/rosado/reframe.nim/zip/0.3.0"
  sha256 "b62d870edfab2ff95b9d7c1975e0d380a3894c2d9271d077b61a081cf19ced84"

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
