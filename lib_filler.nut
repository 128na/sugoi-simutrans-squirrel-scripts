class filler {
    function fillWay(player, start, end, way) {
        local x_len = len(start.x, end.x);
        local y_len = len(start.y, end.y);
        local is_nw = shouldNW(x_len, y_len);

        local len = is_nw ? x_len : y_len;
        for (local i = 0; i <= len; i++) {
            local arr = is_nw ?
                coord3d(start.x + i, start.y, start.z) :
                coord3d(start.x, start.y + i, start.z);
            local dest = is_nw ?
                coord3d(start.x + i, end.y, end.z) :
                coord3d(end.x, start.y + i, end.z);

            command_x.build_way(player, arr, dest, way, true);
        }
    }

    /**
     * 敷設方角を決める。長辺方向へ線路を引く
     */
    function shouldNW(x_len, y_len) {
        return x_len <= y_len;
    }

    /**
     * 距離
     */
    function len(a, b) {
        return a > b ? a - b : b - a;
    }
}
