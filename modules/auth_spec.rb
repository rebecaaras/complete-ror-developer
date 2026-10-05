require 'rspec'
require_relative 'auth'

RSpec.describe Auth do
  let (:password){'password-test'}
  let (:users) do
    [{username: 'john', password: 'john-pwd'}]
  end

  describe '.create_hash_digest' do
    it 'should create a hashed version of the password' do
      digest = described_class.create_hash_digest(password)
      expect(BCrypt::Password.new(digest)).to eq(password)
    end
    
    it 'should create different hashes for the same password' do
      digest_one = described_class.create_hash_digest(password)
      digest_two = described_class.create_hash_digest(password)
      expect(digest_one == digest_two).to eq(false)
    end

  end

  describe '.verify_hash_digest' do
    it 'should verify hash digest' do
      digest = described_class.create_hash_digest(password)
      expect(described_class.verify_hash_digest(digest)).to eq(password)
    end
  end

  describe '.create_secure_user' do
    it 'should replace plain password with hashed password for an array of users' do
      hashed_password = described_class.create_secure_users(users).first[:password]
      expect(hashed_password).to be_a(BCrypt::Password)
    end
  end

  describe '.authenticate_user' do
    it 'should authenticate existing user' do
      secure_users = described_class.create_secure_users(users)
      user = secure_users.first
      expect(described_class.authenticate_user( 'john', 'john-pwd', secure_users)).to eq(user)
    end

    it 'should not authenticate incorrect user' do
      secure_users = described_class.create_secure_users(users)
      expect(described_class.authenticate_user( 'mary', 'mary-pwd', secure_users)).to eq("Incorrect credentials")
    end
  end
end
