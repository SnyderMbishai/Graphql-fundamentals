require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
    def perform(args = {})
        Mutations::CreateUser.new(object:nil, context: {}).resolve(args)
    end

    test 'create new user' do
        user = perform(
            name: 'Test User',
            auth_provider: {
                email: {
                    email: 'test@test.com',
                    password: 'password123'
            }}
        
        )
        assert user.persisted?
        assert_equal user.name, 'Test User'
        assert_equal user.email, 'test@test.com'
    end
end
