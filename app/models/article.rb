class Article < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true

	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
	  self.tags.collect do |tag|
	    tag.name
	  end.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.downcase.split(",").map(&:strip).uniq

		tags_to_assign = tag_names.collect do |tag_name|
			Tag.find_or_create_by(name: tag_name)
		end
		self.tags = tags_to_assign
	end

end