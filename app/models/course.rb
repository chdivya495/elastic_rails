class Course < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :category

  validates :name, uniqueness: { scope: :category_id }
  

  index_name "categories_#{Rails.env}"

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :name, type: 'text'
    end
  end

  def as_indexed_json(options = {})
    self.as_json(only: [:name, :state])
  end
end
