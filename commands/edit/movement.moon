{
  up: (engine, _, args, prompt) ->
    if tonumber args[1]
      for _ = 1, tonumber args[1]
        engine\up!
      prompt\reply "Went up #{tonumber args[1]} lines!"
    else
      engine\up!
    return prompt\redo!

  down: (engine, _, args, prompt) ->
    if tonumber args[1]
      for _ = 1, tonumber args[1]
        engine\down!
      prompt\reply "Went down #{tonumber args[1]} lines!"
    else
      engine\down!
    return prompt\redo!

  "goto": (engine, _, args, prompt) ->
    line = tonumber args[1]

    unless line
      prompt\reply 'Invalid number!'
    
    if line > #engine.lines
      return prompt\reply "Out of range [1 - #{#engine.lines}]!"

    if line < 1
      return prompt\reply "Out of range [1 - #{#engine.lines}]!"

    engine.pos = line
    return prompt\redo!
}