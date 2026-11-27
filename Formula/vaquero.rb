# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.9/vaquero_0.1.9_darwin_amd64.tar.gz"
      sha256 "526e5210b6c16c2454858ef8dae2f10bf875e4f00aaef15af30e7b6c5798b036"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.9/vaquero_0.1.9_darwin_arm64.tar.gz"
      sha256 "77059a5cfdcea216b56cc18e3007e03e9d339b528913a7899f4fd97678fc83af"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.9/vaquero_0.1.9_linux_amd64.tar.gz"
      sha256 "7941d527c2b4bfec014afff0a79b2117280adb9dd98294c57a006f8f693cd664"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.9/vaquero_0.1.9_linux_arm64.tar.gz"
      sha256 "312df4e2025f0b482b4f19db8b443f62d2e17e56f60b2bbf42ca9d7ff8d669cb"
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
