require_relative "../bench_lib"

require "minitest"
require "minitest/autorun"

class TestBenchLib < Minitest::Test
  include BenchLib
  def test_combinations_simple
    assert_equal [
        ["a", "d", "e", "g"],
        ["a", "d", "f", "g"],
        ["b", "d", "e", "g"],
        ["b", "d", "f", "g"],
        ["c", "d", "e", "g"],
        ["c", "d", "f", "g"],
    ], combination_set([["a", "b", "c"], ["d"], ["e", "f"], ["g"]])
  end

  def test_combinations_single
    assert_equal [
        ["a", "b", "c", "d"],
    ], combination_set([["a"], ["b"], ["c"], ["d"]])
  end

  def test_combinations_one
    assert_equal [
        ["a"],
    ], combination_set([["a"]])
  end

  def test_combinations_one_hash_one
    assert_equal [
        [{a: 1}],
    ], combination_set([[{a: 1}]])
  end

  def test_combinations_two_hash
    assert_equal [
        [{}],
        [{a: 1}],
    ], combination_set([[{}, {a: 1}]])
  end

  def test_combinations_two
    assert_equal [
        ["a", "b"],
    ], combination_set([["a"], ["b"]])
  end

  def test_combinations_single_hash
    assert_equal [
        ["a", "b", "c", {}],
        ["a", "b", "c", { a: 1 }],
    ], combination_set([["a"], ["b"], ["c"], [{}, {a: 1}]])
  end
end
