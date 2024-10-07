# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ok < Formula
  desc "A CLI called ok"
  homepage "https://github.com/oslokommune/ok"
  version "4.1.1"

  on_macos do
    on_intel do
      url "https://github.com/oslokommune/ok/releases/download/v4.1.1/ok_4.1.1_darwin_amd64.tar.gz"
      sha256 "eb2c9244561a57ce1db9b4c9cf9f8f0018e066e0a6ff5170a054b54c6f489a98"

      def install
        bin.install "ok"
        bash_completion.install "completions/ok.bash" => "ok"
        zsh_completion.install "completions/ok.zsh" => "_ok"
        fish_completion.install "completions/ok.fish"
      end
    end
    on_arm do
      url "https://github.com/oslokommune/ok/releases/download/v4.1.1/ok_4.1.1_darwin_arm64.tar.gz"
      sha256 "a107492d98040196d1adbf755321b70082b2640df35c1729e96b1642a927ec83"

      def install
        bin.install "ok"
        bash_completion.install "completions/ok.bash" => "ok"
        zsh_completion.install "completions/ok.zsh" => "_ok"
        fish_completion.install "completions/ok.fish"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/oslokommune/ok/releases/download/v4.1.1/ok_4.1.1_linux_amd64.tar.gz"
        sha256 "14be8c88ba3cc32a82a0d8e9a70b8bf7ef37a5d84cd52a0d1ba54b0080c7cc55"

        def install
          bin.install "ok"
          bash_completion.install "completions/ok.bash" => "ok"
          zsh_completion.install "completions/ok.zsh" => "_ok"
          fish_completion.install "completions/ok.fish"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/oslokommune/ok/releases/download/v4.1.1/ok_4.1.1_linux_arm64.tar.gz"
        sha256 "200fc6235a74601824621e831d7eb8506ef84f9cdb6523680d6b7b783de2329d"

        def install
          bin.install "ok"
          bash_completion.install "completions/ok.bash" => "ok"
          zsh_completion.install "completions/ok.zsh" => "_ok"
          fish_completion.install "completions/ok.fish"
        end
      end
    end
  end
end
