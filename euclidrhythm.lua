local EuclidRhythm = {}

EuclidRhythm.__index = EuclidRhythm

function EuclidRhythm.new()
  error("do not instantiate")
end

function EuclidRhythm.beat_as_table(sequence_len, beats_len)
  if (beats_len > sequence_len) then
    error("beats_len should be less than or equal to sequence_len")
  end
  local beat_container = {}
  local has_beat = false
  
  if (beats_len > 0) then
    has_beat = true
    for i=1,beats_len do
      table.insert( beat_container, { 1 } )
    end
  end

  if (sequence_len > 0) then
    for i=1,(sequence_len - beats_len) do
      table.insert( beat_container, { 0 } )
    end
  end

  if (has_beat and #beat_container > 0) then
    return build_rhythm(beat_container)
  else
    return table_flatten(beat_container)
  end
end

function build_rhythm(beat_table)
  local beats = split_beats(beat_table)
  local rest = split_rest(beat_table)

  if(#rest <= 1) then
    return table_flatten({beats, rest})
  else
    return build_rhythm(merge(beats, rest))
  end
end

function merge(beats, rest)
  local beats_clone = {table.unpack(beats)}
  local rest_clone = {table.unpack(rest)}

  for i,part_beat in ipairs(beats_clone) do
    if (i <= #rest) then
      for i,part_rest in ipairs(rest[i]) do
        table.insert(part_beat, part_rest)
      end
    end
  end

  if(#beats - #rest < 0) then
    return merge(beats_clone, {table.unpack(rest, #beats + 1, #rest)})
  else
    return beats_clone
  end
end

function split_beats(beat_table)
  local max_part_beat_len = max_part_length(beat_table)
  local min_part_beat_len = min_part_length(beat_table)

  -- similarly sized sequences
  if((max_part_beat_len > 1) and (max_part_beat_len == min_part_beat_len)) then
    return beat_table
  -- size 1 sequences
  elseif (max_part_beat_len == 1) then
    local beats = {}
    for _,part_beat in ipairs(beat_table) do
      if (part_beat[1] == 1) then
        table.insert(beats, part_beat)
      end
    end
    return beats
  else
    local beats = {}
    for _,part_beat in ipairs(beat_table) do
      if (#part_beat == max_part_beat_len) then
        table.insert(beats, part_beat)
      end
    end
    return beats
  end
end

function split_rest(beat_table)
  local max_part_beat_len = max_part_length(beat_table)
  local min_part_beat_len = min_part_length(beat_table)

  -- similarly sized sequences
  if((max_part_beat_len > 1) and (max_part_beat_len == min_part_beat_len)) then
    return {}
  -- size 1 sequences
  elseif (max_part_beat_len == 1) then
    local rest = {}
    for _,part_beat in ipairs(beat_table) do
      if (part_beat[1] == 0) then
        table.insert(rest, part_beat)
      end
    end
    return rest
  else
    local rest = {}
    for i,part_beat in ipairs(beat_table) do
      if (#part_beat == min_part_beat_len) then
        table.insert(rest, part_beat)
      end
    end
    return rest
  end
end

function max_part_length(beat_table)
  local max_len = 0
  for i,part_beat in ipairs(beat_table) do
    local part_beat_length = #part_beat
    if (max_len < part_beat_length) then
      max_len = part_beat_length
    end
  end
  return max_len
end

function min_part_length(beat_table)
  local min_len = #beat_table[1]
  for _,part_beat in ipairs(beat_table) do
    local part_beat_length = #part_beat
    if (min_len > part_beat_length) then
      min_len = part_beat_length
    end
  end
  return min_len
end

function table_flatten(arr)
  local result = { }
  
  local function flatten(arr)
    for _, v in ipairs(arr) do
      if type(v) == "table" then
        flatten(v)
      else
        table.insert(result, v)
      end
    end
  end
  flatten(arr)
  return result
end

return EuclidRhythm