context "Login" do
    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Fitness Tracker App")
    end
  end
