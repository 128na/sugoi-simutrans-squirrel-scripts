include("lib");
local selected_way;

function init(player) {
  return true;
}

/**
　* 軌道未選択ならシングルクリック、選択済みなら範囲指定にする
  */
function is_valid_pos(player, start, pos)
{
  if(!selected_way) {
    return 1;
  }
  return 2;
}

function mark_tiles(player, start, end)
{
  local xp = mm(start.x, end.x);
  local yp = mm(start.y, end.y);
  for(local x=xp[0]; x<=xp[1]; x+=1) {
    for(local y=yp[0]; y<=yp[1]; y+=1) {
      local pos = coord3d(x, y, start.z);
      mark_tile(pos);
    }
  }
}

function do_work(player, start, end) {
  // 始点にある軌道オブジェクトを取得する
  local tile = tile_x(start.x, start.y, start.z);
  local obj = tile.find_object(mo_way);

  // 軌道未選択
  if(!selected_way) {
    // 現在位置に軌道がない
    if(!obj) {
      return "最初に軌道をクリックしてください";
    }
    selected_way = getWayByName(obj.get_name());
    return "軌道「"+selected_way.get_name()+"」を選択しました";
  }

  filler.fillWay(player, start, end, selected_way);
  return null;
}


function exit(player)
{
  return null;
}

class filler {
  function fillWay(player, start, end, way) {
    local x_len = len(start.x, end.x);
    local y_len = len(start.y, end.y);
    local is_nw = shouldNW(x_len, y_len);

    local len = is_nw ? x_len : y_len;
    for(local i = 0; i <= len; i++) {
      local arr = is_nw
        ? coord3d(start.x+i, start.y, start.z)
        : coord3d(start.x, start.y+i, start.z);
      local dest = is_nw
        ? coord3d(start.x+i, end.y, end.z)
        : coord3d(end.x, start.y+i, end.z);

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
  function len(a,b) {
    return a > b ? a-b : b-a;
  }
}