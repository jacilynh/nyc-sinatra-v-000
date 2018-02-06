class Title <ActiveRecord::Base
  has_many :figures, through: :figure_titles
  has_many :figure_titles

end

* A Landmark `belongs_to` a figure and a figure `has_many` landmarks.
* A title `has_many` figure_titles and many figures through figure_titles.
* A figure `has_many` figure_titles and many titles through figure_titles.
* A figure_title `belongs_to` a figure and a title.

.	class User < ActiveRecord::Base
.	  has_many :user_items
.	  has_many :items, through: :user_items
.	end
.	 
.	class Item < ActiveRecord::Base
.	  has_many :user_items
.	  has_many :users, through: :user_items
.	end
.	 
.	class UserItem < ActiveRecord::Base
.	  belongs_to :user
.	  belongs_to :item
.	end
