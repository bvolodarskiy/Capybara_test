# frozen_string_literal: true

require 'csv'
require 'rspec/parameterized/table'
require 'form_page'

def initialize
  @form = Form.new
end

# @return [Object]
def data_from_file
  path = File.expand_path('test_data/negative_cases.csv', File.dirname(__FILE__))
  table_csv = CSV.parse(File.read(path), headers: true)
  table = RSpec::Parameterized::Table.new
  table_csv.count.times do |i|
    table.add_row([table_csv[i]['name'], table_csv[i]['pass']])
  end
  table
end

def login(username, password)
  fill_in @form.username_field, with: username
  fill_in @form.password_field, with: password
  click(@form.submit_button)
end

# def check_excepted_content(content,text)
#
#   expect(page).to have_selector(content.keys[0], content.values[0], text: text)
#
# end

def check_excepted_content(*args)
  if args.length == 1
    expect(page).to have_selector(args[0].keys[0], args[0].values[0])
  else
    expect(page).to have_selector(args[0].keys[0], args[0].values[0], text: args[1])
  end
end

def check_success_message
  check_excepted_content(@form.success_message, @form.success_text)
end

def check_fail_message
  check_excepted_content(@form.fail_message, @form.fail_text)
end

def check_password_fail_message
  check_excepted_content(@form.fail_message, @form.fail_password_text)
end

def login_page?
  check_excepted_content(@form.login_form)
end

def click(button)
  click_on(button)
end

def check_logout_message
  check_excepted_content(@form.success_message, @form.logout_text)
end

def logout
  click(@form.logout_button)
end
