require 'elasticsearch/model'
class Code < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  # index_name Rails.application.class.parent_name.underscore
  # document_type self.name.downcase

  serialize :includes
  serialize :inclusionTerm
  serialize :excludes1
  serialize :excludes2
  # belongs_to :parent, :class_name => "Code", :join_table => :relationships, foreign_key: :child_id
  # has_many :children, :class_name => "Code", table_name: "relationships", foreign_key: :parent_id
  # has_one :parent, :class_name => "Code", :join_table => :relationships, foreign_key: :child_id
  # belongs_to :parent, inverse_of: :children
  # belongs_to :parent, :class_name => "Code", :join_table => :relationships, foreign_key: :child_id
  #for top level parent create excliusion because it wont have a parent


  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       size: 1000,
  #       query: {
  #         multi_match: {
  #           query: query,
  #           fields: ['code_id^10', 'desc']
  #         }
  #       }
  #     }
  #   )
  # end

  def children
    Code.where(parent_id: self.code_id)
  end

  def parent
    Code.find_by(code_id: self.parent_id)
  end
end
