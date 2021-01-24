class filler {
    // 指定範囲を指定軌道を並べて埋める
    function fillWay(player, start, end, way) {
        local is_ns = _shouldNS(start, end);

        if (is_ns) {
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
        foreach(x in stepGenerator(start.x, end.x)) {
            foreach(y in stepGenerator(start.y, end.y)) {
                local pos = coord3d(x, y, start.z);
                command_x.build_wayobj(player, pos, pos, wayObj);
            }
        }
    }

    // 指定範囲を指定架線を並べて埋める
    function fillSign(player, start, end, sign) {
        foreach(x in stepGenerator(start.x, end.x)) {
            foreach(y in stepGenerator(start.y, end.y)) {
                local pos = coord3d(x, y, start.z);
                try {
                    command_x.build_sign_at(player, pos, sign);
                } catch (e) {
                    // 軌道が無いマスで実行するとエラーになるので華麗にスルー
                }
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

    // 指定範囲を1回のみ撤去する
    function clearOnce(player, start, end) {
        _clearMultiple(player, start, end, 1);
    }

    // 指定範囲を全撤去する
    function clear(player, start, end) {
        _clearMultiple(player, start, end, 10);
    }

    function _clearMultiple(player, start, end, limit) {
        local tool = command_x(tool_remover);

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
    function _shouldNS(start, end) {
        return _len(start.x, end.x) <= _len(start.y, end.y);
    }

    // 距離
    function _len(a, b) {
        return a > b ? a - b : b - a;
    }
}

class GridBuilder {
    gridRule = null;
    constructor(r) {
        gridRule = r;
    }

    function build(player, way, start, end) {
        _buildNW(player, way, start, end);
        _buildES(player, way, start, end);
    }

    // 南北方向
    function _buildNW(player, way, start, end) {
        local sx = min(start.x, end.x);
        local sy = min(start.y, end.y);
        local ex = max(start.x, end.x);
        local ey = max(start.y, end.y);

        local x = sx;
        local isWayMode = true;
        foreach(count in gridRule.generateXRule()) {
            for (local c = 0; c < count; c++) {
                if (isWayMode) {
                    local arr = coord3d(x, sy, start.z);
                    local dest = coord3d(x, ey, end.z);
                    command_x.build_way(player, arr, dest, way, true);
                }
                x++;
                if (x > ex) {
                    return;
                }
            }
            isWayMode = !isWayMode;
        }
    }
    // 東西方向
    function _buildES(player, way, start, end) {
        local sx = min(start.x, end.x);
        local sy = min(start.y, end.y);
        local ex = max(start.x, end.x);
        local ey = max(start.y, end.y);

        local y = sy;
        local isWayMode = true;
        foreach(count in gridRule.generateYRule()) {
            for (local c = 0; c < count; c++) {
                if (isWayMode) {
                    local arr = coord3d(sx, y, start.z);
                    local dest = coord3d(ex, y, end.z);
                    command_x.build_way(player, arr, dest, way, true);
                }
                y++;
                if (y > ey) {
                    return;
                }
            }
            isWayMode = !isWayMode;
        }
    }
}

class GridRule {
    xRule = null;
    yRule = null;
    //https://regexper.com/#grid%3A%28%5Cd%2B%29%28%2C%28%5Cd%2B%29%29%2B%28%5C%2F%28%5Cd%2B%29%28%2C%28%5Cd%2B%29%29%2B%29%7B0%2C1%7D
    validator = regexp("grid:(\\d+)(,(\\d+))+(\\/(\\d+)(,(\\d+))+){0,1}");

    constructor(str) {
        _parseRule(str);
    }

    // 建設ルールの妥当性を検証
    function isValid(str) {
        return validator.match(str);
    }

    // ルール文字列を読み取る
    function _parseRule(str) {
        local rules = split(split(str, ":")[1], "/");
        xRule = split(rules[0], ",").map(function(v) {
            return v.tointeger();
        });
        // 東西方向未定義なら南北と同じにする
        yRule = rules.len() < 2 ? xRule : split(rules[1], ",").map(function(v) {
            return v.tointeger();
        });
    }

    function generateXRule() {
        while (1) {
            foreach(x in xRule) {
                yield x;
            }
        }
    }

    function generateYRule() {
        while (1) {
            foreach(y in yRule) {
                yield y;
            }
        }
    }

}
