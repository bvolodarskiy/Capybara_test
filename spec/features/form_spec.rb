# frozen_string_literal: true

require 'rails_helper'
require 'rspec-parameterized'
require 'form_helper'
require 'rspec/parameterized/table'
RSpec.feature 'Forms', type: :feature do
  before :each do
    visit 'login'
    login_page?
  end
  describe 'Login' do

    it 'success' do
          login('tomsmith','SuperSecretPassword!')
          check_success_message
        end


    it 'right name wrong pass' do
      visit 'login'
      login('tomsmith', 'test')
      check_password_fail_message
    end

    table = get_data_from_file
    where(:name, :pass) do
      table
    end

    with_them do
      it 'fail' do
        visit 'login'
        login(name, pass)
        check_fail_message
      end
    end
  end

  describe 'Logout' do
    before :each do
      login('tomsmith','SuperSecretPassword!')
    end
    it 'logout' do
      logout
      check_logout_message
    end

  end
end
