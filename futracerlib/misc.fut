module type racer_num = {
  type t
}

module racer (num: racer_num) = {
  type t = num.t

  type point2D = {x: t, y: t}
  type point3D = {x: t, y: t, z: t}
  type angles = {x: t, y: t, z: t}
}

module f32racer = racer {
  type t = f32
}

module i32racer = racer {
  type t = i32
}

let fmod (a: f32) (m: f32): f32 =
  a - r32 (t32 (a / m)) * m

let in_range (t: i32) (a: i32) (b: i32): bool =
  (a < b && a <= t && t <= b) || (b <= a && b <= t && t <= a)

let clamp (t: i32) (a: i32) (b: i32): i32 =
  i32.min (i32.max t a) b

let within_bounds
  (smallest: i32) (highest: i32)
  (n: i32): i32 =
  i32.max smallest (i32.min highest n)
