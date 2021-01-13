include("../lib_obj_finder_v2");
include("../lib_mark_v1");
include("../lib_filler_v2");

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

    local way = of .findWay();
    if (!way) {
        return of.getMissingObjText("軌道");
    }
    local sign = of .findSign(way);
    if (!sign) {
        return of.getMissingObjText("標識");
    }

    filler.fillSign(pl, start, end, sign);
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}

function is_valid_pos(pl, pos, start) {
    return 2;
}