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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'
require 'csv'

RSpec.describe "Representative" do

  it "import representative csv" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      Representative.create(row.to_hash)
    end


    expect(Representative.count).to eq(4)
  end

end
