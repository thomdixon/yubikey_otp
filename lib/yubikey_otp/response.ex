defmodule YubikeyOTP.Response do
  @moduledoc false

  alias __MODULE__

  @enforce_keys [:otp, :status, :type]

  defstruct [
    :url,
    :otp,
    :nonce,
    :hmac,
    :message,
    :timestamp,
    :status,
    :sessioncounter,
    :sessionuse,
    :sl,
    halted: false
  ]

  ## Simple merge of options and defaults
  @spec new(options :: map() | keyword()) :: struct()
  def new(options \\ %{}) do
    struct(Response, options)
  end

  @spec validate(response :: struct()) :: {:ok, struct()} | {:error, atom()}
  def validate(response) do
    {:ok, response}
  end
end
