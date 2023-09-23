class JournalLine < ApplicationRecord
  belongs_to :journal
  belongs_to :account

  monetize :debit_cents, allow_nil: true
  monetize :credit_cents, allow_nil: true

  #validates :debit, numericality: true, allow_nil: true
  #validates :credit, numericality: true, allow_blank: true

  validate :both_debit_and_credit_cannot_be_empty

  #before_validation :set_defaults

  private

  def both_debit_and_credit_cannot_be_empty
    debit_zero_or_blank = debit.blank? || debit.zero?
    credit_zero_or_blank = credit.blank? || credit.zero?

    if debit_zero_or_blank && credit_zero_or_blank
      errors.add(:debit, "debit and credit cannot both be zero")
      errors.add(:credit, "debit and credit cannot both be zero")
    elsif !(debit_zero_or_blank || credit_zero_or_blank)
      errors.add(:debit, "either debit or credit must be zero")
      errors.add(:credit, "either debit or credit must be zero")
    end
  end

  def set_defaults
    @debit = 0 if debit.nil? || debit.blank?
    @credit = 0 if credit.blank?
  end
end
