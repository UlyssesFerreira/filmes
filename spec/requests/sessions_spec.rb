require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "POST /users/sign_in" do
    context "com credenciais válidas" do
      it "usuario faz login" do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("Sair")
      end
    end

    context "com credenciais inválidas" do
      it "devolve o formulário com erro" do
        post user_session_path, params: { user: { email: user.email, password: "senhaerrada123" } }
        expect(response.body).to include("Invalid Email or password.")
      end
    end
  end

  describe "DELETE /users/sign_out" do
    it "usuario faz logout" do
      sign_in user
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end
end
