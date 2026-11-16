def sum (a : Array Nat) : Nat :=
    a.foldl (· + ·) 0

theorem sum_push (a : Array Nat) (x : Nat) :
  sum (a.push x) = sum a + x := by
  simp [sum]
