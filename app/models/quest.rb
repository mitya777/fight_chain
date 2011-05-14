class Quest < ActiveRecord::Base

  belongs_to :user

  has_one :inspiration
  has_one :question
  has_one :answer

  accepts_nested_attributes_for :inspiration
  accepts_nested_attributes_for :question
  accepts_nested_attributes_for :answer
end
