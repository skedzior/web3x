defmodule Web3x.WalletTest do
  use ExUnit.Case

  describe ".verify_message?/4" do
    alias Web3x.Wallet

    @message "Some Message to sign for login - nonce: EwmvD7zFmRNb8hoCGc53kA=="
    @invalid_message "Some invalid message to sign for login - nonce: EwmvD7zFmRNb8hoCGc53kA=="
    @nonce "EwmvD7zFmRNb8hoCGc53kA=="
    @invalid_nonce "EhmvD7zFmRNb8hoCGc53kC=="
    @public_address "0xd6373ff972C311aa4B79dEb1ec2738f9d138acE9"
    @invalid_public_address "0xd6373ff972C311aa4B79dEb1ec2738f9d138acc8"
    @signature "0xfbd0c4267b5dad03a8a701678e628b2d2eb860c95341629dd20d570f1f999b6939a09ea5d98c5aa720edcf5ed55b55dccd6bb48d6929247d9adf643251763add1c"
    @invalid_signature "0xfbd0c4267b5dad03a8a701678e628b2d2eb860c95341629dd20d570f1f999b6939a09ea5d98c5aa720edcf5ed55b55dccd6bb48d6929247d9adf643251763a1d14"
    @bad_signature "0xfbd0c4267b5dad03a8a701678e628b2d2eb860c95341629dd20d570f1f999b6939a09ea5d98c5aa720edcf5ed55b55dccd6bb48d6929247d9adf643251763a1dz"

    test "returns true when public address is recovered" do
      assert Wallet.verify_message?(@public_address, @message, @signature, @nonce)
    end

    test "returns false when signature is invalid" do
      assert not Wallet.verify_message?(@public_address, @message, @invalid_signature, @nonce)
    end

    test "returns false when nonce is invalid" do
      assert not Wallet.verify_message?(@public_address, @message, @signature, @invalid_nonce)
    end

    test "returns false when address is invalid" do
      assert not Wallet.verify_message?(@invalid_public_address, @message, @signature, @nonce)
    end

    test "returns false when address and signature are invalid" do
      assert not Wallet.verify_message?(
               @invalid_public_address,
               @message,
               @invalid_signature,
               @nonce
             )
    end

    test "returns false when address and nonce are invalid" do
      assert not Wallet.verify_message?(
               @invalid_public_address,
               @message,
               @signature,
               @invalid_nonce
             )
    end

    test "returns false when address, signature, and nonce are invalid" do
      assert not Wallet.verify_message?(
               @invalid_public_address,
               @message,
               @invalid_signature,
               @invalid_nonce
             )
    end

    test "returns false when message is invalid" do
      assert not Wallet.verify_message?(@public_address, @invalid_message, @signature, @nonce)
    end

    test "returns false when signature is bad" do
      assert not Wallet.verify_message?(@public_address, @message, @bad_signature, @nonce)
    end
  end
end
