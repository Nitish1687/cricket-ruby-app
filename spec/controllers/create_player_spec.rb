require File.expand_path(File.dirname(__FILE__) + '/../rails_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../app/helpers/players_helper')

RSpec.feature 'Player' do

  scenario 'create  with invalid attribute' do

    testPlayer = getMockPlayer
    visit '/'
    click_link 'New Player'
    fill_in 'Name', with: ''
    fill_in 'Age', with: 8
    fill_in 'Description', with: testPlayer.description

    click_button 'Create Player'

    expect(page.first("div#error_explanation h2").text).to match '3 errors prohibited this project from being saved:'
    expect(page.first("div#error_explanation//ol//li").text).to match "Name can't be blank"
    expect(page.find("div#error_explanation//ol").should have_css('li', :count => 3))
  end

  scenario 'create with valid attribute' do
    testPlayer = getMockPlayer

    visit '/'
    click_link 'New Player'
    fill_in 'Name', with: testPlayer.name
    fill_in 'Age', with: testPlayer.age
    fill_in 'Description', with: testPlayer.description

    click_button 'Create Player'

    expect(page.find("div#player//span#name").text).to eq testPlayer.name
    expect(page.find("div#player//span#age").text).to eq testPlayer.age.to_s
  end

  scenario 'players details' do
    testPlayer = getMockPlayer

    visit '/'

    click_link testPlayer.name

    expect(page.current_url).to eq player_url(testPlayer)
  end

  scenario 'edit player' do
    testPlayer = getMockPlayer

    visit '/'

    click_link testPlayer.name
    click_link 'Edit Player'
    fill_in 'Name', with: testPlayer.name
    fill_in 'Age', with: testPlayer.age
    fill_in 'Description', with: testPlayer.description
    click_button 'Update Player'
    expect(page).to have_content 'Players  Detail'
  end

  scenario 'delete player' do
    testPlayer = getMockPlayer

    visit '/'

    click_link testPlayer.name
    click_link 'Delete Player'

    expect(page).to have_content 'Players Details'
  end

  private

  def getMockPlayer
    testPlayer = FactoryGirl.create(:player, name: 'test', age: 21, description: '*test* data with great *power*')
  end

end