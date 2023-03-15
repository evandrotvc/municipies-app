# frozen_string_literal: true

class Municipe < ApplicationRecord
  has_one_attached :photo

  enum status: { active: 0, inactive: 1 }, _default: :active

  validates :name, :cpf, :cns, :email, :birth_date, :phone, :status, :photo,
    presence: true
  validates :name, length: { minimum: 3 }
  validates :cpf, cpf: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cns, cns: true
  validates :birth_date, pass_date: true
end
