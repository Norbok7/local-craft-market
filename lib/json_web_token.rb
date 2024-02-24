# app/lib/json_web_token.rb

require 'jwt'

module JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base

  # Encodes and signs JWT payload with expiration
  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, SECRET_KEY)
  end

  # Decodes the JWT with the signed secret
  def self.decode(token)
    JWT.decode(token, SECRET_KEY).first
  end

  # Default options to be encoded in the token
  def self.meta
    {
      exp: 24.hours.from_now.to_i # 24 hours expiration
    }
  end
end
