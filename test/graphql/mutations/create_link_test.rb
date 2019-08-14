require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
    def perform(user: nil, **args)
        Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
    end

    test 'create a new link' do
        link = perform(
            url: 'http://example.com',
            description: 'New things up!'
        )
        assert link.persisted?
        assert_equal link.description, 'New things up!'
        assert_equal link.url, 'http://example.com'
    end
end
