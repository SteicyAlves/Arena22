require_relative '../../models/user_model'
require_relative '../../services/user_service'

FactoryBot.define do
    factory :user_with_optional, class: UserModel do
        email { 'testeemail.arena22@gmail.com' } 
        password { 'Aren@12345678%' } 
        nickname { 'Optional Tested' }
        name { 'Automated User Optional' }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { '12/10/1995' } 
        phone_number { '69933333333' }
        coupon { 'SUCESSOCASH' }

        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :user_only_requireds, class: UserModel do
        email { 'testeemail.arena22@gmail.com' }
        password { 'Aren@12345678%' }
        nickname { 'Required Tested' }
        name { 'Automated User Requireds' }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { '02/08/1992' } 
        phone_number { '69944444444' }
        
        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :user_oauth, class: UserModel do
        transient do
            external_account_data { nil }
        end

        email { external_account_data[:email] } 
        password { external_account_data[:password] }
        nickname { external_account_data[:nickname] }
        name { "Automated User #{external_account_data[:type]}" }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { '12/10/1995' } 
        phone_number { '68922222222' }
        coupon { '#17248' }

        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :random_user, class: UserModel do
        email { Faker::Internet.email(name: "#{name}_#{SecureRandom.alphanumeric(8)}", domain: 'testexample') }
        password { 'Arena12345678' } 
        nickname { Faker::Games::Pokemon.name }
        name { Faker::Name.name }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { Faker::Date.birthday(min_age: 18, max_age: 80).strftime('%d/%m/%Y') } 
        phone_number { Faker::PhoneNumber.cell_phone }
        coupon { 'SUCESSOCASH' }
    end

    factory :test_user, class: UserModel do
        transient do
            user_data { nil }
        end

        email { user_data[:email] } 
        password { user_data[:password] }
        nickname { user_data[:nickname] }
        name { user_data[:name] }       
        cpf { user_data[:cpf] } 
        birth_date { user_data[:birth_date] } 
        phone_number { user_data[:phone_number] }
        coupon { user_data[:coupon] }
    end

end