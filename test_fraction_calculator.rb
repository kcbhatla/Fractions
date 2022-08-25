# File: test_fraction_calculator.rb
require_relative "fraction_calculator"
require "test/unit"

class TestFractionCalculator < Test::Unit::TestCase

  def test_simple
    assert_equal("1_1/4", FractionCalculator.new("FracCalc").compute("? 1/2 + 3/4") )
  end

  def test_typecheck
    assert_raise( RuntimeError ) { FractionCalculator.new("? x + y") }
  end

  def test_failure
    assert_equal(3, FractionCalculator.new("? 1/2 + 1/2").add(" - 3/4"), "Adding doesn't work")
  end

end