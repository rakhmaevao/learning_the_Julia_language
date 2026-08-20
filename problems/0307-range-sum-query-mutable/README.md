# 307. Range Sum Query - Mutable

**Сложность:** Medium  
**Темы:** Binary Indexed Tree, Segment Tree  
**LeetCode:** https://leetcode.com/problems/range-sum-query-mutable/description/

---

Given an integer array _nums_ , find the sum of the elements between indices
_i_ and _j_ ( _i_ ≤ _j_ ), inclusive.

The _update(i, val)_ function modifies _nums_ by updating the element at index
_i_ to _val_.

**Example:**



    Given nums = [1, 3, 5]

    sumRange(0, 2) -> 9
    update(1, 2)
    sumRange(0, 2) -> 8




**Constraints:**

  * The array is only modifiable by the _update_ function.
  * You may assume the number of calls to _update_ and _sumRange_ function is distributed evenly.
  * `0 <= i <= j <= nums.length - 1`
