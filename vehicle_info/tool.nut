local sep = "-----\n";

function work(pl, pos) {
    local message = "";
    local convoy = findConvoyByCoord3d(pos);
    if (!convoy) {
        return "指定マスには車両がありません";
    }
    message += createConvoyMessage(convoy);

    local line = convoy.get_line();
    if (line) {
        message += sep;
        message += createLineInfoMessage(line);
    }
    if (message) {
        gui.add_message_at(pl, message, pos);
        return null;
    }
    return "?";

}

function findConvoyByCoord3d(pos) {
    foreach(cnv in world.get_convoy_list()) {
        local p = cnv.get_pos();
        if (p && p.x == pos.x && p.y == pos.y && p.z == pos.z) {
            return cnv;
        }
    }
}

function createConvoyMessage(convoy) {
    local n = convoy.get_name();
    local c = convoy.get_capacity()[0];
    local t = convoy.get_transported_goods()[0];
    local p = c ? (100 * t) / c : 0;
    return n + "\n" +
        "輸送力: " + c + "/月\n" +
        "実績: " + t + "/月\n" +
        "乗車率: " + p + "%\n";
}

function createLineInfoMessage(line) {
    local n = line.get_name();
    local t = line.get_transported_goods()[0];
    local c = line.get_capacity()[0];
    local p = c ? (100 * t) / c : 0;
    local cv = line.get_convoy_count()[0]
    return "路線名: " + n + "\n" +
        "編成数: " + cv + "編成\n" +
        "輸送力: " + c + "/月\n" +
        "実績: " + t + "/月\n" +
        "乗車率: " + p + "%\n";
}
