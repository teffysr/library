require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:identification) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should have_many(:books) }
end
