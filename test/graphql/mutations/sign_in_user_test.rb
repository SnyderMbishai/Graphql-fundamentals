require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
    def perform(args = {})
        Mutations::SignInUser.new(object: nil, context: { session: {}}).resolve(args)
    end

    def create_user
        User.create!(
            name: 'Test User',
            email: 'test@test.com',
            password: '[omitted]'
        )
    end
    
    test 'successful signin' do
        user = create_user
        result = perform(
            email: {
                email: user.email,
                password: user.password
                    }
        )
        assert result[:token].present?
        assert_equal result[:user], user
    end

    test 'Unsuccessful sign in' do
        assert_nil perform
    end

    test 'failed due to wrong email' do
        create_user
        assert_nil perform(email: 'wrong')
    end

    test 'wrong password' do
        user = create_user
        assert_nil perform( email: {
            email: user.email,
            password: 'wrong'
        })
    end

end
