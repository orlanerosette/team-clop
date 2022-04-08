require "pg"

feature "Book Space database integration" do
  scenario "Allows user to list a space, displays it on book_space" do

    account = Account.create(first_name: "Sam", last_name: "Smith", email: "samsmith@gmail.com", password: "testPassword")
    listing = Listing.create(owner_id: account.account_id, name: "Townhouse", description: "A beautiful townhouse", price: "100")
    
    visit "/book_space"
    click_on "List a space"
    click_on "SUBMIT"
    expect(page).to have_content "List a space"
    fill_in "property_name", with: "name"
    fill_in "description", with: "desc"
    fill_in "price", with: 100
    fill_in :available_from, with: "12/04/2022"
    fill_in :available_to, with: "20/04/2022"
    click_on "SUBMIT"
    expect(page).to have_content "Book a space"
    expect(page).to have_content "name\ndesc"
    click_button "my_space"
    expect(page).to have_content "name"
    expect(page).to have_content "desc"
    expect(page).to have_content "When would you like to stay?"
    expect(page).to have_content "12/04/2022"
    expect(page).to have_content "20/04/2022"
  end
end
