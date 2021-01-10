function work(pl, pos) {
    gui.add_message_at(pl, "start", pos);

    foreach(convoy in findConvoys(pos)) {
        local message = "";
        message += createConvoyMessage(convoy);
        local line = convoy.get_line();
        if (line) {
            message += "-----\n";
            message += createLineMessage(line);
        }
        if (message) {
            gui.add_message_at(pl, message, pos);
        }
        gui.add_message_at(pl, "end", pos);
    }
    return null;
}

function findConvoys(pos) {
    local tile = tile_x(pos.x, pos.y, pos.z);
    local convoyTypes = [
        mo_car, mo_train, mo_monorail, mo_maglev, mo_narrowgauge, mo_ship, mo_airplane
    ];

    foreach(c in convoyTypes) {
        local cv = tile.find_object(c);
        if (cv) {
            yield cv;
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
        "輸送実績: " + t + "/月\n" +
        "乗車率: " + p + "%\n";
}

function createLineMessage(line) {
    local n = line.get_name();
    local t = line.get_transported_goods()[0];
    local c = line.get_capacity()[0];
    local p = c ? (100 * t) / c : 0;
    local cv = line.get_convoy_count()[0]
    return "路線名: " + n + "\n" +
        "編成数: " + cv + "編成\n" +
        "総輸送力: " + c + "/月\n" +
        "総輸送実績: " + t + "/月\n" +
        "平均乗車率: " + p + "%\n";
}
