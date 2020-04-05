defmodule YubikeyOtp.Otp do

  alias __MODULE__

  def device_id(otp) do
    otp
    |> String.replace_trailing(String.slice(otp, -32..64), "")
  end

  def validate(otp) do
    otp = otp
          |> String.trim()
          |> String.downcase()

    if String.valid?(otp) and String.length(otp) >= 32 and String.length(otp) <= 48 do
      {:ok, otp}
    else
      {:error, "Invalid OTP string #{otp}"}
    end

  end

end