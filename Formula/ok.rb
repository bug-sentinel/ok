# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Ok < Formula
  desc "A CLI called ok"
  homepage "https://github.com/oslokommune/ok"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oslokommune/ok/releases/download/v1.4.1/ok_1.4.1_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "01ddfca24eb3ad21e4cdc1293305df692b5731d6cc425dbcf38c0eca45eb4891"

      def install
        bin.install "ok"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oslokommune/ok/releases/download/v1.4.1/ok_1.4.1_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "a6e097f0752f7c174193f1882d39cddf901a761e88eb5abcfe4b44e42106fec1"

      def install
        bin.install "ok"
      end
    end
  end
end
