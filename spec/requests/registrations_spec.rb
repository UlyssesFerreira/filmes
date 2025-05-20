require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /users" do
    context "com informações válidas" do
      it "registra um usuario" do
        post user_registration_path, params: { user: { name: "Teste", email: "teste@teste.com", password: "senha123", password_confirmation: "senha123" } }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("Sair")
      end
    end

    context "com informações inválidas" do
      it "devolve o formulário com erros" do
        post user_registration_path, params: { user: { name: "Teste", email: "teste@", password: "123", password_confirmation: "123" } }
        expect(response.body).to include("Email is invalid")
        expect(response.body).to include("Password is too short")
      end
    end
  end
end
