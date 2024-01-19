# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SqrtController, type: :controller do
  describe 'GET /input' do
    it 'has a 200 status code' do
      get :input
      expect(response.status).to eq(200)
    end
  end

  describe 'input validation' do
    let(:controller_instance) { described_class.new }
    it 'returns true' do
      expect(controller_instance.valid(5)).to eq(true)
    end

    it 'returns false' do
      expect(controller_instance.valid(-2)).to eq(false)
    end
  end
end
