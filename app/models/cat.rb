# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = %w(white black orange grey)
  SEX = ["M","F"]
  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: {in: COLORS}
   validates :sex, inclusion: {in: SEX}

  def age
    return "" if birth_date == nil
    now = Date.today
    now.year - birth_date.year
  end


end
