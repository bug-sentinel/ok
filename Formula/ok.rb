# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ok < Formula
  desc "A CLI called ok"
  homepage "https://github.com/oslokommune/ok"
  version "1.29.0"

  on_macos do
    on_intel do
      url "https://github.com/oslokommune/ok/releases/download/v1.29.0/ok_1.29.0_darwin_amd64.tar.gz"
      sha256 "e5f352d08486c2d6ec6cbf1e234593968bd148120e6e12081315f8ee6f60958e"

      def install
        bin.install "ok"
      end
    end
    on_arm do
      url "https://github.com/oslokommune/ok/releases/download/v1.29.0/ok_1.29.0_darwin_arm64.tar.gz"
      sha256 "d0b95073e16a3564672d85a46799ddccc7059d91ed128cf8169933b3f0bded58"

      def install
        bin.install "ok"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/oslokommune/ok/releases/download/v1.29.0/ok_1.29.0_linux_amd64.tar.gz"
        sha256 "72186b207d734afcc9ce02f8b97470c89fd55cf72a01dae18affe86e78df6020"

        def install
          bin.install "ok"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/oslokommune/ok/releases/download/v1.29.0/ok_1.29.0_linux_arm64.tar.gz"
        sha256 "f6f227305791ffb30b3287ed85dd1286f489c68effb0291b1cabde0bab2169d7"

        def install
          bin.install "ok"
        end
      end
    end
  end
end
