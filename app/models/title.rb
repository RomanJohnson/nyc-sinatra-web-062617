# == Schema Information
#
# Table name: titles
#
#  id   :integer          not null, primary key
#  name :string
#

class Title < ActiveRecord::Base
  has_many :figures, through: :figure_titles
  has_many :landmarks, through: :figure_titles #also worked via through: :figures, why?
  has_many :figure_titles
end
