class filler {
    // 指定範囲を指定軌道を並べて埋める
    function fillWay(player, start, end, way) {
        local is_nw = shouldNW(start, end);

        if (is_nw) {
            foreach(x in stepGenerator(start.x, end.x)) {
                local arr = coord3d(x, start.y, start.z);
                local dest = coord3d(x, end.y, end.z);
                command_x.build_way(player, arr, dest, way, true);
            }
        } else {
            foreach(y in stepGenerator(start.y, end.y)) {
                local arr = coord3d(start.x, y, start.z);
                local dest = coord3d(end.x, y, end.z);
                command_x.build_way(player, arr, dest, way, true);
            }
        }
    }

    // 指定範囲を指定架線を並べて埋める
    function fillWayObj(player, start, end, wayObj) {
        local tool = command_x(tool_build_wayobj);

        foreach(x in stepGenerator(start.x, end.x)) {
            foreach(y in stepGenerator(start.y, end.y)) {
                tool.work(player, coord3d(x, y, start.z), coord3d(x, y, start.z), "third_rail");
            }
        }
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

    // 指定範囲を指定プラットフォームで埋める
    function fillPlatform(player, start, end, building) {
        foreach(x in stepGenerator(start.x, end.x)) {
            foreach(y in stepGenerator(start.y, end.y)) {
                local pos = coord3d(x, y, start.z);
                command_x.build_station(player, pos, building);
            }
        }
    }

    // 指定範囲を撤去する
    function clear(player, start, end) {
        local tool = command_x(tool_remover);
        local limit = 10;

        foreach(x in stepGenerator(start.x, end.x)) {
            foreach(y in stepGenerator(start.y, end.y)) {
                local tile = square_x(x, y).get_ground_tile();
                local count = 0;
                local res = null;
                while (!tile.is_empty() && !res && count < limit) {
                    res = tool.work(player, tile);
                    count++;
                }
                if (res) {
                    gui.add_message_at(player, "削除に失敗しました", coord(x, y));
                }
            }
        }
    }
    // 敷設方角を決める。長辺方向へ線路を引く
    function shouldNW(start, end) {
        return len(start.x, end.x) <= len(start.y, end.y);
    }

    // 距離
    function len(a, b) {
        return a > b ? a - b : b - a;
    }
}
