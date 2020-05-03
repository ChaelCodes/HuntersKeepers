# frozen_string_literal: true

[
  {
    email: 'test@example.com',
    password: SecureRandom.base64(12)
  }
].each do |user|
  User.find_or_initialize_by(email: user[:email]).update!(user)
end
