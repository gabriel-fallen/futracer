import "misc"

let rotate_point
  ((angle_x, angle_y, angle_z): f32racer.angles)
  ((x_origo, y_origo, z_origo): f32racer.point3D)
  ((x, y, z): f32racer.point3D)
  : f32racer.point3D =
  let (x0, y0, z0) = (x - x_origo, y - y_origo, z - z_origo)

  let (sin_x, cos_x) = (f32.sin angle_x, f32.cos angle_x)
  let (sin_y, cos_y) = (f32.sin angle_y, f32.cos angle_y)
  let (sin_z, cos_z) = (f32.sin angle_z, f32.cos angle_z)

  -- X axis.
  let (x1, y1, z1) = (x0,
                      y0 * cos_x - z0 * sin_x,
                      y0 * sin_x + z0 * cos_x)
  -- Y axis.
  let (x2, y2, z2) = (z1 * sin_y + x1 * cos_y,
                      y1,
                      z1 * cos_y - x1 * sin_y)
  -- Z axis.
  let (x3, y3, z3) = (x2 * cos_z - y2 * sin_z,
                      x2 * sin_z + y2 * cos_z,
                      z2)

  let (x', y', z') = (x_origo + x3, y_origo + y3, z_origo + z3)
  in (x', y', z')

let translate_point
  ((x_move, y_move, z_move): f32racer.point3D)
  ((x, y, z): f32racer.point3D)
  : f32racer.point3D =
  (x + x_move, y + y_move, z + z_move)
