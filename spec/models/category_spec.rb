require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    include_examples 'text fields example', :name
  end
end
