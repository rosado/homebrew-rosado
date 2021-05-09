class ReframeTool < Formula
  desc "Tool for exploring ClojureScript re-frame codebases."
  homepage "https://github.com/rosado/reframe.nim"
  url "https://codeload.github.com/rosado/reframe.nim/zip/0.4.0"
  sha256 "e5fc45627ea9cd326fab1e465e3e780de7570acaa8f8da3c222bb91b340d4e24"

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
