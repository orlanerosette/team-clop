
feature 'Book space page' do
  scenario 'it allows you to look at listings' do
    visit '/book-space'

    expect(page).to have_content "Beach Villa"
    expect(page).to have_content "A beautiful private villa near the beach."

    expect(page).to have_content "City Apartment"
    expect(page).to have_content "A modern studio in the heart of the city."

  end 
end

feature 'Book space page' do
  scenario 'list a space button exists' do
    visit '/book-space'
    click_on 'List a space'
    expect(page.current_path).to eq '/list-space'
  end 
end

feature 'Book space page' do
  scenario 'it allows you to click on a listing' do
    visit '/book-space'
    click_button "beach_villa"
    expect(page.current_path).to eq "/beach-villa"
  end 
end

feature 'Book space page' do
  scenario 'it allows you to click on a listing' do
    visit '/book-space'
    click_button "city_apartment"
    expect(page.current_path).to eq "/city-apartment"
  end 
end
