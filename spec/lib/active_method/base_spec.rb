require 'spec_helper'
require_relative '../../../lib/alchemy_language/active_method/base'

describe AlchemyLanguage::ActiveMethod::Base do
  subject(:base) { AlchemyLanguage::ActiveMethod::Base }

  it "has self method that it called define_component" do
    is_expected.to respond_to(:define_component)
  end

  context "define dynamic methods" do
    subject(:instance_base) { base.new }

    it "define methods dinamix with define component method" do
      is_expected.not_to respond_to(:test_method)

      base.define_component :test_method

      is_expected.to respond_to(:test_method)
    end

    it "involved class whitch named with name params" do 
    end
  end
end
