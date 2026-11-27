# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.7/vaquero_0.1.7_darwin_amd64.tar.gz"
      sha256 "c77c1469b76a48e67e55525cab7aeffc51dd6bb4567bc395e5587ae572ee5580"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.7/vaquero_0.1.7_darwin_arm64.tar.gz"
      sha256 "d179805bd393ccc4984bf845a35d536929b86af0a35a6d7e80a0bb5aca2840f1"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.7/vaquero_0.1.7_linux_amd64.tar.gz"
      sha256 "dcca8d390220a8bb0b8bb0e53ff71afb15bbbcef9a29894ee79d71da032a073f"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.7/vaquero_0.1.7_linux_arm64.tar.gz"
      sha256 "7c0aad18d9d76e81d31decd7446414ed287c44f2ae2a2a4a3d2e78c690132105"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  service do
    run [opt_bin/"vaquero", "serve"]
    keep_alive true
    log_path var/"log/vaquero.log"
    error_log_path var/"log/vaquero.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vaquero version")
  end
end
