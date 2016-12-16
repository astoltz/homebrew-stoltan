class Docoptcpp < Formula
  url "https://github.com/docopt/docopt.cpp/archive/v0.6.2.zip"
  version "0.6.2"
  sha256 "217d2171c67b99e245701bbd9a97f5b87318812711e40beb3865c2e8e38c1f59"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
