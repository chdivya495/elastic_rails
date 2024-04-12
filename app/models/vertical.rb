class Vertical < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	has_many :categories
	validates :name, uniqueness: true
	validate :name_unique_across_categories

  accepts_nested_attributes_for :categories

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

  def as_json(options = {})
    super(options.merge(include: :categories))
  end

	private

	def name_unique_across_categories
		if Category.exists?(name: name)
      errors.add(:name, "A Category with the #{name} already exists")
		end
	end
end
