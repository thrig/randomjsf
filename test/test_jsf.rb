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

    def test_extract
        x = RandomJsf.new 1
        y = %w[a b c]
        assert_equal 'a', x.extract!(y)
        assert_equal 'c', x.extract!(y)
        assert_equal 'b', x.extract!(y)
        assert_nil        x.extract!(y)
    end

    def test_pick
        x = RandomJsf.new 1
        y = %w[a b c]
        z = %w[a b c]
        assert_equal 'a', x.pick(y)
        assert_equal 'a', x.pick(y)
        assert_equal 'c', x.pick(y)
        # that array has not been mutated
        assert_equal y, z
        # pick from empty array (some might instead want this case to
        # throw an error?)
        assert_nil        x.pick([])
    end

    def test_shuffle
        x = RandomJsf.new 1
        y = %w[]
        z = %w[]
        # this probably needs a "lives_ok" type test to wrap it?
        x.shuffle!(y)
        assert_equal y, z

        y = %w[a]
        z = %w[a]
        # and this one, too
        x.shuffle!(y)
        assert_equal y, z

        y = %w[a b]
        x.shuffle!(y)
        assert_equal %w[b a], y

        # TODO really should see if the shuffle or RNG has any
        # significant bias, but that's more work (see Game::Xomb
        # fisher_yates_shuffle tests in t/20-misc.t)
    end
end
