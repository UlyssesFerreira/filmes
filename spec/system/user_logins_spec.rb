require 'rails_helper'

RSpec.describe "UserLogins", type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: "Teste", email: "teste@teste.com", password: "123123")
  end

  it "permite que o usuario faça login com sucesso" do
    visit new_user_session_path

    fill_in "Email", with: "teste@teste.com"
    fill_in "Senha", with: "123123"
    click_button "Entrar"

    expect(page).to have_content("Sair")
  end

end
