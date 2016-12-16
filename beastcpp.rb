class Beastcpp < Formula
  url "https://github.com/vinniefalco/Beast/archive/master.zip"
  version "1.0.0-b20"
  sha256 "35a894b8dd5d888344fc894ad5aa34fd4ca2abdd3a33e9903fc3186e73844414"

  depends_on "cmake" => :build
  depends_on "openssl"

  # Add "make install" support
  patch do
    url "https://patch-diff.githubusercontent.com/raw/vinniefalco/Beast/pull/198.patch"
    sha256 "3eb4b4e4ba7b5e4ab6c7423549dbacc787ce64d34c598f845eddb13fec226d97"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
