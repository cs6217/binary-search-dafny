// Dafny has unbounded integers, hence we will artificially coerse them into int32
newtype int32 = x | -0x8000_0000 <= x < 0x8000_0000

// We make sure that indices of the array are within `int32`
// Q: Why the type of `a` is `array<int>`?
method BinarySearchInt32(a: array<int>, value: int) returns (index: int32)
{
   var low := 0;
   var high := a.Length;
   
   // TODO: implement me!
   return -1;
}