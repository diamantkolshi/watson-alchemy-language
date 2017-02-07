require 'spec_helper'

describe AlchemyLanguage::ActiveMethod::Extra do
  subject(:extra) { AlchemyLanguage::ActiveMethod::Extra }

  it "has self method that it called add_component" do
    is_expected.to respond_to(:add_response_field)
  end

  describe "define dynamic methods" do
    subject(:instance_extra) { extra.new }

    it "define methods dinamix with define component method" do
      is_expected.not_to respond_to(:test_method)

      extra.add_response_field :test_method

      is_expected.to respond_to(:test_method)
    end
  end
end
