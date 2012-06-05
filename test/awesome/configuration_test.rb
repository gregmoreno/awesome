require 'helper'

describe 'configuration' do

  after do
    Awesome.reset
  end

  describe '.configure' do
    Awesome::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do 
        Awesome.configure do |config|
          config.send("#{key}=", key)
          Awesome.send(key).must_equal key
        end
      end
    end
  end

  Awesome::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Awesome.send(key).must_equal Awesome::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

end
