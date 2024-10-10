require 'rails_helper'

RSpec.describe 'Faker functionality' do
  it 'generates a random name and email' do
    fake_name = Faker::Name.name
    fake_email = Faker::Internet.email

    expect(fake_name).to be_a(String)
    expect(fake_email).to match(/\A[^@\s]+@[^@\s]+\z/)
  end
end