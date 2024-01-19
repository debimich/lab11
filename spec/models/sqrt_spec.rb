# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SqrtDb, type: :model do
  it 'is not valid without input' do
    sqrt = SqrtDb.new(input: nil)

    expect(sqrt).to_not be_valid
  end

  it 'is valid with input and result' do
    sqrt = SqrtDb.create(input: 2, result: { 2 => 2 })

    expect(sqrt).to be_valid
  end

  it 'find existing record' do
    SqrtDb.create(input: 2, result: { 2 => 2 })

    expect(SqrtDb.find_by(input: 2).present?).to eq true
  end

  it 'dont add record if exists' do
    SqrtDb.create(input: 2, result: { 2 => 2 })

    sqrt = SqrtDb.create(input: 2, result: { 2 => 2 })

    expect(sqrt).to_not be_valid
  end
end
