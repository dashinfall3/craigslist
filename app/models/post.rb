class Post < ActiveRecord::Base

attr_accessible :title, :category_id, :contact_name, :location, :price, :body, :email

belongs_to :category

end
