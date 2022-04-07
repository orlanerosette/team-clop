
feature 'Beach villa page' do
  scenario 'it allows you to request a booking' do
    visit "/beach-villa"
    fill_in 'date_from', with: '2022-05-05'
    fill_in 'date_to', with: '2022-05-14'
    click_on 'Request to Book'

  end 
end