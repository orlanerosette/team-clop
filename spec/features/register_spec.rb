feature "register" do
  scenario "it has a sign up and account message" do
    visit "/register"
    expect(page).to have_content "MAKERS BNB"
    expect(page).to have_content "Sign up for a free account!"
  end
end

feature "register" do
  scenario "it allows you to sign up" do
    visit "/register"
    fill_in 'first_name', with: 'Will'
    fill_in 'last_name', with: 'Smith'
    fill_in 'email', with: 'willsmith@slap.co.uk'
    fill_in 'password', with: 'password'
    click_on 'SUBMIT'
    expect(page).to have_content "List a space"
  end
end
