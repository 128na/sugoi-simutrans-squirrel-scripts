//  constants
local way_types = [
  wt_road, wt_rail, wt_water, wt_monorail, wt_maglev, wt_tram, wt_narrowgauge, wt_air, wt_power
];
local system_types = [
  st_flat, st_elevated, st_tram
];

function getWayByName(name) {
  foreach(way_type in way_types) {
    foreach (system_type in system_types) {
      foreach (w in way_desc_x.get_available_ways(way_type, system_type)) {
        if(w.get_name()==name) {
          return w;
        }
      }
    }
  }
}

// returns [min, max]
function mm(a, b) {
  if(a<b) {
    return [a, b]
  } else {
    return [b, a]
  }
}
