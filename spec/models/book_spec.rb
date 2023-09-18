require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:editorial) }
  it { should validate_presence_of(:available) }
  it { should have_many(:users) }
end
