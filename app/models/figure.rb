# == Schema Information
#
# Table name: figures
#
#  id   :integer          not null, primary key
#  name :string
#

class Figure < ActiveRecord::Base
  has_many :figure_titles
  has_many :landmarks
  has_many :titles, through: :figure_titles

end
