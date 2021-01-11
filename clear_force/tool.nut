include("../lib_mark_v1");
include("../lib_filler_v2");

function init(pl) {
    return true;
}

function exit(pl) {
    return true;
}

function do_work(pl, start, end) {
    gui.add_message_at(pl, "範囲削除実行", coord(start.x, start.y));
    filler.clear(pl, start, end);
}

function mark_tiles(pl, start, end) {
    mark(start, end);
}

function is_valid_pos(pl, pos, start) {
    return 2;
}