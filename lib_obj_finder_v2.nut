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

    // 指定値間の数値をイテレートする
    function stepGenerator(from, to) {
        if (from < to) {
            for (local i = from; i <= to; i++) {
                yield i;
            }

        } else {
            for (local i = from; i >= to; i--) {
                yield i;
            }
        }
    }

    // 指定座標空間をイテレートする
    function coord3dGenerator() {
        foreach(x in stepGenerator(area[0][0], area[1][0])) {
            foreach(y in stepGenerator(area[0][1], area[1][1])) {
                foreach(z in stepGenerator(area[0][2], area[1][2])) {
                    yield coord3d(x, y, z);
                }
            }
        }
    }

    // 指定名のオブジェクトが指定座標空間にないときのメッセージを返す
    function getMissingObjText(type) {
        return "範囲" + "[" + coord3d(area[0][0], area[0][1], area[0][2]) +
            "] - [" + coord3d(area[1][0], area[1][1], area[1][2]) + "]" + "に" + type + "がありません。";
    }

    // 軌道を指定座標空間から探す
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

    // 指定軌道の架線を指定座標空間から探す
    function findWayObj(way) {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local objWay = tile.find_object(mo_way);
            local isSameWayType = objWay && objWay.get_waytype() == way.get_waytype();
            if (isSameWayType) {
                local objWo = tile.find_object(mo_wayobj);
                local hasOwnedWay = objWo && objWo.get_owner().get_name() == player.get_name();
                if (hasOwnedWay) {
                    return objWo.get_desc();
                }
            }
        }
    }

    // 指定軌道のプラットフォームを指定座標空間から探す
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

    // マーカーを指定座標空間から探す
    function findLabel() {
        foreach(pos in coord3dGenerator()) {
            local tile = tile_x(pos.x, pos.y, pos.z);
            local obj = tile.find_object(mo_label);

            local hasOwnedWay = obj && obj.get_owner().get_name() == player.get_name();
            if (hasOwnedWay) {
                return obj;
            }
        }
    }
}