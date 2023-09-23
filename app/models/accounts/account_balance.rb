# frozen_string_literal: true
module Accounts
  class AccountBalance
    attr_reader :debit, :credit

    def initialize(debit: Money.new(0), credit: Money.new(0), balance: nil)
      if balance.nil?
        @debit = debit || Money.new(0)
        @credit = credit || Money.new(0)
      else
        @debit = balance.debit
        @credit = balance.credit
      end
    end

    def debit?
      @debit.positive?
    end

    def credit?
      @credit.positive?
    end

    def zero?
      @debit.zero? && @credit.zero?
    end

    def format
      if debit?
        @debit.format
      elsif credit?
        @credit.format
      else
        Money.new(0).format
      end
      debit? ? @debit.format : credit? ? @credit.format : Money.new(0).format
    end

    def add other
      @debit  += other.debit
      @credit += other.credit

      if @debit == @credit
        @debit = Money.new(0)
        @credit = Money.new(0)
      elsif @debit > @credit
        @debit -= @credit
        @credit = Money.new(0)
      else
        @credit -= @debit
        @debit = Money.new(0)
      end
    end
  end
end