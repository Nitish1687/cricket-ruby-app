require File.expand_path(File.dirname(__FILE__) + '/../rails_helper')

RSpec.feature "Brand" do

  before do
    testPlayer = getTestPlayer
    visit player_path(testPlayer)

    click_link 'Create Brand'
  end

  scenario "create brand with valid value" do
    fill_in 'Name', with: 'Nike'
    fill_in 'Description', with: 'good'

    click_button 'submit'

    expect(page.find("span#name").text).to eq 'Nike'
    expect(page.find("span#description").text).to eq 'good'
  end


  private

  def getTestPlayer
    testPlayer = FactoryGirl.create(:player, name: "test", age: 22)
  end

end