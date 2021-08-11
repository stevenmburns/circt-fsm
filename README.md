# To run
```bash
circt-opt edge_moore.mlir -convert-fsm-to-hw -cse -canonicalize -prettify-verilog | circt-translate -export-verilog
circt-opt edge_regmealy.mlir -convert-fsm-to-hw -cse -canonicalize -prettify-verilog | circt-translate -export-verilog
```
