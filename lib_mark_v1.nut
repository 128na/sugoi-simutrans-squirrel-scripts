// 指定座標間を囲う形で建設中マーカーを設置する
function mark(start, end) {
    local sx = min(start.x, end.x);
    local sy = min(start.y, end.y);
    local ex = max(start.x, end.x);
    local ey = max(start.y, end.y);

    for (local x = sx; x <= ex; x++) {
        mark_tile(coord3d(x, sy, start.z));
        mark_tile(coord3d(x, ey, start.z));
    }
    for (local y = sy + 1; y < ey; y++) {
        mark_tile(coord3d(sx, y, start.z));
        mark_tile(coord3d(ex, y, start.z));
    }
}
