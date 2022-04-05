
feature 'Book space page' do
  scenario 'it allows you to look at listings' do
    visit '/book-space'
    expect(page).to have_content "Beach Villa"
    expect(page).to have_content "City Apartment"


    click_on 'SUBMIT'
  end 
end

feature 'Book space page' do
  scenario 'it allows you to list your space' do
    visit '/book-space'
    click_on 'List a space'
    expect(page.html).to eq '/list-space'
  end 
end