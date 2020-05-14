local helm = import "/dev/stdin";
local processors = import "processors.jsonnet";

[
  std.foldl(function(i, p) i + p, processors, o),
  for o in helm
]
