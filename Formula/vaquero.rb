# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.10/vaquero_0.1.10_darwin_amd64.tar.gz"
      sha256 "46d88c89d8cd999c97976a5c489ad6faba26ba3c582dc0fd3b35b5ab6b46e107"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.10/vaquero_0.1.10_darwin_arm64.tar.gz"
      sha256 "a99f8d963fe63e3a52bc10ebecb58ddab8e645668edba6949af5b4f869a6f024"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.10/vaquero_0.1.10_linux_amd64.tar.gz"
      sha256 "15931f1e66aab7f930b7fc91e4aa7bccd10aedf638fbe123845a61da7633bc32"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.10/vaquero_0.1.10_linux_arm64.tar.gz"
      sha256 "2dd944237758b4b1ce809cef7bc8b74c803fd0d3abcd1842be1cf3d5497f0482"
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
