feature 'register' do
  scenario 'it has a sign up and account message' do
    visit '/register'
    expect(page).to have_content "Already have an account?"
    expect(page).to have_content "Want to sign up?"
  end 
end

feature 'register' do
  scenario 'it allows you to sign up' do
    visit '/register'
    click_on 'SIGN UP'
    expect(page).to have_content "Sign up"
  end 
end

feature 'register' do
  scenario 'it allows you to log in' do
    visit '/register'
    click_on 'SIGN IN'
    expect(page).to have_content "Sign in"
  end 
end