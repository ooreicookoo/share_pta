require 'test_helper'

class InviteMailerTest < ActionMailer::TestCase
  test "greeting" do
    mail = InviteMailer.greeting
    assert_equal "Greeting", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
