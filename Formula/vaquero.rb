# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.4/vaquero_0.1.4_darwin_amd64.tar.gz"
      sha256 "cdf7c6e5496323c482b380b955c1c5e84bfc38e8a032f9031bc563166070cec7"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.4/vaquero_0.1.4_darwin_arm64.tar.gz"
      sha256 "58549d377ef89ee6f67191c91ecf8449d519ea80eb5c67b1eb2305f06caccad1"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.4/vaquero_0.1.4_linux_amd64.tar.gz"
      sha256 "cc1c3d912ae0aad1badb00cae30101c2da58a72a461b72ec72eaf892acc578aa"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.4/vaquero_0.1.4_linux_arm64.tar.gz"
      sha256 "cf01cd28f4921571377fb856dfe12d2526ffc119f48b3f838f7e3ce6a83ec71e"
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
