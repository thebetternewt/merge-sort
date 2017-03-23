# =============================================================================
# DESCRIPTION: A recursive "merge sort" method written in Ruby.
# USAGE: The merge_sort method takes in an FLAT array of numbers and returns
# a sorted version of the given array.
# =============================================================================


def merge_sort(arr, result=[])
  return arr if arr.size == 1

  # Store arr size for the sake of cleaner code.
  size = arr.size

  # Split arr into two halves (+-1).
  arr1 = arr[0...size/2]
  arr2 = arr[size/2..size]

  # Call recursive merge_sort on arr halves.
  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  # Create pointers.
  arr_p  = 0
  arr1_p = 0
  arr2_p = 0

  # Pick smaller element from two pointers and append to result array.
  while arr1_p < arr1.size && arr2_p < arr2.size
    if arr1[arr1_p] < arr2[arr2_p]
      result << arr1[arr1_p]

      arr1_p += 1 # Increment arr 1pointer.
    else
      result << arr2[arr2_p]
      arr2_p += 1 # Increment arr2 pointer.
    end
    arr_p += 1 # Increment arr pointer.
  end

  # When one list (arr) is exhausted, copy elements of other arr into result array.
  if arr1_p == arr1.size
    result += arr2[arr2_p..arr2.size] # Appent remaining arr2 elements to result.
  else
    result += arr1[arr1_p..arr1.size] # Appent remaining arr1 elements to result.
  end

  return result

end
