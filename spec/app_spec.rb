require './app.rb'  
require 'rspec'
require 'rack/test'
require 'capybara'
require 'capybara/dsl'
set :environment, :test

Capybara.app = Sinatra::Application

describe 'Shootout App' do  
  include Capybara::DSL
  
  it "welcomes player to shootour game" do
    visit '/'
    page.should have_content('Welcome to Shootout game!')    
  end

  it "should have link to new game" do
    visit '/'
    page.should have_link('Create new game')    
  end

  it "should redirect to new game after clicking new game link" do
    visit '/'
    click_link 'Create new game'
    page.should have_content('Now playing')    
  end  


  it "should be able to play it" do
    visit '/'
    click_link 'Create new game'
    page.should have_content('Now playing')    
    page.should have_link('Shoot')    
  end  
end