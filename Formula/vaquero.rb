# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.3/vaquero_0.1.3_darwin_amd64.tar.gz"
      sha256 "536268f49bc6e139a0697729b40e271d2d75cc569080c0abaf3e44c364f949a8"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.3/vaquero_0.1.3_darwin_arm64.tar.gz"
      sha256 "7930be3ed8a32461ba2ea83ff82790206f95029947295e10c3c25cde317d9f3f"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.3/vaquero_0.1.3_linux_amd64.tar.gz"
      sha256 "7d52d71421d2fd08505f9a308ccfb216f913a795cc4d88b0b6aef8994d228c9f"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.3/vaquero_0.1.3_linux_arm64.tar.gz"
      sha256 "c45e4c95118f487f01edd5ea8da41c0a723298f5c4fe8398285a453a5d423760"
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
