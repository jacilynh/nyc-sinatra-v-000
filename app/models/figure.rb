class Figure <ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :figure_titles
  has_many :landmarks

  def slug
    name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    Figure.all.find{|figure| figure.slug == slug}
  end

end
