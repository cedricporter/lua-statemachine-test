-- Author: Hua Liang[Stupid ET] <et@everet.org>
require 'StateMachine'

function main()
    local fsm = StateMachine.new()
    -- （注：和demo不同的是，demo采用组件形式完成的初始化）
    fsm:setupState({
            initial = "green",
            events  = {
                {name = "warn",  from = "green",  to = "yellow"},
                {name = "panic", from = "green",  to = "red"   },
                {name = "calm",  from = "red",    to = "yellow"},
                {name = "clear", from = "yellow", to = "green" },
            }
    })

main()    
