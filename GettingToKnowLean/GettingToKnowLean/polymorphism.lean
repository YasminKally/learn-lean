-- exercises

-- Write a function to find the last entry in a list. It should return an Option
def last {α : Type} (xs : List α) : Option α :=
  match xs with
  | [] => none
  | [x] => some x
  | _ :: ys => last ys

-- Write a function that finds the first entry in a list that satisfies a given predicate
def List.findFirst? {α : Type} (xs : List α) (predicate : α -> Bool) : Option α :=
  match xs with
  | [] => none
  | x :: ys =>
    if predicate x then
      some x
    else
      List.findFirst? ys predicate

-- Write a function Prod.switch that switches the two fields in a pair for each other
def Prod.switch {α β : Type} (pair : α × β) : β × α :=
  match pair with
  | (α, β) => (β, α)

-- Rewrite the PetName example to use a custom datatype and compare it to the version that uses Sum.
inductive PetName where
  | dog : String -> PetName
  | cat : String -> PetName

def animals : List PetName :=
  [.dog "Spot", .cat "Tiger", .dog "Fifi", .dog "Rex", .cat "Floof"]

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | .dog _ :: morePets => howManyDogs morePets + 1
  | .cat _ :: morePets => howManyDogs morePets

-- Write a function zip that combines two lists into a list of pairs. The resulting list should be as long as the shortest input list.
def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs, ys with
  | [], _ => []
  | _, [] => []
  | x :: xs', y :: ys' => (x, y) :: zip xs' ys'

-- Write a polymorphic function take that returns the first nn entries in a list, where nn is a Nat. If the list contains fewer than nn entries, then the resulting list should be the entire input list
def take {α : Type} (n : Nat) (xs : List α) : List α :=
  match n, xs with
  | 0, _ => []
  | _, [] => []
  | k + 1, x :: ys => x :: take k ys

-- Using the analogy between types and arithmetic, write a function that distributes products over sums. In other words, it should have type α × (β ⊕ γ) → (α × β) ⊕ (α × γ)
def distribute {α β γ : Type} (x : α × (β ⊕ γ)) : (α × β) ⊕ (α × γ) :=
  match x with
  | (a, Sum.inl b) => Sum.inl (a, b)
  | (a, Sum.inr c) => Sum.inr (a, c)

-- Using the analogy between types and arithmetic, write a function that turns multiplication by two into a sum. In other words, it should have type Bool × α → α ⊕ α.
def timesTwoToSum {α : Type} (x : Bool × α) : α ⊕ α :=
  match x with
  | (true, a) => Sum.inl a
  | (false, a) => Sum.inr a
