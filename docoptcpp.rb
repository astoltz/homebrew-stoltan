class Docoptcpp < Formula
  desc ""
  homepage ""
  url "https://github.com/docopt/docopt.cpp/archive/master.zip"
  version "af03fa044ee1eff20819549b534ea86829a24a54"
  sha256 "2eddd87b89c6ca4c727866a65e9117b7658224093d0f4d690a030abcb84426c1"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test docoptcpp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
