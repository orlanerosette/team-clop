
feature 'List a space page' do
  scenario 'it allows you to add a listing' do
    visit '/list-space'

    expect(page).to have_content "List a space"
    
    fill_in 'first_name', with: 'Will'
    fill_in 'last_name', with: 'Smith'
    fill_in 'description', with: 'Enjoy the life fit for a prince at this mansion!'
    fill_in 'price', with: 100
    fill_in :available_from, with: '12/04/2022'
    fill_in :available_to, with: '20/04/2022'
    click_on 'SUBMIT'
    expect(page.current_path).to eq '/book-space'

  end 
end