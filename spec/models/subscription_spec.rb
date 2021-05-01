require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "user can follow another user" do

    jaqueline = FactoryBot.create(:user)
    thor = FactoryBot.create(:user)

    Subscription.create(followed: thor, followed_by: jaqueline)

    expect(thor.followers.count).to eql 1
    expect(thor.followers).to include jaqueline

    expect(jaqueline.following.count).to eql 1
    expect(jaqueline.following).to include thor

    expect(thor.following.count).to eql 0
    expect(thor.following).to_not include jaqueline

    expect(jaqueline.followers.count).to eql 0
    expect(jaqueline.followers).to_not include thor

    marcia = FactoryBot.create(:user)

    Subscription.create(followed: thor, followed_by: marcia)

    expect(thor.followers.count).to eql 2
    expect(thor.followers).to include marcia

    expect(marcia.following.count).to eql 1
    expect(marcia.following).to include thor

  end
end