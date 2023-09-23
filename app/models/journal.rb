class Journal < ApplicationRecord
  has_many :journal_lines, inverse_of: :journal
  accepts_nested_attributes_for :journal_lines,
                                reject_if: lambda { |attributes| attributes['debit']
                                                                   .blank? && attributes['credit'].blank? }
  validates_associated :journal_lines
end
