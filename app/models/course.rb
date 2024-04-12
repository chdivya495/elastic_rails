class Course < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: false, scope: :vertical_id }
  validate :name_unique_across_verticals
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "categories_#{Rails.env}"

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :name, type: 'text'
        indexes :state, type: 'keyword'
    end
  end

  def as_indexed_json(options = {})
    self.as_json(only: [:name, :state])
  end
  
  private

  def name_unique_across_verticals
    if Vertical.exists?(name: name)
      errors.add(:name, "has already been taken by a vertical")
    end
  end
end
