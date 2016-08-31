require File.expand_path(File.dirname(__FILE__) + '/../rails_helper')

RSpec.feature "Brand" do

  before do
    testPlayer = getTestPlayer
    visit player_path(testPlayer)

  end

  scenario "create brand with valid value" do
    click_link 'Create Brand'

    fill_in 'Name', with: 'Nike'
    fill_in 'Description', with: 'good'

    click_button 'submit'

    expect(page.find("span#name").text).to eq 'Nike'
    expect(page.find("span#description").text).to eq 'good'
  end

  scenario 'show all brands associate with individual player' do
    player = getTestPlayer
    brands = player.brands

    click_link 'Show Brand'

    expect(page.find('div#brands//span#name').text).to match brands.name
    # expect(page.find('div#brands//span#description').text).to match brands.description

  end

  scenario 'edit brand details' do
    player = getTestPlayer
    click_link 'Show Brand'

    click_link 'Edit Brand'

    expect(page.find('h1')).to have_content 'Update Brand'

  end

  scenario 'update brand details' do
    test_player = getTestPlayer
    click_link 'Show Brand'
    click_link 'Edit Brand'

    fill_in 'Name', with: test_player.brands[0].name
    fill_in 'Description', with: test_player.brands[0].description

    click_button 'submit'

    expect(page.find('div#brands//span#name').text).to match test_player.brands[0].name
    expect(page.find('div#brands//span#description').text).to match test_player.brands[0].description
    expect(page.find('div#brands//span#description').text).to match test_player.brands[0].description
  end

  private

  def getTestPlayer
    testPlayer = FactoryGirl.create(:player, name: "testPlayer", age: 22, description: 'testDescription')
  end

=begin
  def getTestBrand
    testBrand = FactoryGirl.create(:brand, name: 'test brand', description: 'test description')
  end
=end

end