# YubikeyOTP

`YubikeyOTP` is an Elixir client for authenticating Yubikey one-time-passwords. It can verify OTPs using Yubico's public
API or by using your own or third-party OTP validation services.

This first release has not been used in production yet and doesn't have enough tests - please try it and get in touch if
something doesn't behave as expected.

[![Hex pm](http://img.shields.io/hexpm/v/yubikey_otp.svg?style=flat)](https://hex.pm/packages/yubikey_otp)
[![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](http://hexdocs.pm/yubikey_otp/)
[![Build Status](https://travis-ci.org/Digital-Identity-Labs/yubikey_otp.svg?branch=master
"Build Status")](https://travis-ci.org/Digital-Identity-Labs/yubikey_otp)
[![License](https://img.shields.io/hexpm/l/yubikey_otp.svg)](LICENSE)

## Installation

The package can be installed by adding `yubikey_otp` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:yubikey_otp, "~> 0.1.0"}
  ]
end
```

## Purpose

A Yubikey is a tiny USB device that connects to your computer as if it was USB keyboard. Pressing the
button on a Yubikey causes it to type a new unique password that can be checked against a remote server *once*. Yubikeys can
 be used for authentication with both command-line and web applications, but are most commonly used alongside traditional
  passwords to provide Two Factor Authentication on web sites - the key is "something you have".

Most Yubikeys since 2008 can generate OTPs, but modern Yubikeys also support the U2F and WebAuthn standards: these standard are more secure
and immune to phishing, and should be prefered for new services. The older OTP format is more widely deployed and still actively
used. This library only supports the older OTP format.

YubikeyOTP takes the OTP code generated by the Yubikey, sends it to a Yubkey Validation Service to be verified, and parses
the API result. It follows Yubico's recommendation to send queries to five different API endpoints simultaneously.

```elixir

    my_id = Application.get_env(:my_app, :yubikey_client_id)

    {:ok, service} = YubikeyOTP.service(api_id: my_id)

    YubikeyOTP.verify("ccccccclzlojikekndkhfibggvkgujttihkcuvkjfrvj", service)
    # => {:ok, :ok}

    YubikeyOTP.verify("ccccccclzlojikekndkhfibggvkgujttihkcuvkjfrvj", service)
    # => {:error, :replayed_otp}
```

## Requirements

* You'll need a Yubikey! They can be bought from [Yubico](https://www.yubico.com/store/) or other online stores such as
Amazon. The cheaper "Security Key" range does not generate OTPs, only WebAuthn, and won't work with this code.

* You need to [sign up for an API key](https://upgrade.yubico.com/getapikey/) (using your Yubikey)

## API Documentation

Full API documentation can be found at
 [https://hexdocs.pm/yubikey_otp](https://hexdocs.pm/yubikey_otp).

## Contributing

You can request new features by creating an [issue](https://github.com/Digital-Identity-Labs/yubikey_otp/issues),
or submit a [pull request](https://github.com/Digital-Identity-Labs/yubikey_otp/pulls) with your contribution.

## Copyright and License

Copyright (c) 2020 Digital Identity Ltd, UK

YubikeyOTP is MIT licensed.

## References

 * [Wikipedia - Yubikey](https://en.wikipedia.org/wiki/YubiKey)
 * [Yubico - Using A Client Library](https://developers.yubico.com/OTP/Libraries/Using_a_library.html)
 * [Yubico - Getting Started Writing Clients](https://developers.yubico.com/yubikey-val/Getting_Started_Writing_Clients.html)
 * [Yubico - Validation Protocol V2](https://developers.yubico.com/yubikey-val/Validation_Protocol_V2.0.html)
 * [Yubico - Yubicloud Connector Libraries](https://developers.yubico.com/OTP/Libraries/List_of_libraries.html)
 * [Yubico - Self Hosted OTP Validation](https://developers.yubico.com/OTP/Guides/Self-hosted_OTP_validation.html)



## Disclaimer
YubikeyOTP is not endorsed by Yubico.

