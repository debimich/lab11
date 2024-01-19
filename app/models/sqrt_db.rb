# frozen_string_literal: true

class SqrtDb < ApplicationRecord
  validates :input, uniqueness: true
  validates :input, :result, presence: { message: 'cannot be empty' }
end
