include("../lib_obj_finder_v2");
include("../lib_mark_v1");
include("../lib_filler_v2");

local of = null;
local area = [
    [0, 0, -10],
    [10, 10, 10]
];

function init(pl) {
    of = ObjFinder(pl, area);
    return true;
}

function do_work(pl, start, end) {

    local way = of .findWay();
    if (!way) {
        return of.getMissingObjText("軌道");
    }
    filler.fillWay(pl, start, end, way);

    local wayObj = of .findWayObj(way);
    if (wayObj) {
        filler.fillWayObj(pl, start, end, wayObj);
    }
    local platform = of .findPlatform(way);
    if (platform) {
        filler.fillPlatform(pl, start, end, platform);
    }
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}
