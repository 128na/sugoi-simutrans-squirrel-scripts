//  constants
local way_types = [
    wt_road, wt_rail, wt_water, wt_monorail, wt_maglev, wt_tram, wt_narrowgauge, wt_air, wt_power
];
local system_types = [
    st_flat, st_elevated, st_tram
];

class ObjFinder {
    player = null;
    area = null;

    constructor(pl, a = [
        [0, 0, -1],
        [10, 10, 1]
    ]) {
        player = pl;
        area = a;
    }

    function coord3dGenerator() {
        for (local x = area[0][0]; x <= area[1][0]; x++) {
            for (local y = area[0][1]; y <= area[1][1]; y++) {
                for (local z = area[0][2]; z <= area[1][2]; z++) {
                    yield coord3d(x, y, z);
                }
            }
        }
        return null;
    }

    function availableWayGenerator() {
        foreach(w in way_types) {
            foreach(s in system_types) {
                foreach(w in way_desc_x.get_available_ways(w, s)) {
                    yield w;
                }
            }
        }
    }

    function findWay() {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local obj = tile.find_object(mo_way);
            if (obj) {
                foreach(way in availableWayGenerator()) {
                    if (way.get_name() == obj.get_name()) {
                        return way;
                    }
                }
            }
        }
    }
}
