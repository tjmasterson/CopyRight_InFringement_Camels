class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  accepts_nested_attributes_for :responses
end
