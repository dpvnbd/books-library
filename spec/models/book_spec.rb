require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    %i[title author publisher].each do |field|
      include_examples 'text fields example', field
    end

    include_examples 'number fields example', :number_of_pages, positive: true, only_integer: true

    it { is_expected.to validate_presence_of(:published_on) }
  end
end
