# == Schema Information
#
# Table name: representatives
#
#  id          :integer          not null, primary key
#  description :string
#  contact     :string
#  address     :string
#  phone       :string
#  email       :string
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Representative < ApplicationRecord
end
