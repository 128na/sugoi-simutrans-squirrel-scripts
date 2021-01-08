include("../lib_obj_finder_v1");
include("../lib_mark_v1");
include("../lib_filler_v1");

local of = null;
local area = [
    [0, 0, -2],
    [10, 10, 2]
];

function init(pl) {
    of = ObjFinder(pl, area);
    return true;
}

function exit(pl) {
    return true;
}

function do_work(pl, start, end) {
    local tile = tile_x(start.x, start.y, start.z);
    local obj = tile.find_object(mo_way);
    gui.add_message_at(pl, obj.get_text(), coord(start.x, start.y));
    return;



    local way = of .findWay();
    if (!way) {
        return of.getMissingObjText("軌道");
    }
    local wayObj = of .findWayObj(way);
    if (!wayObj) {
        return of.getMissingObjText("架線");
    }

    filler.fillWay(pl, start, end, way);
    filler.fillWayObj(pl, start, end, wayObj);
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}

function is_valid_pos(pl, pos, start) {
    return 2;
}
