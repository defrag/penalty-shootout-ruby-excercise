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

end