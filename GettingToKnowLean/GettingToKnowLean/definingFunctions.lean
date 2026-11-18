-- Examples
def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

def spaceBetween (before : String) (after : String) : String :=
  String.append before (String.append " " after)

-- Exercises

def joinStringsWith (first : String) (second : String) (third : String) : String :=
  String.append second (String.append first third)

def recPrismVolume (height : Nat) (width : Nat) (depth : Nat) : Nat :=
  depth * width * height
