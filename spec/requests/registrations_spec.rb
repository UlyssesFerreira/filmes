require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describre "POST /users" do
    context "com informações válidas" do
      it "registra um usuario" do
        post user_registration_path, params: { user: { email: "teste@teste.com", password: "senha123", password_confirmation: "senha123" } }
      end
    end
  end
end
