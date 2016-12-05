class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :movie_tags
  has_many :tags, through: :movie_tags
  
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(', ')
  end

  def to_s
    name
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
