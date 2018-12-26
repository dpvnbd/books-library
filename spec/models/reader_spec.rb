require 'rails_helper'

RSpec.describe Reader, type: :model do
  describe 'validations' do
    %i[first_name second_name patronymic home_address work_address phone passport].each do |field|
      include_examples 'text fields example', field
    end

    it { is_expected.to validate_presence_of(:born_on) }
  end
end
