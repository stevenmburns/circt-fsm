// RUN: circt-opt %s | FileCheck %s

// CHECK: fsm.machine
fsm.machine @edge_regmealy(%inp: i1) -> (i1)
    attributes {stateType = i1} {

  %out = fsm.variable "out" : i1
  %true = constant true

  %not_inp = xor %inp, %true : i1

  fsm.state "ZERO" entry  {
  } exit  {
  } transitions  {
    fsm.transition @ONE guard  {
      fsm.return %inp : i1
    } action  {
      fsm.update %out, %true : i1, i1
    }
  }

  fsm.state "ONE" entry  {
  } exit  {
  } transitions  {
    fsm.transition @ZERO guard  {
      fsm.return %not_inp : i1
    } action  {
    }
  }

  fsm.output %out : i1
}
