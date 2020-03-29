require 'minitest/autorun'
require 'randomjsf'

class JsfTest < Minitest::Test
    def test_seed
        x = RandomJsf.new 42
        assert_equal 1230419127, x.irand
        assert_equal 4080097750, x.irand
        assert_equal 2014035305, x.irand
    end
    def test_coinflip
        x = RandomJsf.new 42
        assert_equal 1, x.coinflip
        assert_equal 0, x.coinflip
        assert_equal 1, x.coinflip
    end
end
