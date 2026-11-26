# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.6/vaquero_0.1.6_darwin_amd64.tar.gz"
      sha256 "200745a93178f20a154a08e8902e32e1dfbf3f3a1042c69aa6bd12670dc6347e"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.6/vaquero_0.1.6_darwin_arm64.tar.gz"
      sha256 "418996459e9e6ee2c847eac6e6c0b5b28c9a534b9da67a2f7b645e8a049a493b"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.6/vaquero_0.1.6_linux_amd64.tar.gz"
      sha256 "af66376475b08761824f4ccc9484ae6b0131739e15b27460597c00b7c721bac3"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.6/vaquero_0.1.6_linux_arm64.tar.gz"
      sha256 "f7673cc51f7189e09a77fb9a1b7f5fce94b7dd95a90c31a72181e129a74a3f00"
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
