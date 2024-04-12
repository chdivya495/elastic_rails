class Vertical < ApplicationRecord
  has_many :categories
	  include Elasticsearch::Model
	  include Elasticsearch::Model::Callbacks

	  validates :name, uniqueness: { case_sensitive: false }
	  validate :name_unique_across_categories
  
  	index_name "verticals_#{Rails.env}"

  		settings index: { number_of_shards: 1 } do
    		mappings dynamic: 'false' do
		      indexes :name, type: 'text'
		      indexes :created_at, type: 'date'
		      indexes :updated_at, type: 'date'
    		end
  		end

			  def as_indexed_json(options = {})
			    self.as_json(only: [:name, :created_at, :updated_at])
			  end  

  private

  def name_unique_across_categories
    if Category.exists?(name: name)
      errors.add(:name, "has already been taken by a category")
    end
  end
end
