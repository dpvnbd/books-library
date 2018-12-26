require 'rails_helper'

shared_examples 'text fields example' do |name, required: true, min_length: 3, max_length: 50|
  it { is_expected.to validate_presence_of(name) } if required

  it { is_expected.to validate_length_of(name).is_at_least(min_length).is_at_most(max_length) }
end

shared_examples 'number fields example' do |name, required: true, positive: false, only_integer: false|
  it { is_expected.to validate_presence_of(name) } if required

  it { is_expected.to validate_numericality_of(name) }

  it { is_expected.to validate_numericality_of(name).is_greater_than_or_equal_to(0) } if positive

  it { is_expected.to validate_numericality_of(name).only_integer } if only_integer
end
