require 'spec'
require 'spec/autorun'

require File.dirname(__FILE__) + '/../lib/siret'

describe Siret do
  describe ".checksum" do
    it "should convert the given argument to a string" do
      (arg = mock).should_receive(:to_s).and_return ""
      Siret.checksum(arg)
    end
    
    it "should compute Luhn SIRET checksum" do
      Siret.checksum(73282932000074).should == 50
    end
  end
  
  describe ".valid?" do
    it "should convert the given argument to a string" do
      (arg = mock).should_receive(:to_s).and_return ""
      Siret.valid?(arg)
    end
    
    it "should return `true` given a valid SIRET number" do
      Siret.valid?(73282932000074).should be_true
    end
    
    it "should return `false` given an invalid SIRET number" do
      Siret.valid?(0).should be_false
      Siret.valid?("a" * 14).should be_false
      Siret.valid?(73282932000075).should be_false
    end
  end
  
  describe ".generate" do
    it "should return a valid SIRET number" do
      Siret.valid?(Siret.generate).should be_true
    end
    
    # If this example fails, go play lottery, or not...
    it "should generate different (random) SIRET numbers" do
      Siret.generate.should_not == Siret.generate
    end
  end
end
