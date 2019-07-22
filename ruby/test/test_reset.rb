# -*- ruby encoding: utf-8 -*-

gem 'minitest'
require "minitest/autorun"
require "reset"

class TestReset < Minitest::Test

  def test_initialization_with_one_element_or_array
    assert_equal Reset.new(1), Reset.new([1])
  end



  def test_union
    assert_equal Reset.new(1) | Reset.new(2), Reset.new([1, 2])
  end



  def test_intersection
    assert_equal Reset.new([1, 2, 3]) & Reset.new([1, 2, 4]), Reset.new([1, 2])
    assert_equal Reset.new(1) & Reset.new(2), Reset.new([])
  end



  def test_difference
    assert_equal Reset.new([1]).subset?(Reset.new([1, 2])), true
    assert_equal Reset.new([1, 3]).subset?(Reset.new([1, 2])), false
  end



  def test_contains?
    assert_equal Reset.new([1, 2]).contains?(Reset.new([1, 2])), true
    assert_equal Reset.new([1, 2]).contains?(1), true
    assert_equal Reset.new([]).contains?(1), false
  end



  def test_empty?
    assert_equal Reset.new([1, 2]).empty?, false
    assert_equal Reset.new.empty?, true
  end



  def test_size
    assert_equal Reset.new([1, 2]).size, 2
    assert_equal Reset.new.size, 0
  end



  def test_add
    assert_equal Reset.new([1, 2]).add(3), Reset.new([1, 2, 3])
    assert_equal Reset.new([1, 2]).add([3, 4]), Reset.new([1, 2, 3, 4])
  end



  def test_remove
    assert_equal Reset.new([1, 2]).remove(1), Reset.new([2])
    assert_equal Reset.new([1, 2]).remove([3, 2]), Reset.new([1])
  end



  def test_symmetry
    assert_equal Reset.new([1, 2, 3]).symmetry(Reset.new([2, 3, 4])), Reset.new([1, 4])
  end



  def test_elements_order_doesnt_matter
    assert_equal Reset.new([1, 2, 3]), Reset.new([3, 2 ,1])
  end



  def test_different_element_data_types
    assert_equal Reset.new([nil, true, 'false']), Reset.new([true, 'false', nil])
  end
end










