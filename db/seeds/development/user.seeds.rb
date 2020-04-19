# frozen_string_literal: true

[
  {
    email: 'test@example.com',
    password: 'password'
  }
].each do |user|
  User.find_or_create_by(email: user[:email]).update(user)
end
