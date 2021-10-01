require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'create a new user' do
    link = perform(
      name: 'Test User',
      auth_provider: {
        credentials: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert link.persisted?
    assert_equal link.name, 'Test User'
    assert_equal link.email, 'email@example.com'
  end
end
