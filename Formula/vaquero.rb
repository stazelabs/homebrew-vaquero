# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.8/vaquero_0.1.8_darwin_amd64.tar.gz"
      sha256 "e054c5061d87edcbee163b258952787692ad8c39812b1cf430680fe139bb8e22"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.8/vaquero_0.1.8_darwin_arm64.tar.gz"
      sha256 "384276120f838ed89e99f529127e518a27be9ef2c591d386f8d849d5bb4506a9"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.8/vaquero_0.1.8_linux_amd64.tar.gz"
      sha256 "5f86d960206302e6bd9b6e4fb2f9980a78441d5057ab228f5261403bc49d6cc6"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.8/vaquero_0.1.8_linux_arm64.tar.gz"
      sha256 "322dce1484d78b63e273dfb009453365c59b91263eefe96339a830f652f91e37"
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
