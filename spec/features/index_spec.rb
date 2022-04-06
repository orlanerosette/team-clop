
feature 'homepage' do
  scenario 'it allows you to sign up' do
    visit '/'
    fill_in 'email', with: 'will.smith@slap.co.uk'
    fill_in 'password', with: 'ilovechrisrock2022'
    click_on 'SUBMIT'
    expect(page).to have_content "Book a space"
  end 
end
