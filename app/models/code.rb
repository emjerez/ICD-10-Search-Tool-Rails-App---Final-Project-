class Code < ApplicationRecord
  has_many :children, class_name: "Code", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Code"

  #for top level parent create excliusion because it wont have a parent
end
