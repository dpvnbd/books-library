class TextFilter
  attr_reader :relation, :filters

  def initialize(relation, filters)
    @relation = relation
    @filters = filters&.delete_if do |k, v|
      v.empty? || k.to_s.end_with?('_on', '_at', '_id', '_from', '_to')
    end.to_h || {}
  end

  def call
    return relation if filters.blank?

    fields = filters.map do |k, v|
      param = ActiveRecord::Base.connection.quote("%#{v}%")
      "#{k} ILIKE #{param}"
    end

    query = fields.join(' AND ')
    relation.where(query)
  end
end