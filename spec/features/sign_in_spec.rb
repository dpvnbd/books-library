require 'rails_helper'

describe "the sign in process" do
  let!(:admin) {create :admin}

  before do
    visit '/'
  end

  context "when correct email and password" do
    it "signs me in" do
      within("#new_admin") do
        fill_in 'Email', with: admin.email
        fill_in 'Password', with: admin.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context "when incorrect password" do
    it "shows error" do
      within("#new_admin") do
        fill_in 'Email', with: admin.email
        fill_in 'Password', with: admin.password + '235'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end

describe "the sign out process" do
  let!(:admin) {create :admin}

  before do
    login_as(admin)
    visit '/'
  end

  it "signs me out" do
    click_link 'Sign out'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end