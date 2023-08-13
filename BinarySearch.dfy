// Dafny has unbounded integers, hence we will artificially coerse them into int32
newtype int32 = x | -0x8000_0000 <= x < 0x8000_0000

predicate sorted(a: array<int>)
   requires a != null
   reads a
{
   forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}

// We make sure that indices of the array are within `int32`
// Q: Why the type of `a` is `array<int>`?
method BinarySearchInt32(a: array<int>, value: int) returns (index: int32)
{
   var low := 0 as int32;
   var high := a.Length as int32;
   while low < high
   {
      var mid := (low + high) / 2;
      if a[mid] < value
      {
         low := mid + 1;
      }
      else if value < a[mid]
      {
         high := mid;
      }
      else
      {
         return mid;
      }
   }
   return -1;
}