// RUN: circt-opt %s | FileCheck %s

// CHECK: fsm.machine
fsm.machine @edge_moore(%inp: i1) -> (i1)
    attributes {stateType = i2} {

  %out = fsm.variable "out" : i1
  %false = constant false
  %true = constant true

  %not_inp = xor %inp, %true : i1

  fsm.state "ZERO" entry  {
      fsm.update %out, %false : i1, i1  
  } exit  {
  } transitions  {
    fsm.transition @THREE guard  {
      fsm.return %inp : i1
    } action  {
    }
  }

  fsm.state "ONE" entry  {
      fsm.update %out, %false : i1, i1  
  } exit  {
  } transitions  {
    fsm.transition @ZERO guard  {
      fsm.return %not_inp : i1
    } action  {
    }
  }

  fsm.state "THREE" entry  {
      fsm.update %out, %true : i1, i1  
  } exit  {
  } transitions  {
    fsm.transition @ZERO guard  {
      fsm.return %not_inp : i1
    } action  {
    }
    fsm.transition @ONE guard  {
    } action  {
    }
  }

  fsm.output %out : i1
}
