# == Schema Information
#
# Table name: landmarks
#
#  id             :integer          not null, primary key
#  name           :string
#  year_completed :integer
#  figure_id      :integer
#

class Landmark < ActiveRecord::Base
belongs_to :figure
end
