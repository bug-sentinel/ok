# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ok < Formula
  desc "A CLI called ok"
  homepage "https://github.com/oslokommune/ok"
  version "3.7.1"

  on_macos do
    on_intel do
      url "https://github.com/oslokommune/ok/releases/download/v3.7.1/ok_3.7.1_darwin_amd64.tar.gz"
      sha256 "4de2a36201a5e3d67f510805d2c15204b525bd2178107421593670d7e61eeab4"

      def install
        bin.install "ok"
        bash_completion.install "completions/ok.bash" => "ok"
        zsh_completion.install "completions/ok.zsh" => "_ok"
        fish_completion.install "completions/ok.fish"
      end
    end
    on_arm do
      url "https://github.com/oslokommune/ok/releases/download/v3.7.1/ok_3.7.1_darwin_arm64.tar.gz"
      sha256 "16f13c2f06eddc0473dcb7268345e426df7d009fd5b4b035bd09f1124e7c8b68"

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
        url "https://github.com/oslokommune/ok/releases/download/v3.7.1/ok_3.7.1_linux_amd64.tar.gz"
        sha256 "f98e87985aaa02d90ee32d4d668489407589163cc21565d6cce62453266b1a76"

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
        url "https://github.com/oslokommune/ok/releases/download/v3.7.1/ok_3.7.1_linux_arm64.tar.gz"
        sha256 "a0231f881395707fe0953cc8febdd1a13ff93431b0a555b53f3eb124b2db62d3"

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
