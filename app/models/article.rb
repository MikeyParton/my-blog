class Article < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true

	has_many :comments, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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