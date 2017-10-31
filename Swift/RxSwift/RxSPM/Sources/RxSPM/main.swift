

observableBasicUsage("直接传入序列,并对其进行操作,Rx内部自动通知到订阅者")

observableCreateUsage("自定义通知单到订阅者的策略")

publishSubjectBasicUsage("会员制订阅")

behiviorSubjectBasicUsage("试用制订阅")

replaySubjectBasicUsage("试用制-控制发送给订阅者历史事件的范围")

variableBasicUsage("特殊的Observable - Variable")

skipOperaterBasicUsage("忽略序列中的特定事件")

takeOperaterBasicUsage("获取序列中的特定事件")

toArrayOperateBasicUsage("转换操作toArray的使用")
scanOperateBasicUsage("转换操作scan的使用")
mapOperateBasicUsage("转换操纵map的使用")
flatMapOperateBasicUsage("转化操作flatMap的使用")

combineObservablesBasicUsage("合并多个Observables")

combineEventsBasicUsage("事件合并")

combine_translateBetweenObservables("Observable的传递")









func example(of:String,demo: @convention(block)()->()) {
    
    print(of)
    demo()
}
