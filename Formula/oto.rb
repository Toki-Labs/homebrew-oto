# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Oto < Formula
  desc "oto Automation tool"
  homepage "https://toki-labs.com/oto"
  version "0.0.262"
  license ""

  if OS.mac?
    if Hardware::CPU.arm? # Apple Silicon (arm64) 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/osx/oto_0.0.262.tar.gz_OSX_ARM"
      sha256 "48d1f57ef95e234686b4ff747b27e26f7bd290b6181c30329db83c6d4fc31e29_OSX_ARM"
    elsif Hardware::CPU.intel? # Intel (x86_64) 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/osx/oto_0.0.262.tar.gz_OSX_X86_64"
      sha256 "48d1f57ef95e234686b4ff747b27e26f7bd290b6181c30329db83c6d4fc31e29_OSX_X86_64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? # ARM 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/linux/oto_0.0.262.tar.gz_LINUX_ARM"
      sha256 "48d1f57ef95e234686b4ff747b27e26f7bd290b6181c30329db83c6d4fc31e29_LINUX_ARM"
    elsif Hardware::CPU.intel? # Intel/AMD 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/linux/oto_0.0.262.tar.gz_LINUX_X86_64"
      sha256 "48d1f57ef95e234686b4ff747b27e26f7bd290b6181c30329db83c6d4fc31e29_LINUX_X86_64"
    end
  end

  # depends_on "cmake" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    if OS.mac?
      bin.install "oto"
    elsif OS.linux?
      bin.install "oto"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test oto_cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    if OS.mac?
      system "#{bin}/oto", "template", "-h"
    elsif OS.linux?
      system "#{bin}/oto", "template", "-h"
    end
  end
end