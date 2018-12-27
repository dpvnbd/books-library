# frozen_string_literal: true

class DateRangeFilter
  attr_reader :relation, :attribute, :from, :to

  def initialize(relation, attribute, filters)
    @relation = relation
    @attribute = attribute
    if attribute.present?
      @from = filters["#{attribute}_from"]
      @to = filters["#{attribute}_to"]
    end
  end

  def call
    result = relation
    result = result.where("#{attribute} >= ?", from) if from.present?
    result = result.where("#{attribute} <= ?", to) if to.present?
    result
  end
end