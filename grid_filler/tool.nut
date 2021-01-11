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

function exit(pl) {
    return true;
}

function do_work(pl, start, end) {
    local label = of .findLabel();
    if (!label) {
        return of.getMissingObjText("マーカー");
    }
    if (!GridRule.isValid(label.get_text())) {
        return label.get_text() + "は正しい建設ルールの書式ではありません。"
    }

    local way = of .findWay();
    if (!way) {
        return of.getMissingObjText("軌道");
    }

    local rule = GridRule(label.get_text());
    local builder = GridBuilder(rule);

    builder.build(pl, way, start, end);
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}

function is_valid_pos(pl, pos, start) {
    return 2;
}