# -*- ruby encoding: utf-8 -*-
class Reset

  # ------ Constants ------ #

  VERSION = '1.0.0'






  # ------ Attributes ------ #

  attr_accessor :elements





  # ------ Public ------ #

  # Set definition constructs a Set object from a list (vector, array, range, etc.) of other objects.
  def initialize(*args)
    @elements = args.flatten
  end



  # The union of two sets is a new Set containing the unique members of those sets.
  def union(set2)
    validate_input_type(set2)
    self.class.new(@elements | set2.elements)
  end


  # The intersection of two sets is a new Set of all objects that are members of both sets.
  def intersection(set2)
    validate_input_type(set2)
    self.class.new(@elements & set2.elements)
  end



  # The difference of two sets is a new Set of all members of the first set that are not part of the second set.
  def difference(set2)
    validate_input_type(set2)
    self.class.new(@elements - set2.elements)
  end



  # The subset tests whether the first set is a subset of the second set.
  def subset?(set2)
    # an empty set is a subset of all subset
    return true if self.empty?

    difference(set2).elements.empty?
  end



  # A set contains an element x if that value is in the set.
  def contains?(input)
    # an empty set doesn't contain any elements
    return false if self.empty?

    set2 = input.is_a?(self.class) ? input : self.class.new(input)
    intersection(set2).elements.any?
  end



  # A set is empty if there are no elements in the set.
  def empty?
    @elements.empty?
  end



  # A set can return the number of elements in itself.
  def size
    @elements.size
  end



  # A dynamic set can have elements added to or removed from itself.
  def add(*elements)
    @elements |= elements.flatten
    self
  end



  def remove(*elements)
    @elements -= elements.flatten
    self
  end



  # The symmetric difference of two sets is a new Set of all objects that are members of exactly one set, but not both
  def symmetry(set2)
    validate_input_type(set2)
    (self | set2).difference(self & set2)
  end



  def ==(set2)
    difference(set2).empty? && set2.difference(self).empty?
  end






  # ------ Private ------ #

  private

  def validate_input_type(input)
    raise "The passed argument is of type #{self.class.name}" unless input.is_a? self.class
  end



  # ------ Aliases ------ #

  alias | union
  alias & intersection
  alias - difference
end
