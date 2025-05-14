require 'rails_helper'

RSpec.describe User, type: :model do
  context "validações" do
    it "é válido" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "é inválido sem name" do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it "é inválido sem email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "é inválido com senha menor que 6 caracteres" do
      user = build(:user, password: "123")
      expect(user).not_to be_valid
    end

    it "é inválido com email duplicado" do
      create(:user)
      user = build(:user)
      expect(user).not_to be_valid
    end

    it "é inválido com email mal formatado" do
      user = build(:user, email: "email_invalido")
      expect(user).not_to be_valid
    end
  end

  context "comportamento" do
    it "autentica com senha certa" do
      user = create(:user, password: "senhacerta123")
      expect(user.valid_password?("senhacerta123")).to be_truthy
    end

    it "não autentica com senha errada" do
      user = create(:user, password: "senhacerta123")
      expect(user.valid_password?("senhaerrada123")).to be_falsey
    end
  end
end
