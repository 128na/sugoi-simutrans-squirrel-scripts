class ObjFinder {
    player = null;
    area = null;

    constructor(pl, a = [
        [0, 0, -2],
        [10, 10, 2]
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
    }


    function getMissingObjText(type) {
        return "範囲" + "[" + area[0][0] + ", " + area[0][1] + ", " + area[0][2] +
            "] - [" + area[1][0] + ", " + area[1][1] + ", " + area[1][2] + "]" + "に" + type + "がありません。";
    }

    function findWay() {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local obj = tile.find_object(mo_way);

            local hasOwnedWay = obj && obj.get_owner().get_name() == player.get_name();
            if (hasOwnedWay) {
                return obj.get_desc();
            }
        }
    }

    function findWayObj(way) {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local obj = tile.find_object(mo_wayobj);

            local hasOwnedWay = obj && obj.get_owner().get_name() == player.get_name();
            if (hasOwnedWay) {
                return obj;
            }
        }
    }

    function findPlatform(way) {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local objWay = tile.find_object(mo_way);

            local isSameWayType = objWay && objWay.get_waytype() == way.get_waytype();
            if (isSameWayType) {
                local objPl = tile.find_object(mo_building);

                local hasOwnedPlatform = objPl &&
                    objPl.get_owner().get_name() == player.get_name();
                if (hasOwnedPlatform) {
                    return objPl.get_desc();
                }
            }
        }

    }
}
