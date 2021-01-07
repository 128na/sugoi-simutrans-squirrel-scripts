function mm(a, b) {
    if (a < b) {
        return [a, b]
    } else {
        return [b, a]
    }
}

function mark(start, end) {
    local xp = mm(start.x, end.x);
    local yp = mm(start.y, end.y);
    for (local x = xp[0]; x <= xp[1]; x += 1) {
        for (local y = yp[0]; y <= yp[1]; y += 1) {
            local pos = coord3d(x, y, start.z);
            mark_tile(pos);
        }
    }
}
