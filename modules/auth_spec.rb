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
end
