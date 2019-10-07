# frozen_string_literal: true

class Form
  attr_reader :username_field, :password_field, :submit_button, :success_message, :fail_message, :success_text, :fail_text, :login_form, :logout_button, :logout_text, :fail_password_text
  USERNAME_FIELD = 'username'
  PASSWORD_FIELD = 'password'
  SUBMIT_BUTTON = { class: 'radius' }.freeze
  SUCCESS_MESSAGE = { css: '.flash.success' }.freeze
  FAIL_MESSAGE = { css: '.flash.error' }.freeze
  SUCCESS_TEXT = 'You logged into a secure area!'
  FAIL_TEXT = 'Your username is invalid!'
  FAIL_PASSWORD_TEXT = ''
  LOGIN_FORM = { id: 'login' }.freeze
  LOGOUT_BUTTON = { class: 'button secondary radius' }.freeze
  LOGOUT_TEXT = 'You logged out of the secure area!'
  def initialize
    @username_field = USERNAME_FIELD
    @password_field = PASSWORD_FIELD
    @submit_button = SUBMIT_BUTTON
    @success_message = SUCCESS_MESSAGE
    @fail_message = FAIL_MESSAGE
    @success_text = SUCCESS_TEXT
    @fail_text = FAIL_TEXT
    @login_form = LOGIN_FORM
    @logout_button = LOGOUT_BUTTON
    @logout_text = LOGOUT_TEXT
    @fail_password_text = FAIL_PASSWORD_TEXT
  end
end
