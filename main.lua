require('framework.init')

local StateMachine = import("framework.StateMachine")

function demo1()
    local fsm = StateMachine.new()
    fsm = fsm:setupState({
            initial = "green",
            events  = {
                {name = "warn",  from = "green",  to = "yellow"},
                {name = "warn",  from = "yellow",  to = "yellow"},
                {name = "panic", from = "green",  to = "red"   },
                {name = "calm",  from = "red",    to = "yellow"},
                {name = "clear", from = "yellow", to = "green" },
                {name = "rest", from = "*", to = "rest"},
            },
            callbacks = {
                onbeforestart = function(event) print("[FSM] STARTING UP") end,
                onstart       = function(event) print("[FSM] READY") end,
                onbeforewarn  = function(event) print("[FSM] START   EVENT: warn!") end,
                onbeforepanic = function(event) print("[FSM] START   EVENT: panic!") end,
                onbeforecalm  = function(event) print("[FSM] START   EVENT: calm!") end,
                onbeforeclear = function(event) print("[FSM] START   EVENT: clear!") end,
                onwarn        = function(event) print("[FSM] FINISH  EVENT: warn!") end,
            },
    })
    fsm:doEvent("warn", "some msg1n")
    fsm:doEvent("warn", "some msg1n")
    fsm:doEvent("rest", "some msg2")
    echoInfo(fsm:getState())
end

demo1()    
