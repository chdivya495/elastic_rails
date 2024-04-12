class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :vertical
  has_many :courses

  validate :name_unique_across_verticals
  
  accepts_nested_attributes_for :courses

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

  def as_json(options = {})
    super(options.merge(include: :courses))
  end
  
  private

  def name_unique_across_verticals
    if Vertical.exists?(name: name)
      errors.add(:name, "A vertical with #{name} already exists")
    end
  end
end

