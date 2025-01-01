# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Oto < Formula
  desc "oto Automation tool"
  homepage "https://toki-labs.com/oto"
  version "0.0.274"
  license ""

  if OS.mac?
    if Hardware::CPU.arm? # Apple Silicon (arm64) 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/osx/oto_arm_0.0.274.tar.gz"
      sha256 "f4b9ec79a51509a15206fa687ba6c6011e150d16951f99258db4c68f013cc850"
    elsif Hardware::CPU.intel? # Intel (x86_64) 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/osx/oto_0.0.232.tar.gz"
      sha256 "89c24f593ef1e36dcb48bfc5afc33a2aadce119274443da14515008495b9fbb4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? # ARM 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/linux/oto_0.0.232.tar.gz"
      sha256 "89c24f593ef1e36dcb48bfc5afc33a2aadce119274443da14515008495b9fbb4"
    elsif Hardware::CPU.intel? # Intel/AMD 아키텍처인 경우
      url "https://toki-labs.com/cdn/oto/linux/oto_x64_0.0.273.tar.gz"
      sha256 "6ef317e4db757f3d88a1bf02db8aff7fbae061ca4e89d360550fdf02c0db0b2d"
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