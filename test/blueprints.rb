# encoding: utf-8

require 'machinist/active_record'

User.blueprint do
  nickname { "Guardian Ebrio #{sn}" }
  email { "email#{sn}@homestock.com"}
  password { 'secret1234' }
  password_confirmation { object.password }
end
