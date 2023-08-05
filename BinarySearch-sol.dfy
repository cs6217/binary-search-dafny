// This example is adapted from
// https://github.com/dafny-lang/dafny/blob/master/Test/dafny4/BinarySearch.dfy

newtype int32 = x | -0x8000_0000 <= x < 0x8000_0000

predicate sorted(a: array<int>)
   requires a != null
   reads a
{
   forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}

method BinarySearchInt32(a: array<int>, value: int) returns (index: int32)
   requires a.Length < 0x8000_0000
   requires a != null && 0 <= a.Length && sorted(a)
   ensures 0 <= index ==> index < a.Length as int32 && a[index] == value
   ensures index < 0 ==> forall k :: 0 <= k < a.Length ==> a[k] != value
{
   var low := 0 as int32;
   var high := a.Length as int32;
   while low < high
      invariant 0 <= low <= high <= a.Length as int32
      invariant forall i ::
         (0 <= i < a.Length as int32) && !(low <= i < high) ==> a[i] != value
   {
      var mid := low + (high - low) / 2;
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