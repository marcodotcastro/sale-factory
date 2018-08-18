require 'rails_helper'
require 'csv'

RSpec.describe "Representative" do

  it "import representative csv" do

    CSV.foreach("sped/files/representantes.csv", header: :true) do |row|
      Representative.create(row)

    end

    # comment1 = post.comments.create!(:body => "first comment")
    # comment2 = post.comments.create!(:body => "second comment")
    # expect(post.reload.comments).to eq([comment2, comment1])
  end

end
