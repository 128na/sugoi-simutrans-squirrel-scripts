include("../lib_obj_finder_v1");
include("../lib_mark_v1");
include("../lib_filler_v1");

local of = null;
local area = [
    [0, 0, -10],
    [10, 10, 10]
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
    gui.add_message_at(pl, "範囲軌道敷設実行：" + way.get_name(), coord(start.x, start.y));
    filler.fillWay(pl, start, end, way);
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}

function is_valid_pos(pl, pos, start) {
    return 2;
}
