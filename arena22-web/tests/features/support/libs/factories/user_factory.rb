require_relative '../../models/user_model'
require_relative '../../services/user_service'

FactoryBot.define do
    factory :user_with_optional, class: UserModel do
        name { 'Automated' }
        last_name { 'User Optional' } 
        nickname { 'Optional Tested' }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { '12/10/1995' } 
        phone_number { '69933333333' }
        email { 'testeemail.arena22@gmail.com' } 
        password { 'Aren@12345678%' } 
        coupon { 'SUCESSOCASH' }

        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :user_only_requireds, class: UserModel do
        name { 'Automated' }
        last_name { 'User Requireds' }
        nickname { 'Required Tested' }
        birth_date { '12/10/1995' } 
        phone_number { '69944444444' }
        email { 'testeemail.arena22@gmail.com' }
        password { 'Aren@12345678%' }
        
        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :user_oauth, class: UserModel do
        transient do
            external_account_data { nil }
        end

        name { 'Automated' }
        last_name { "User #{external_account_data[:type]}" }
        nickname { external_account_data[:nickname] }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { '12/10/1995' } 
        phone_number { '68922222222' }
        email { external_account_data[:email] } 
        password { external_account_data[:password] }
        coupon { '#17248' }

        after(:build) do |user|
            UserService.new.disable_user_by_email(user.email)
        end
    end

    factory :random_user, class: UserModel do
        name { Faker::Name.first_name }
        last_name { Faker::Name.last_name } 
        nickname { Faker::Games::Pokemon.name }
        cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) } 
        birth_date { Faker::Date.birthday(min_age: 18, max_age: 80).strftime('%d/%m/%Y') } 
        phone_number { Faker::PhoneNumber.cell_phone }
        email { Faker::Internet.email(name: "#{name}_#{SecureRandom.alphanumeric(8)}", domain: 'testexample') }
        password { 'Arena12345678' } 
        coupon { 'SUCESSOCASH' }
    end

    factory :test_user, class: UserModel do
        transient do
            user_data { nil }
        end

        name { user_data[:name] }
        last_name { user_data[:last_name] } 
        nickname { user_data[:nickname] }
        cpf { user_data[:cpf] } 
        birth_date { user_data[:birth_date] } 
        phone_number { user_data[:phone_number] }
        email { user_data[:email] } 
        password { user_data[:password] } 
        coupon { user_data[:coupon] }
    end

end