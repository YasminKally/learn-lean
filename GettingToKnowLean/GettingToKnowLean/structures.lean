-- Examples

structure Point where
  x: Float
  y: Float

structure Point3D where
  x: Float
  y: Float
  z: Float

def origin : Point := {x := 0.0, y := 0.0}
def origin3D : Point3D := {x := 0.0, y := 0.0, z := 0.0}

def addPoints (p1 : Point) (p2 : Point) : Point :=
  {x := p1.x + p2.x, y := p1.y + p2.y}

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

-- Exercises

structure RectangularPrism where
  height: Float
  width: Float
  depth: Float

structure Segment where
  A : Point
  B : Point

def volume (r : RectangularPrism) : Float :=
  r.depth * r.width * r.height

def lenght (s : Segment) : Float :=
  Float.sqrt (((s.B.x - s.A.x) ^ 2.0) + ((s.B.y - s.A.y) ^ 2.0))

