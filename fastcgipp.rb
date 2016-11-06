class Fastcgipp < Formula
  desc "FastCGI++"
  homepage "https://github.com/eddic/fastcgipp"
  url "https://github.com/eddic/fastcgipp/archive/2.x.zip"
  version "2.2beta-7f94dd4d"
  sha256 "3185b2dfdf3f1d7f1ca3779855f890b2bbf24dbc07d018553168e468cadeaded"

  depends_on 'automake'
  depends_on 'boost'
  depends_on 'doxygen'
  depends_on 'libtool'

  def install
    system "touch", "README", "NEWS", "ChangeLog"
    system "cp", "configure.ac.in", "configure.ac"
    system "sed", "-i", "", "s/_VERSION_/2.2beta-7f94dd4d/", "configure.ac"
    system "aclocal", "-I", "config"
    system "glibtoolize", "--force"
    system "autoheader"
    system "autoconf"
    system "automake", "-a"
    system "doxygen", "doc/doxygen"
    system "sed", "-i", "", "-e", "s/lock_guard/boost::lock_guard/",
                            "-e", "s/<mutex>/<boost::mutex>/",
                            "-e", "s/unique_lock/boost::unique_lock/",
                            "include/fastcgi++/manager.hpp"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-boost=#{Formula["boost"].prefix}",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
