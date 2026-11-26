# typed: false
# frozen_string_literal: true

# Generated from packaging/homebrew/vaquero.rb.tmpl in stazelabs/vaquero by
# scripts/formula, run by the release workflow. DO NOT EDIT.
class Vaquero < Formula
  desc "Local-first ticket tracker with coordination for agents"
  homepage "https://github.com/stazelabs/vaquero"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.5/vaquero_0.1.5_darwin_amd64.tar.gz"
      sha256 "da5342c3221420783d13dc7be98a1697ae8b4d51d5158369bae013fa98829a72"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.5/vaquero_0.1.5_darwin_arm64.tar.gz"
      sha256 "a97868eca8c33d17ac3529de31722d420fb419b2d40b6a1e84d52e46f553b8d9"

      define_method(:install) do
        bin.install "vaquero"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.5/vaquero_0.1.5_linux_amd64.tar.gz"
      sha256 "8795437216cf8982fa662470acec05140aa0b6452f8561c9386cd5ca61715308"
      define_method(:install) do
        bin.install "vaquero"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stazelabs/vaquero/releases/download/v0.1.5/vaquero_0.1.5_linux_arm64.tar.gz"
      sha256 "56a46b94a360c4db2f4c86c027ac218ace30bb6eca26cbb2ebb1c7a38373dda8"
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
